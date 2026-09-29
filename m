Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4E3D647C
	for <oe-linux-nfc@lists.linux.dev>; Tue, 29 Sep 2026 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722241; cv=none; b=IQBK/F5RlgYCtQxFbHSG07lUyVarvkjtTWoLA5nj12EyE52WSVLq1pEYAGJaTwArcYSmyfCsd19y1Ro1tewa5jvawpdxRsxvV2TZ+esbwb6X34erwZs3DxivXbtaepRQYVcl8q5TX+PNEJKxZail742Q810o/frn8s2t82xwFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722241; c=relaxed/simple;
	bh=WLgMe1Exvuro8juDYcAbZqCnJhIpTT4cobJxqbLAES0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCY3D4kAPN4VdbISYO2dm13MzrSeoeHbfr5FK3uFs+D1WNm5GYwoOz0W+LDKqb+YAVXhzyb5hITCqpxrHVxtfIvoHTkVTX9otmO5hnkqUFI5b81yrO6dU/TFxfmjD5tEz+BjbUpEed13J6LZTASuFYssghe+/5X7ZSRoQUSOQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de; spf=pass smtp.mailfrom=taufderl.de; dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b=PFKW279V; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=taufderl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=taufderl.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=taufderl.de header.i=@taufderl.de header.b="PFKW279V"
Received: from christensen.uberspace.de (christensen.uberspace.de [185.26.156.203])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 1A31918073C
	for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 00:41:27 +0200 (CEST)
Received: (qmail 1063 invoked by uid 990); 29 Sep 2026 22:41:26 -0000
Authentication-Results: christensen.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by christensen.uberspace.de (Haraka/3.1.1) with ESMTPSA; Wed, 30 Sep 2026 00:41:26 +0200
From: Tim auf der Landwehr <tadl-git@taufderl.de>
To: Kristian Brox <isyourbrainfoss@proton.me>
Cc: David Heidelberg <david@ixit.cz>,
	luca.weiss@fairphone.com,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tim auf der Landwehr <tadl-git@taufderl.de>
Subject: [PATCH 0/3] nfc: st-nci: three ST21NFCD fixes found bringing v4 up on the Fairphone 4
Date: Wed, 30 Sep 2026 00:41:22 +0200
Message-ID: <20260929224125.3656680-1-tadl-git@taufderl.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.992462) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.592462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=taufderl.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=WLgMe1Exvuro8juDYcAbZqCnJhIpTT4cobJxqbLAES0=;
	b=PFKW279V6/THg2nwnoehDGEVR3FSlSXw/NAmfz+MKRQxNDfK0cXncPgXxIMlNJi+BVSP4by1PZ
	uwEgBkaHxylXlZh/pl3naG0PYThAO129OVZGr65Endp/k9Wy14ixVVAMvX0sq0EuP1sSuxdtTKGF
	4x5oxAVor20Uhmxd3VSCA8iejOKByZzVL1oKtjuC6QRCuibLZmCGPJFdfmIA7QdpJjsbu2D/sqqC
	eXrqF5c/BekCtkLx85RJ9eodHuS1AAOyAQeY+pyXKvvW2Gydz12+gHPQD/xs9JxUsjbp6eIVsylF
	Li4OQsy8Uw1+y6In0qMHnLuV6p4G2bJ/vMlJRYDew+zUnnACEsQxn+7Ev2eK2gOnQLlimrHmp44A
	EirfQ1nGuzWYctAkwDUVBCD9uVRVZGt4Ex96EQSl+bdUU7W9fON5aMgfBFVCxcLtDJxs9pw/erJA
	UUHhtKpmQ0zyeqxBD2SP5j6giyRmFYRnMUrajNfIrrCchVtSWxJQL34sB/qO1S8SUIl7qRMZMNSJ
	VG/GOxcM1gQBjWqlwik57IBR0HW55sqKR97qvd72CbUvLB6CzMTw746VyOvyPR3wVa/Z9KSvO6st
	7gE/t8z5YchCifBcVOsOZOqP+bgJCLOkZoDVV5vDJtL8QfVFnOrpi/kOqQnEVkPU5St7gsJ+KHeM
	c=

These are the three fixes from bringing your v4 st,st21nfcd series up on the
Fairphone 4 (sm7225, Adreno). They apply on top of v4. Sending them here so you
can fold whatever is useful into v5; z3ntu (Luca) asked me to sync them into your
series (sm6350-mainline/linux#14).

1. Map the proprietary RF protocol 0x90 to NFC_PROTO_MIFARE_MASK, or
   nci_add_new_protocol drops a MIFARE Classic as unmappable.
2. Restart the reference clock on power-up, scoped to the raw-NCI part. This is
   the wedge Luca reported: after a poll enable/disable/enable the controller
   stops answering NCI (DEV_UP CORE_RESET times out), and it only recovers when
   the input clock is stopped and restarted, not on a reset pulse alone. On FP4
   this took DEV_UP from 0/6 to 12/12 across cycles.
3. Treat the idle 0x7e first read as no-data, or buf[2] is taken as a length and
   the next real frame desyncs off the bus ("invalid frame len").

All three checkpatch --strict clean; verified on an FP4 with the mic/NFC DTS.

Tim auf der Landwehr (3):
  nfc: st-nci: map proprietary RF 0x90 to MIFARE
  nfc: st-nci: restart the reference clock on power-up
  nfc: st-nci: treat the idle 0x7e read as no-data

 drivers/nfc/st-nci/core.c | 15 +++++++++++--
 drivers/nfc/st-nci/i2c.c  | 44 +++++++++++++++++++++++++++++++--------
 2 files changed, 48 insertions(+), 11 deletions(-)

-- 
2.55.0

