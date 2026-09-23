Received: from mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7A946D56A
	for <oe-linux-nfc@lists.linux.dev>; Wed, 23 Sep 2026 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151632; cv=none; b=IaywKYCfixmLAJ60a6YQ/kfW4k9SwO0CZfL9L+GpkphuOTr7gpfHKkfd9O2uXTdthxd7Y82BD3WNGKCA9uvS+DG0PowTbjwAqVnS3R6fuCB2b0QgYLt34aj/Vgp/1iuDNe7CsUZ5jYZFIAoFs3/zNvVYPS6O8C6s7QHM7Lhgsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151632; c=relaxed/simple;
	bh=R+Ds6U5wuCAiLnCQzIIklrn9HSyxI6h07yL9Uj6bAjY=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=LlpVVfIRvK9CmOL2EYS+XUn0fEGCBXxJd3upPFkcPgmJw8qmJHb4wkgm1L9hFOWGsTaUo5rrc2Ya5LugPkl7GDQJAbnNt5wxg4RamZhI7ftUsTlJS3YGyM9YUK1TuxThNjfphzbaxh6/F39VXyewGWey8Bz2JWmSV/L0ONlVhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uBvAQZ6L; arc=none smtp.client-ip=91.218.175.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uBvAQZ6L"
X-Envelope-To: oe-linux-nfc@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=R+Ds6U5wuCAiLnCQzIIklrn9HSyxI6h07yL9Uj6bAjY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790151628; v=1; x=1790756428;
 b=uBvAQZ6LvzkhU8O0it4LoQH6vtJTqAYiBgpCwtZ65OZyahH/QG6VjSIGZ+1WV+UmXCRLK10p
 UZNO5h3L4HIFbbxtDL0Rj8DDg1hcXFnCvpU2s1k0gkcoAWhPKfKDlDnhBNVW2p9OpCWlHLtYZxt
 NUReADSNyYwGk0d5NjPH9kRE=
X-Envelope-To: oe-linux-nfc@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 9cc9c67abd34d5ab;
	Wed, 23 Sep 2026 08:20:27 +0000
X-Mizu-Trace-ID: 9cc9c67abd34d5ab
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 08:20:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Tianchu Chen" <tianchu.chen@linux.dev>
Message-ID: <26701790d50be92af358c7c136948accad963946@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] nfc: st95hf: validate device-reported response length 
 before reading
To: "David Heidelberg" <david@ixit.cz>, sameo@linux.intel.com,
 shikha.singh@st.com
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <e026f741-3c19-47b2-b731-f257361e471c@ixit.cz>
References: <91f49a98dd42655829b7206f0d64cc31ef9c0e95@linux.dev>
 <e026f741-3c19-47b2-b731-f257361e471c@ixit.cz>

September 21, 2026 at 7:02 AM, "David Heidelberg" <david@ixit.cz mailto:d=
avid@ixit.cz?to=3D%22David%20Heidelberg%22%20%3Cdavid%40ixit.cz%3E > wrot=
e:

>=20
>=20On 19/08/2026 16:55, Tianchu Chen wrote:
>=20
>=20>=20
>=20> From: Tianchu Chen <flynnnchen@tencent.com>
> >  st95hf_spi_recv_response() reads a 2-byte header from the device,
> >  derives the total response length from it (up to 1025 bytes via the
> >  long-frame encoding) and then blindly reads len - 2 more bytes into
> >  the caller's buffer, whose size it knows nothing about.
> >  Call sites can be overflowed by a device reporting a large length,
> >  for example, st95hf_irq_thread_handler() passes the data area of a
> >  280-byte skb.
> >  ST95HF datasheet states "In Reader mode it is possible to receive up=
 to
> >  528 bytes of frame data from VICC and TypeB cards", so technically a=
 bogus
> >  NFC tag may trigger the OOB-write if the card-reader's firmware allo=
ws
> >  large packets.
> >  Add a buff_len parameter and reject a device-reported length that do=
es
> >  not fit into the caller's buffer before issuing the second SPI
> >  transfer. Also modify callers to pass their real buffer sizes.
> >  Discovered by Atuin - Automated Vulnerability Discovery Engine.
> >  Fixes: cab47333f0f75 ("NFC: Add STMicroelectronics ST95HF driver")
> >  Cc: stable@vger.kernel.org
> >  Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>
> >  ---
> >  drivers/nfc/st95hf/core.c | 6 ++++--
> >  drivers/nfc/st95hf/spi.c | 7 ++++++-
> >  drivers/nfc/st95hf/spi.h | 2 +-
> >  3 files changed, 11 insertions(+), 4 deletions(-)
> >=20
>=20Hello Tianchu,
>=20
>=20please check and address the Sashiko output.
>=20
>=20Thank you
> David
>=20
>=20[ ... ]
>  > @@ -106,6 +106,11 @@ int st95hf_spi_recv_response(struct st95hf_spi_=
context *spicontext,
>  > else
>  > len +=3D receivebuff[1];
>  >
>  > + if (len > buff_len) {
>  > + mutex_unlock(&spicontext->spi_lock);
>  > + return -E2BIG;
>  > + }
>  > +
>=20
>=20Does this early return path leave the spi chip select (CS) permanentl=
y
> asserted?
>=20
>=20The first spi transfer uses .cs_change =3D 1 to keep the chip select =
active.
> Skipping the second transfer would prevent the chip select from being
> deasserted, potentially deadlocking the device.
>=20
>=20 > /* Now make a transfer to read only relevant bytes */
>  > tx_takedata.rx_buf =3D &receivebuff[2];
>  > tx_takedata.len =3D len - 2;
>

Hi David,

Yes, Sashiko was right on this case, we should gracefully end the spi tra=
nsfer.

V2 patch has been sent: https://lore.kernel.org/all/fe549eb46f9f666f2778e=
7c50198528028cf9528@linux.dev/

Best regards,

Tianchu
