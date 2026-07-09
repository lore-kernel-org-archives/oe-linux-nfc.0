Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440242472AF
	for <oe-linux-nfc@lists.linux.dev>; Thu,  9 Jul 2026 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602755; cv=none; b=KUqg5RZsG93FSu1laMszpFk+B5tZ8MJOpu6axUDieA3Dv6pKZaU2J4P2KWsZFEsCn16u2WucG8TF2HviS8WHLV6PstI8xkx0eChyL+rpmOiowJLI07MPA5csyYka904cbQUtqQeUYaGfwkCDPnPJS+LUWjf7oMTs9pobV6budsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602755; c=relaxed/simple;
	bh=iAyyFv/AQxA40DSCOj6cGXn3go3IfDOrY7GY4Sy9UyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPUpT8+2qgOq3dQ/LzGuc0daD9kijNOnXy4uXiTwZWZQ8YFsQp8bnIPcsYqpYOEXKBKYxYZJpT5ZHqOxtG6CB6piYLIRup57oFHkIhD2+HiOxdzSRQifQqNNJ5R9DAp5iHkVZUX6Qtn6dcdphIUbEVvyTCldKw/Ba+1QaYjOLbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=sMPfI1dH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="sMPfI1dH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47dedd17e12so170097f8f.2
        for <oe-linux-nfc@lists.linux.dev>; Thu, 09 Jul 2026 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1783602752; x=1784207552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H9Bxn/o6bHrATO0mn2uaPiWaqZWNuvOxb6ptBdz4eyg=;
        b=sMPfI1dHZ9lMK6ZZgi+VLQXft+jDol0/bUikEUFXe6X5ITEsnDZ4oUCdn++3XBJxGg
         E4dq8YxJ4a8xNEEjEA0N5NcfhAtUTH0TiePMpeO7z0ypUek1FZrTyvty3NLuzu6W+hou
         E7DMXX5EL/+VAjCc/psVV4lcCC0yhc5BZK7F46ZQfTd7GsGmJbScwPzRyn0NjSgOgQxo
         BsRhZNnI2Wx7uxQSDcjgcEffmYBPI6JlSYhWlVRDVqinmn/EUNnYTjGpligx+lgLBg9X
         bGybEZTP/5ntQyl+43tsEDA2yikYRNkxV+h4I3cdLLjUjqmMW8wJXbxhibHRqcH9yWkb
         TlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602752; x=1784207552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9Bxn/o6bHrATO0mn2uaPiWaqZWNuvOxb6ptBdz4eyg=;
        b=DiZ+NSAuEZLD9PcsllHZGuoHko56KaWQKxTLsF9sMY5rUdBy3Z5JQpZkmeaQACgs4D
         yehmHCAkLCCPsbwSKtrSqIAtvCMgqNjfHGKq6O5SwA90zIOyT4RDjhlFttDeP7lsLS3r
         8+PGe2/V3sSZzKe42smstI4EF5cWD2lL2qU+97g7lNfGmwJ1hblikR6QJZd3fsvppBIU
         tfW/e6Q484+Oe5GR1XV71ccyh8eobU8u/EgwGX4MKC2O/A1oMXz/gZ9SFnGf5/kLz/vz
         jaD2f7KoG5TXcRkRqQEB4scMBsEv9xdncnM0KOmg1Zk3SXmiRva897K1aUo/DAMtOEU2
         DGZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+uedPUEsLsxI0N4c/yL2islL1WGRbkoqYUoRFAfA2dXGpVt/cM74Y4YjqQxy0W7ttCV8m+Rkjkhb0oQw=@lists.linux.dev
X-Gm-Message-State: AOJu0YydaJVZ3go5ewbuEIH9bftJi1EEX6upWw2DI1ArOASBmY1xDEeR
	uu/7oIi89BkBrJIX+EOaiX4S2yi+BkYVFBYoR6NLcv7LuIE3iKaW8lU6MF6jLQ9IPhh6
X-Gm-Gg: AfdE7cmyJ8STR1fg9eehRu17eDusimhIKG6odrpCOe6i3wUwoVPbZ67CrODpOzBEupa
	y622uVRjCQthC1NW65zH3w0ZW/aPGVZ3gu4mnZYCEC0RybGuHYmmkZfvkPG/iBf4iuf/mvDZc4Y
	rQGDBycNIr7Kl/LVqLk0ugOcVQf7zQ95gY3UwlLxxoCdXc82gIIzRAzDCd/Y5QlVyd/PnfVw+ej
	7w0ufF0Zlyz/9V9m4jr6UhBJqmUZ+O3RIVzVC9HsReE4zFcikHZs0PjwT1VygBbyAZQ9bbVLrwD
	fvXs1HFU8mSZTSrrg6ztggnDSBrJrwwlminrYHGox91uy5RjdkyFQibkto8BhqlDYP6wh1Y4fqX
	z/VtRzC2Z3A4eP1VITz6GcGAjdT/6VtzWvgkJRhzNemtJ5kCX95cfm3LxwmFXQfxEYRqdww7WzB
	oRyca92IT7ScBc/uhasCBkGEhowMiD1zb97m2z/DU6BlRWW69+zOsJeETmREETjBxHu6i8yWrOP
	amgUmMEcv3HGLIOwu8SUq6m27L/HHGDzfs=
