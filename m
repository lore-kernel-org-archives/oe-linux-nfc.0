Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883837475B
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086810; cv=none; b=hLZx581VXvP3rW9VUAzZBpb99K5WMrsLnMeXnhlZXSL44qGzaZEHbSK961Kq4Wyp57NMJdKGz8Ip+yETqn3AXolsrJXdPkhYeVMORGYTqSBueUI8zU+PJ9wEkcUhyMD4Xq2QzP6uu5k6nNtR/34zW3kI+05Albn/RF/sSGvLs4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086810; c=relaxed/simple;
	bh=fqB1mcpcPDlHbYquV+um9VZmei4KCKo+BkD8zH5eNeE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rOfDWfRRr6Rj7v4J5nwq/Hc45M3uwrIZyCej3j4+jpujZ9TYGWqvPqXsRBVE/21GfyQO+q5qIGGPGAPW9HiapoI4ujjLIERouRkfChx2M3oAlUhEmudY349P71OptGaJESBJvrc+vqDd5RelFzC7hrd4Ok783/Wr8Hn2a82RKGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AZ45HoTI; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AZ45HoTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787086796; x=1787345996;
	bh=a/d0gdHC3JHl+v3conG40AKrY3tvoYd+mOn+0iwPFcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AZ45HoTIm685IvVQtkdx9YHoLQ7sVrv51QNpjYpg9D1+T9B1YClMZMKsjmSXwqzYR
	 5Ej0HygJvnB4+7xJxI36BSU0uCVpIEm4ZFIhbrEm1wjO5IokNOFaqd7Is4pGldIWQ6
	 IqMZHg7R2+KhirfYeSMMlDI+2GwFrF5rWSN//2cm7eHxrYuHBIIb5C66XpXoEVQWhN
	 jOn1b0WkCyfMHq1u1tikIxXtNhA74WJmm5yYC3TebxtqF3VlCoz6pD9eVfIFEDOBYY
	 Ib062RAhsiEyNtsTrU2AltwvAtaDAovVBXabFSrnY9srNSCJcuDZns3b+sxe1jc1EX
	 yvUP9kMW5wNKw==
Date: Tue, 18 Aug 2026 20:59:52 +0000
To: oe-linux-nfc@lists.linux.dev
From: Kristian Brox <isyourbrainfoss@proton.me>
Cc: david+nfc@ixit.cz, krzysztof.kozlowski@linaro.org, luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org, Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
Message-ID: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
Feedback-ID: 203906395:user:proton
X-Pm-Message-ID: 2a3e54da19a9ae269d925831446a90226a303f9d
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------0aa340d17dba3449f6fcb41707e84decdc743592263e35cfa4e68278c64a61f0"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------0aa340d17dba3449f6fcb41707e84decdc743592263e35cfa4e68278c64a61f0
Content-Type: multipart/mixed;
 boundary=2d029f8b5c7f674dea4253693ea48a087b1c894401a91649da8fc8612d60
From: Kristian Brox <isyourbrainfoss@proton.me>
To: oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz,
	krzysztof.kozlowski@linaro.org,
	luca.weiss@fairphone.com,
	linux-arm-msm@vger.kernel.org,
	Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
Date: Tue, 18 Aug 2026 22:59:37 +0200
Message-ID: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0

--2d029f8b5c7f674dea4253693ea48a087b1c894401a91649da8fc8612d60
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds NFC on the Fairphone 5 (qcm6490). The board uses an ST21NFCD
on I2C. That part speaks raw NCI; the current st-nci driver always
wraps NDLC, so using st,st21nfcb-i2c leaves the adapter unusable.

The series adds a st,st21nfcd-i2c compatible for the raw-NCI path and
the Fairphone 5 DT node. Boards that already use st21nfcb / st21nfcc
keep the NDLC path.

Tested on a Fairphone 5 running postmarketOS, with these changes as
modules on a 7.1.2 sc7280 kernel:

