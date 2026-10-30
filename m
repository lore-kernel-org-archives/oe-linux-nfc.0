Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358652;
	b=iVW//kQJd7QjIPx9uWJPWPidlCevJza/LwZ3LjAwgQK6W3c02qzT5JD6T5/PzuDaiX8I
	 py9cwcF9cL0fIlxxy33L97wdrDKyzUqUwV0PAsjuDfLerfFK/nTgg5A4Jp+7uXb98bPXz
	 TTUDyJPBU/MC21cfuMYOs+5UFC8DkG+Ifz2mwZa8Xj+g6pj+Bv2B8GO95mLi9zVSUt0nt
	 0+NOjitF7diiUc24ngTuSgcXzUdk2oYd4QGK6Ktt+7qsWvS5cfUdEdFmExYuS+Wpb72Ad
	 aa8Rsg35XMozuLp7y2HkW92/AnqdJESxv0sbMNLgAsNgeQbzzD10KsohBVwIUBxEd4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3K77XNkfMH7a8onwpIoaohwCSVh2S30EXP1W1PCwgg8=;
	b=Hs9EkiPjqZMqqIe+4ngMLAMGBRz5o0DGXPNN5z1t5vxIG+1XT1P+m+O0/LePz7/oUu1p
	 354xFOvhb7oQ9wxPEDugDiGhnvl7949LGYJ2fVA49iNb4/AZmBqVPYIaenzsSPlC5uDyr
	 MQZ7rdfiLbYvXCgMd8dz8SerY6eoz915CglMVnFWLZuSnwPIkA3yXCwJGyRrk3ZovIG2L
	 rYwRmBFS0XNPiHGuqLgbY+mPRscWchCPZ8IVuT1dr92vvshIbwuCLD0LxVlJEVBe8I/Uq
	 4m5d2sTD8PFChpInDT7p9fW5RJw3+qO1gYm0d780NVBF/QPv/ea3UCPzuBxTRZy1JqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux2H+h0g;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A140606A31E
	for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 11:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A140606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux2H+h0g
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so152806137.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793358651; x=1793963451; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K77XNkfMH7a8onwpIoaohwCSVh2S30EXP1W1PCwgg8=;
        b=ux2H+h0gwqFoQ3hh6EfrsSZ9BUn3rvpvysIbevEWcdmlGPpRMvarDPB1dUkjuMGDg6
         xedSBU53wpN/WzyOwLNlNP0JMEd6WoH5GYJLq6J0MohKleeNOgIBzSP5PbPfmoDNHY19
         rIx7ObsUSnk76ns6w1JjA788syyEpfNS5VITjxVuks77aEiwR6lCY2JKjTBQmyuOrlTz
         Fs6IFGvkpD82dYWpkRVYCcLgm4uBV6LuGSLseAxCbOfGScoaRvuS5lSRUxMxnK8keev0
         gJ+PcihC8yo1mHxHS0FMZvOnD7NzAeP2teMOs4Yf1csvCAMovybIGUIFZz85G8N7bv7Q
         M5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358651; x=1793963451;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3K77XNkfMH7a8onwpIoaohwCSVh2S30EXP1W1PCwgg8=;
        b=oXWXwxMkULTDJ/H4oD8+zwkder4m99uShdB5vCa1T0td4l26Y+EcbjODtEpjrwlcNz
         iXNq/CVVHlMmc19x+Yc6mDvwk/8fJuq2FH0OeTjhtSwBsJQ/QjoE7ekKfhsRZ6rezoci
         O4P6dutQm3bBm/qe9VBb1Gy5AspA9kifk0i2NndG6eDd1eKV4LnpJvUYQqw5860kAG4h
         pCcpQnxkSRWTtX7G+AndM+LehA6K0pClbHiCqSpdu9xF7Y9MyqU2vRCq/OpTmZmi9OS1
         /L0dP0/mkGutce5p3eYUQqZGgVOgQT6oMW5iW4fLyFkeT9k3+lHZM5XQZ1Ye/frjyWJo
         kOxw==
