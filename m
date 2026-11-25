Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634656;
	b=2M0XoXe7gHaqxwMJreS/ugXiP546j90uBPSDkMMMld3+Ub5vFdeuSR3JkLRGY8/0znII
	 5qTV7jo0jbpGeL/0aRciC4acxzY5DL2W3N6X4TYB+0pYD6WQXxhgI7Brx+NTbrsDxilU2
	 7tnSZ7EKdKFfl/M8xf9Uo3mJ8Va1hTLUgsbl8gDk737Q/J0q0t6AwhTXv6zNWf9IPwPmz
	 lwm2LJ12FxgyUqoVQZmRJL1kqeIeY1NGXDOW77xQ8rRACMyfOjKZMAJEJYRz+NFl4f+bt
	 IQG7C6+aiGI/kdJCTdGh7j49mdGEw1HtGGghWK53pbr2l+WXn1w71l5f4aysGdpUbhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
	b=Nb8A86puAm9zGMXvEAZ+sn7qAU0ZJHjVbi9LgNYmuiF2dYCUY9yyDE/GVl7AcDn55ILC
	 I6Cz4KlZL/9ES8ZSdlWkFjhRcYKuwrgrabpXl41H3Uia8xLHEedCVchTfFfFN5W496R4A
	 codyW4HCGhvVXfvYzX/+zB1w9UszVOE7k6EpgJH0QjKFFHOylXEYkr1quEzDYNyB5d7g9
	 PQVyS9VjSSlN8+3nqCiiK8DLnMSbimodPOowXExa6rHJL1LZ50RsLFDBEfXFrA0lhKSgc
	 6G87OKW6X9uax7Y9RXyX9ILj4Bc0n+hYs1FhSqQ3HxyMP4JKISjPMV2J58Fo2VqsJ1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QUyf6Mwn;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47530606A33E
	for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 19:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47530606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QUyf6Mwn
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3290965b3a.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 11:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795634656; x=1796239456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
        b=QUyf6MwnyAFghQQnJcBb2epm0eAiEj2fbvcVO+upgH7Kmve7UqKULeuQ6r5qEy0O51
         8pJmCvf3qQQYT+lGs4HaTA/9ffn6laByrXnaGorGHDWbRlmW22NPVJFR0VyripR5sWi5
         ugj4xuNhR5Dju2G9RdSZwtOUdAO+nA0eIP+G7c90GLS8D0dcaJLuSDD/l1g3G9Fwr8Go
         cYJvFGjc7WJ1JtGqh/AGMqFy8JOTDB1EmzBijY4ccCSXETb12u9xl2luxW7AGa+ML4O1
         FdCeVVBzd/5fy2495znQH5MnslRHbq5y7xhxuvYEhd4qiWTHMd/OTRlGHcnE8crcHusc
         tUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634656; x=1796239456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N55gjPKFtoyQEkpZ+mulBFdiGvAn3buEDUMJWwRWBLA=;
        b=ljhghOd3Izk3GwNYBXrO09Ri5pTnHOpUOAd5UNYrJ8SGX0b8HOLP1vC+FdVm/6gxcu
         pKnq0Ymr8e9tL4PMtTp2Axem4L7ClShVAEaYLx+O/NslnyY8SRA2QGOK2pnwEbDeGCpX
         Tub8YiKf33ukSD9IFG0h61uFT3i2ejraqcnCODX1eOXPQJ5/30yty6ErJ6CN3EZTDkes
         q16f9vxuxYNe8k3DEw8e4xWa+aatBxyS1DtfSxw/ZaUNbsQOsKt13X4yG+hYPuYP3dhH
         GVw9cnoBDIkkBiiqPmZyfNZylEZbSVAt335/Lj52K4GcPdPmlRkmBm4QJUngiOZip/+J
         FCfA==
X-Forwarded-Encrypted: i=1; AL+hErHhsy94N+gZa2PhYhEqwrJFcGpzdTuR9lrYtm5wofOdB78GuLbcBETG5TiTdHRjCTVya/PHy83rAMpGeug=@lists.linux.dev
X-Gm-Message-State: APuU4Z/RjDbWSxEPDQDP6/7lLEht6vF6/LIWi1mnMt4IIKCgV8ERK4E9
	oR14cEzHi7L+c18jlfDLIIkCG8DyE2zJ5bD1IjxU2WUl74B8/UylLcX2LuOS+wU2dQ==
