Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773F386564
	for <oe-linux-nfc@lists.linux.dev>; Mon, 25 May 2026 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740671; cv=none; b=CYWB8xq+yebA/qfbPWJ4V9Zv/YnbeEvVKy2vD8+NhzyHVkUYySnH6Kwd152ljMu9zP8fJemZnJ886HysDPn3if5/naG+LLApbCvBBEX1RDNCRW40nifl+aB0v07S2CagFGi5NTcqPdg7y+LxZbLRGw/s71B75H+C4oyMbVvW2Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740671; c=relaxed/simple;
	bh=RyV70KG21x+U9Hjaa0H5yChUF7T9irNeR6mdloxKgHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UMD/hDljj08X5YMccMVKhcwWwzdWsgSAZIdxJZjdd5PUfLe2Z0l+zu48T3lIOz1gjGTlBWNcoks5uXjbjocnBcXgRNZvoRWlHKDoY+6NHG9cN06p+gTXHRwDDd/r9QZ6Xr3c5ZoLRgr4DbEt5AwVhX2WcklJ34aNUP6MkT2NvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=HOQhhctM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="HOQhhctM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4526a8170ceso4940729f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 25 May 2026 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1779740669; x=1780345469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxYIky8RT6KvZ8TGdaQwxCoSJctGsAxBOVSzD0t66cA=;
        b=HOQhhctMO3BNhBfyN9IhWidvY0WcnckMug7WBPbHb20AlLsGuAEhwfj7MP3glYVv8o
         7hSfP/U6BEcosqxpK3+93Bm6qBB8Pjoi1Ef3xS/w5Z/e1HEFgwIdyI0pk7kmh9sn4yrf
         0F2VkqgNGlJV7iiHw5s56PwjhFVGY92OUJHmB2pDn4QAl2vaPNpv1QEtFBV0cct+QORN
         ZTsr8OJ7m3FgDTlY5TRAX2SXFxI3xXYijD3CREWLrrfRCWkj0h+5UpalbvVUzuWZ6TqK
         GDRrob5gugYzup1uI0jyH4CVgX3972THMJKooR2riDbwD5J4sr2aWyzeXsv9n+br0+1W
         WCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740669; x=1780345469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxYIky8RT6KvZ8TGdaQwxCoSJctGsAxBOVSzD0t66cA=;
        b=K3pIFP3NkB2j8udDTNN6kPepV43QtsomTfiuJ87mpapBNPwiWp0cALyK462JfZC+sm
         y9llvzSoOVVWQFqHpxc5XrXKZGDn0TwZtlPOE5mdc8nLN+sM7bklRZV4T3bVAASLg1gW
         fCgyuYmfTc2gGYX1HC8qD2eT2weCv6G3zojrOgCzgeaKlMnhxDq/M3Zo057PhXInhP3Q
         IN+QGHV3Iitgcbxp+0TN7YqFr2MZ7WI9ZKsvOCBnuDyFrjvyEd3BjIcSQul2zPGzhRIf
         kiUNZhnlVRNf6ImZkhGdE7qrJgo0Afk/DoRavgDZM5KqAw15ErtMoMyMX2R/vrIRiQk1
         iMlw==
X-Gm-Message-State: AOJu0YxbFFZdxiPghZvO9KTzK1SkopRXFOAzHzLYP7wDuioEo/D5arDp
	JwcQxOG04hkfolOXuDsrqRHVj9eN0thVs2H2fzIggbhPAmFQWbn3vE2GkxQjFwjebyY6BxCQctQ
	VRZYTOU0Rpg4=
X-Gm-Gg: Acq92OESL8a2cztbzIdD/ovFePUyl7sY4ZDIA+hnQIQfV6Y8673EniHhNkTUlI+MCx9
	InEiA4L3UJ8H9xiHBsVk0G8IBtJ55lI9LXbgJN8iFsHilh3b9O24542+rksUvmJI+HK9adDGErB
	zm/mQWexC0Cs2JX5tysNflIzosfbzSVKsEQ0sWZhpiWZKaEY5cR9Gj8z1Bo4X6u3uBAHLsA7OyG
	FiiDkIrvs6cogwRiOoVK0/vPpkkv42bqrlBcGOoYWUBk1IoOWrLaCYz2wKw/oYD8lLPBOto0twN
	jVjJqWu52+R7aMlsZ9QU/YoimICxEva7Ws087KFW+ZzTO4iK2MvrIH4swmV74/quTg1bBglB1E2
	ivMhqiD4uA21yT82rk23bgsViIalh1JkMBH0pK2YY3qU1ir7u5Uw++J+69ZTvwRGJxiffyJYP39
	2vMuj7TTbNQgPAp1sL5qXzKhzZj2xYwtyCNZJT46oeAPZ4VbHazJVlZQvagvWO7lXvIxbYzOO7E
	xED7uvA5qlOctqbq5gls0bWGWs6sAxyHAKdLFbeFY/3
X-Received: by 2002:a05:6000:2c11:b0:45e:8547:f214 with SMTP id ffacd0b85a97d-45eb38b8b72mr28563604f8f.32.1779740668747;
        Mon, 25 May 2026 13:24:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm29333426f8f.18.2026.05.25.13.24.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 25 May 2026 13:24:28 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz,
	security@kernel.org,
	netdev@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] nfc: llcp: fix integer underflow and missing bounds checks in TLV parsing
Date: Mon, 25 May 2026 22:24:27 +0200
Message-ID: <20260525202427.67768-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple out-of-bounds read vulnerabilities exist in the NFC LLCP TLV
parsers:

1. In nfc_llcp_recv_snl(), when an SDREQ TLV has length == 0,
   service_name_len = length - 1 underflows to SIZE_MAX (size_t is
   unsigned). The subsequent strncmp() and nfc_llcp_sock_from_sn()
   calls then read unbounded kernel heap memory.

2. All LLCP TLV parsing loops (nfc_llcp_recv_snl, nfc_llcp_connect_sn,
   nfc_llcp_parse_gb_tlv, nfc_llcp_parse_connection_tlv) read tlv[0]
   and tlv[1] without first verifying that at least 2 bytes remain in
   the buffer.

A nearby malicious NFC device can trigger these without authentication --
LLCP link activation happens automatically after NFC-DEP.

Fix by adding a minimum length check before the subtraction in the
SDREQ case, and adding bounds validation at the top of each TLV loop
iteration.

Found by pwnkit (https://github.com/0sec-labs/pwnkit), an automated
kernel source review tool by 0sec (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 net/nfc/llcp_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index XXXXXXX..YYYYYYY 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1300,6 +1300,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 
 	while (offset < tlv_len) {
+		if (offset + 2 > tlv_len)
+			break;
+
 		type = tlv[0];
 		length = tlv[1];
 
@@ -1307,6 +1310,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 		switch (type) {
 		case LLCP_TLV_SDREQ:
+			if (length < 1)
+				break;
+
 			tid = tlv[2];
 			service_name = (char *) &tlv[3];
 			service_name_len = length - 1;