X-Forwarded-Encrypted: i=1; AKwUvBzIrjEPmOgEq3eQkf2G/mO4k52qhUDkyyMViP56ufdtB6pAnZtHuqsk1nzlqZc6GjkAA6BEzb6UvIoioEI=@lists.linux.dev
X-Gm-Message-State: AFq9FYI5MwISPCEiqlJ7vw6DrrdHd3yAecV7g+Oqf1GP//JhPWrYiEm7
	y+ArOiriC4rkvbGIe0AiH2EbdgVyyynauRk0g6HTt3wquO3WW1EACp+H
X-Gm-Gg: AYBFou1g2DOZoZDPndQSjhivAnC1B0wXpGPyVb6wsM7PZmQxfXaBCSnK9wTIs6poocz
	sJWb+a9xu71hv+q11b2AeEgCrzWE0xT5xuYRorO5paLLraqd+jidcQUq4fI0/F0OICEyYGS6Z9L
	QF/AvSc6ROP9UAa6MhAFt3FnROF6freYDniz1rxP5Y/gF81AkeZHinksh47QDOn2OtjxMDVX4ek
	VtC39blLl8O3Y9QmBMOt/00ZCUWHZEzlYqgwqVbTx7x/ei06D25DE++H0d7v7WLkKb/vXvakNpl
	bWHGA3z3nCqGvX4LBSrUvUEWnyiLx3uVvdgCUch3R33SdD1XVfwTEe9B/kpX4J04+v56ZNAoVJ6
	RYRQwW3fneYWQhkTKf/rTabZseHiG5I00jRypM9Zs90J9KlIlaMOIefUsWL6ihcVdgSIN3Ut6Ow
	IjvxWgAKx9+HXK1SSCl4nfdpjuZ7op9/I0Wmu0x0u8t0/0v4xkXD0WLZwycdF+laj4+S8CZPgKr
	SreHXpGanUCmec1B9G+dq8Ow4tu/PP12q/kKKwVptzZK7glVaJyyzsqtDFOYWs7soetn+FUStJT
	1QshpF5EZrX4EEgiDAgG77Nnt/97A6ujAmJFL7YVP7Xt9qtOSQRjbn931Sbme6aksMu41O2U905
	vzaec07JB2vXwihpKYLo=
X-Received: by 2002:a05:6102:3590:b0:7cc:2152:4f79 with SMTP id ada2fe7eead31-7d072c1571dmr826528137.16.1793358650948;
        Fri, 30 Oct 2026 04:10:50 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([191.34.116.20])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1841044137.4.2026.10.30.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:10:50 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 0/3] nfc: fix skb leaks in LLC nop and in data exchange
 error paths
Date: Fri, 30 Oct 2026 08:10:42 -0300
Message-ID: <179335864271.64596.805818095553030218@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Three skb leaks in the NFC core, found by LLM-assisted code review while
auditing the HCI drivers that need real hardware.

Patch 1: with the LLC "nop" engine (used by the MEI attached pn544 and
microread) every frame sent to the controller is leaked.  Confirmed with
a test-only module that registers st21nfca with LLC nop on a virtual
phy and a userspace controller emulator: 20 device up/down cycles leak
598 skbuff_head_cache objects without the patch and none with it.

Patches 2 and 3: the HCI core and the HCI drivers (pn544, st21nfca,
microread) hand the response skb to the data exchange callback together
with an error when the controller reports a failed exchange, and NCI
does the same for a frame interface status error, but the raw socket
and LLCP callbacks only free the skb on success.  These two are compile
tested only (W=1); the leak follows from the code: __nfc_hci_cmd_completion()
gives the skb to the callback and never frees it itself, and
nci_add_rx_data_frag() passes it on with the error.


Joas Antonio dos Santos (3):
  nfc: hci: free the skb sent through LLC nop
  nfc: rawsock: free the response skb when the data exchange fails
  nfc: llcp: free the response skb when the data exchange fails

 net/nfc/hci/llc_nop.c | 11 ++++++++++-
 net/nfc/llcp_core.c   |  2 ++
 net/nfc/rawsock.c     |  4 ++--
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.43.0