X-Received: by 2002:a05:6000:290b:b0:476:e67a:dfa7 with SMTP id ffacd0b85a97d-47df073b100mr7611503f8f.7.1783602751497;
        Thu, 09 Jul 2026 06:12:31 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm50439168f8f.12.2026.07.09.06.12.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 06:12:31 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz,
	oe-linux-nfc@lists.linux.dev
Cc: horms@kernel.org,
	david.laight.linux@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH net v2] nfc: llcp: bound the connect_sn TLV walk to the skb
Date: Thu,  9 Jul 2026 15:12:29 +0200
Message-ID: <20260709131229.44477-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 27256cdb290e ("nfc: llcp: bound SNL TLV parsing to the skb and
add length checks") fixed the unbounded TLV walk in nfc_llcp_recv_snl(),
and commit d8bd2dedbde5 ("nfc: llcp: fix OOB read and u8 offset wrap in
TLV parsers") subsequently bounded nfc_llcp_parse_gb_tlv() and
nfc_llcp_parse_connection_tlv(). One sibling parser sharing the same
pattern remains unbounded: nfc_llcp_connect_sn().

nfc_llcp_connect_sn() walks a TLV list, reading a two-byte header
(type, length) followed by length bytes of value, without checking that
the two header bytes or the declared length stay within the buffer. It
returns a pointer to a service name of up to 255 bytes that may point
past the end of the skb; it is subsequently consumed by memcmp() in
nfc_llcp_sock_from_sn(). In addition tlv_array_len was computed as
"skb->len - LLCP_HEADER_SIZE" in size_t, so a CONNECT/CC frame shorter
than the LLCP header underflows to a huge length and the walk runs far
past the buffer.

nfc_llcp_connect_sn() is reachable from nfc_llcp_recv_connect() and
nfc_llcp_recv_cc(), i.e. from received CONNECT and CC PDUs. A nearby
NFC device can reach this without authentication; LLCP link activation
happens automatically after NFC-DEP, and the nfc_llcp_rx_skb()
dispatcher applies no minimum-length guard.

Walk the TLV list by pointer, bounded by skb_tail_pointer(skb), and
validate each declared length before use, matching the approach already
used for nfc_llcp_recv_snl(). Starting the walk at
&skb->data[LLCP_HEADER_SIZE] against the tail pointer also removes the
size_t underflow for short frames.

Found by 0sec automated security-research tooling (https://0sec.ai).

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:claude-opus-4-8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: drop the nfc_llcp_parse_gb_tlv() and nfc_llcp_parse_connection_tlv()
    hunks - fixed independently by d8bd2dedbde5. This resend covers only
    the still-unbounded nfc_llcp_connect_sn().
v1: https://lore.kernel.org/netdev/20260705113505 net/nfc/llcp_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index aed5fe1afef0..0de20279e046 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -849,13 +849,16 @@ static struct nfc_llcp_sock *nfc_llcp_sock_get_sn(struct nfc_llcp_local *local,
 static const u8 *nfc_llcp_connect_sn(const struct sk_buff *skb, size_t *sn_len)
 {
 	u8 type, length;
-	const u8 *tlv = &skb->data[2];
-	size_t tlv_array_len = skb->len - LLCP_HEADER_SIZE, offset = 0;
+	const u8 *tlv = &skb->data[LLCP_HEADER_SIZE];
+	const u8 *tlv_end = skb_tail_pointer(skb);
 
-	while (offset < tlv_array_len) {
+	while (tlv + 2 < tlv_end) {
 		type = tlv[0];
 		length = tlv[1];
 
+		if (tlv + 2 + length > tlv_end)
+			break;
+
 		pr_debug("type 0x%x length %d\n", type, length);
 
 		if (type == LLCP_TLV_SN) {
@@ -863,7 +866,6 @@ static const u8 *nfc_llcp_connect_sn(const struct sk_buff *skb, size_t *sn_len)
 			return &tlv[2];
 		}
 
-		offset += length + 2;
 		tlv += length + 2;
 	}
 
-- 
2.43.0