- nfctool: Powered: Yes
- initiator poll / neard: NTAG 215, NDEF URI read OK

ese-present and uicc-present are left unset.

Kristian Brox (3):
  dt-bindings: net: nfc: add st,st21nfcd-i2c
  nfc: st-nci: add raw NCI path for ST21NFCD
  arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC

Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
---

--2d029f8b5c7f674dea4253693ea48a087b1c894401a91649da8fc8612d60
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"
Content-Type: application/pgp-keys; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFqR1U0UllKS3dZQkJBSGFS
dzhCQVFkQVJkaFRsODdNUnJZNlJsOC9FeUhRdmJjVWtqWXBEcmptcmZBRwoxNzV5djR2Tk5XbHpl
VzkxY21KeVlXbHVabTl6YzBCd2NtOTBiMjR1YldVZ1BHbHplVzkxY21KeVlXbHVabTl6CmMwQndj
bTkwYjI0dWJXVSt3c0FSQkJNV0NnQ0RCWUpxTVpUaEF3c0pCd2tRcVFlNkNIM2p3cWhGRkFBQUFB
QUEKSEFBZ2MyRnNkRUJ1YjNSaGRHbHZibk11YjNCbGJuQm5jR3B6TG05eVo2bTkwZmNOZ2Q0cVp6
NWFnV05OTmorbwpyTjkrOHc2TUVRZ0J4MElqR0NPcUF4VUtDQVFXQUFJQkFoa0JBcHNEQWg0QkZp
RUVtU0lrWU5Najl2RWxSS0JyCnFRZTZDSDNqd3FnQUFCcHVBUUNiUmgxb3VRMUVhQmlHWGtYeVhS
bjZkWTNaVjUzdXkrWHRRWGhtOWtpSFJBRDkKRkxROWtzdGJyVmx3WGlrUkl5OVpINUQ0R1VXS292
ZXJIdlpWbzd5RFpnM09PQVJxTVpUaEVnb3JCZ0VFQVpkVgpBUVVCQVFkQUdHZDhVMnJyaldxMVBa
YmhsQUFPUE1KanJEeTVkSjdMbnQ3ZHE1Q21VUWdEQVFnSHdyNEVHQllLCkFIQUZnbW94bE9FSkVL
a0h1Z2g5NDhLb1JSUUFBQUFBQUJ3QUlITmhiSFJBYm05MFlYUnBiMjV6TG05d1pXNXcKWjNCcWN5
NXZjbWNVbzFQNFhTZExyNEpzRlRBaThTcUVDSERDa2thdTBtTmthSk5aaWFjU2p3S2JEQlloQkpr
aQpKR0RUSS9ieEpVU2dhNmtIdWdoOTQ4S29BQUQrZndEK0lLcStqbUFKZytYbmVXT09YNHA4eTFX
K0dYN3FTQzFCCnE4aUFYUWJpa2VNQkFLdHc0aStPZ2VHTWMyOUxHSnNIellXbVJhRU9nS0JvOEcr
UklhK0ZUa29GCj1rbmFrCi0tLS0tRU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0=
--2d029f8b5c7f674dea4253693ea48a087b1c894401a91649da8fc8612d60--

--------0aa340d17dba3449f6fcb41707e84decdc743592263e35cfa4e68278c64a61f0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmqEx8gJEKkHugh948KoNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmc3RZpaRT8x6nMLnBOqwvvLFiEEmSIkYNMj9vEl
RKBrqQe6CH3jwqgAAPIrAQDb6+ibZm2eDGdYHxruoQba3uj2EvwTRXAlGefX
WTeaRAEAvCIP+ytB0KbicIc+/evGs5+Z8KiBegYHXwp4yXjNqgU=
=xwSe
-----END PGP SIGNATURE-----


--------0aa340d17dba3449f6fcb41707e84decdc743592263e35cfa4e68278c64a61f0--