X-Gm-Gg: AZFdTZd+cLx3AOVqLM0GEvPw9ClgMN3wJ4aOYeXHtSuuk2DNbWv4SSB403hPpln3FGi
	l1XtkE5itg//lEps9ydExCS/VkmXNmxv/WtuIMQF5bcdvo2sYA0UyFOIBwBFCeYChZ6AqYLqjSI
	eTSYGg8OCMFdK2GM3zWx2SaSU/AkC/XZHYm94mlamgEjmOda1TmLxuLBTPqnzTaheTcWCcA3vrv
	MrPEnm+P+55m4pv5DgyqoZjycPqmhBjqgOeni4heMMPNvf/v4IheSCMWOW3K8bm026GG3fjs2Pl
	t/Wff6pnBcaDmcu7IuzNfo7wTBHspxqvWNMPyQFSLAKaajrmNWCUhfSvZDavEDLRCOMSRCLbUvt
	1echbbqes5Om+bce1vRuOvhHfNIaKkwDYQr5XL72Z69gDDHFYCkkK3hDxG+F7I+YxElVIdH02OM
	LPx2YhgrzvqV+aP8ulS1iYaLD1emvoYo3Rdqd4Wv3dezuXUqFPmGY/GEmGvoHzNL3zCt2J3mUTa
	TRl/XjG44t7KIBnM655bgjc2sG8M7ZpFbngsS77Og4E+qbf/o/H9ZHIy0AhIGNsHBRZ1DyraN64
	aGiSdZpur2QHbnc2muD8t/NhhojpzjrqHTxpxHsjOd+GoPtVm6Ji0ZDDbnIQJ7+rZ57lcNlMaMh
	NxtwxHr4QUX4xrBnTDaTAgcRejkOlrNZtKTnoElcV64rPQ23J1pZ5Opumvo0aQnTmLoKYXxEI4u
	ZiwrmwiVTW/A==
X-Received: by 2002:a05:6a00:a908:b0:886:773d:a6a with SMTP id d2e1a72fcca58-8c87c199463mr15925448b3a.28.1795634654761;
        Wed, 25 Nov 2026 11:24:14 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bc47sm9717494b3a.6.2026.11.25.11.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:24:13 -0800 (PST)
Date: Wed, 25 Nov 2026 11:24:10 -0800
From: Benson Leung <bleung@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, linux-mm@kvack.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>, David Heidelberg <david@ixit.cz>,
	oe-linux-nfc@lists.linux.dev, Chas Williams <3chas3@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	MPT-FusionLinux.pdl@broadcom.com,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org, Neill Kapron <nkapron@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ext4@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
	devel@lists.orangefs.org, Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	intel-gfx@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 11/12] docs: ioctl-number: update platform entries
Message-ID: <awc12oWB5WDJi8XZ@google.com>
References: <20261125061340.3402300-1-rdunlap@infradead.org>
 <20261125061340.3402300-12-rdunlap@infradead.org>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kk3dCghKBQNrocaf"
Content-Disposition: inline
In-Reply-To: <20261125061340.3402300-12-rdunlap@infradead.org>


--Kk3dCghKBQNrocaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:13:38PM -0800, Randy Dunlap wrote:
> Update the list of platform/ files where ioctls are defined and update
> the ranges of function numbers that are used.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org> # cros_ec

For cros_ec as well:

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> v2: no change
> v3: rebase
>=20
> [Since having multiple maintainers trying to merge these would
> cause some conflicts, it would be more manageable for Jon to
> take all of these through the docs-next tree.]
>=20
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
>=20
>  Documentation/userspace-api/ioctl/ioctl-number.rst |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> --- linux-next-20261123.orig/Documentation/userspace-api/ioctl/ioctl-numb=
er.rst
> +++ linux-next-20261123/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -434,6 +434,7 @@ Code  Seq#    Include File
>  0xBA  00-0F  uapi/linux/liveupdate.h                                   P=
asha Tatashin
>                                                                         <=
mailto:pasha.tatashin@soleen.com>
>  0xC0  00-0F  linux/usb/iowarrior.h
> +0xC4  00-1F  platform/raspberrypi/vchiq-interface/vchiq_ioctl.h
>  0xCA  00-0F  uapi/misc/cxl.h                                           D=
ead since 6.15
>  0xCA  10-2F  uapi/misc/ocxl.h
>  0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                                D=
ead since 6.15
> @@ -446,7 +447,7 @@ Code  Seq#    Include File
>  0xDD  00-3F                                                            Z=
FCP device driver see drivers/s390/scsi/
>                                                                         <=
mailto:aherrman@de.ibm.com>
>  0xE5  00-3F  linux/fuse.h
> -0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     C=
hromeOS EC driver
> +0xEC  00-02  linux/platform_data/cros_ec_chardev.h                     C=
hromeOS EC driver
>  0xEE  00-09  uapi/linux/pfrut.h                                        P=
latform Firmware Runtime Update and Telemetry
>  0xEF  00-0F  uapi/linux/ntfs.h                                         N=
TFS
>  0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       s=
isfb

--Kk3dCghKBQNrocaf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCawc12gAKCRBzbaomhzOw
wuvSAP9FFr45oXAv5Psc3n5xsSYyPFouusI/XwRnWy3tYxQspAD+KIeOTWQfcOeC
TWeqyAANog5rg68r7xNPxeH8I/R6xAQ=
=Fk2v
-----END PGP SIGNATURE-----

--Kk3dCghKBQNrocaf--
