Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B11A2749CF
	for <oe-linux-nfc@lists.linux.dev>; Tue, 19 May 2026 01:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153785; cv=none; b=SyBOnxjDig9dc0C8/phi05ZrHz7leThj6o+WPD0dvnvyjbqTzYMk2bck2npzwgLA8gLnZLMZ7QYokQQXOaC/PWK4gP24mK4afBs/q3kQ7TiVOshM5Ya2A61fvmji5yMXGyQNaPZpLkIUi8tqI99HHL01SjBIOcnmT+Zx1RkRCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153785; c=relaxed/simple;
	bh=VeXWv1s7VjIj16f62IeF3AHt/aQZkX3KYCOUQT1VU0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0CtbN819FwDoM/3U0/nlN04j20u1BhW+ccl53eCnEszzcmMgjYIXM2RI9e1qQEyfX8LXEp4IVoUn3pcdkLRQ0dqtP9dh3Sdk5Kjx1YwQHuzpBzYqp6m1TXJKVCUxwsmZzVVEp6DQMlhCLEE5Vi6fhund81MdOd1n8jxdd0xhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu7nNNrW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu7nNNrW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso17871045e9.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 18 May 2026 18:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779153783; x=1779758583; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsZN4KBbcJX1FoY6/tUwgCFPOKTIi4RrtSn6JymXQo4=;
        b=fu7nNNrWRiPSua7scPU/G6K2Vbu2sXOQVd/coR8wch5UWs3fUSfHz3iM5BcFBKa5UC
         6Nq3uGBPQGIS1qQH0yatv8NFFgjqz3hNJQDbUVxmgHTjIzafgbjHVILXkZ+c71zs0WaE
         m4j8KtH0ng7PcKFM8wYargAtZCf6kMYTjhRRt5bd/8kUwNf32HiKAeJE+t1GSPFfTGtn
         +LodUMpGejRGiQHqyJHvto518hyUMDoiFpYz62ceT2P01HZl3IVX8NCpAes5LlVGZlUv
         30E9mdevIMEFl1XuRzaP2WBC4yBBji0VBH1DzyfB5HbJmXi8Z1J0w0uWWVFH3gwjFqOB
         txkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153783; x=1779758583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsZN4KBbcJX1FoY6/tUwgCFPOKTIi4RrtSn6JymXQo4=;
        b=aPcKScuVS/sdRYBG4ADeb99vyDCgf+oHpTUTgHfLF9Zp01IE0G+pRy9Qdm7b/U0o14
         cKwyRQ21nQ228aKIoxGSONK+juL3/TSXjsqSfVyD+QYohWEVY47XXwy3/oGgDgP80anL
         emuyJ9C015c/u7INFRaiNjUib/8AB++1e44+uZ/wujxIDQsD3seyZuqfjbmag4jIieoi
         Mhhy6aedCVYzVxCSATUztcVVzWtS/7TmPsqtar7yw1XJrquMF6YnaQRkJbzXovI7Ak8x
         ymcH9CoZiwJSw1b+YMavaZto3vaXuGBHGdcowdUug+ZAH47JWXBvNoUydqcngUMJAd6+
         jdXw==
X-Forwarded-Encrypted: i=1; AFNElJ+i3MwtI/+EZO18qp7KBko+/CXOzUfHa7N9pNFgS4NzV71s2FsCWjfnvfgQAqy+7fKbkqNIJ9RskTZ/6yk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJpMLxTO1g/SmNTYQMbWLw0oWGgjC6FXM1wiyhHKrxwIhlmmCQ
	VUXu0ksSv9wml/3/zyBeLFm29vXmzEi10wFxRiMQPC2CUIk87TiN/2Cz
X-Gm-Gg: Acq92OEwyJ1sgUg9FVmFzLaiu6euDRs1tehpc349Z9xx6JvRsScj3k1lrt0BMXtCk2l
	FmU358Lc9odio+/U5P9uIs1RmubmkRglPjhjQgNvoBF6XuceJTlY2LoeuSHXC0uYpNiGDlWGx0u
	I7E2Yzojyph4+7Wwr+zY4rCodaXiyWYctNHDY60HXmeB15tHGIQrygBHrRb8u/BKYQ9yRquy2Zt
	XuWiCB5+2Yia2szSxWtCiOFCEyqpc5JJ3vFXkm+JE3sJV0AUWEKsV2GHakd2ssrH78ert8kFnoe
	IOVIEGUrEfOAmSLkqTCLGVYpLSziSa0PZW1KjsBz8iOFaP5Le/RiiCeSBFz1Ake4wI9b4TVBXHj
	NAam1775OTKMacbmEsjWS70rMf1iuXhyoDqzZ7Lrypacshzh0Zo+rgCzbtIeIK8dSAkQfCNfZjy
	sDIn5xzaCgvwmnfqit/XsNHskD7zJlOeCE4yYL48Qv1bR25N/DUUYJF+3dI+wqIAD4L8S+XLPxt
	TzGYnFZMIHh
X-Received: by 2002:a05:600d:10:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48fe60d7882mr221269375e9.13.1779153782352;
        Mon, 18 May 2026 18:23:02 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm44255416f8f.10.2026.05.18.18.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:23:02 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	david+nfc@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH net 1/2] nfc: llcp: fix OOB read and u8 offset wrap in TLV parsers
Date: Mon, 18 May 2026 21:19:36 -0400
Message-ID: <20260519011937.12903-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519011937.12903-1-meatuni001@gmail.com>
References: <20260519011937.12903-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_parse_gb_tlv() and nfc_llcp_parse_connection_tlv() contain
three related bugs in their TLV parsing loops:

1. 'offset' is declared u8 but tlv_array_len is u16. When TLV data
   advances offset past 255 it silently wraps to zero, causing
   infinite loops or double-processing of buffer data.

2. Before reading tlv[0] (type) and tlv[1] (length) there is no
   check that offset+2 <= tlv_array_len. A truncated TLV causes
   an OOB read of one byte past the buffer end.

3. After reading the length field, the value bytes are accessed
   without checking offset+2+length <= tlv_array_len. A crafted
   length=0xFF on a short buffer causes up to 255 bytes of OOB
   read past the buffer end.

Both functions are reachable without authentication via
nfc_llcp_set_remote_gb() which feeds remote LLCP general bytes
directly into nfc_llcp_parse_gb_tlv() with no additional
validation.

Fix all three issues by widening offset from u8 to u16 and adding
bounds checks for both the TLV header and value field before each
access.

Fixes: 3df40eb3a2ea ("nfc: constify several pointers to u8, char and sk_buff")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 net/nfc/llcp_commands.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 291f26fac..9162f8161 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -193,7 +193,8 @@ int nfc_llcp_parse_gb_tlv(struct nfc_llcp_local *local,
 			  const u8 *tlv_array, u16 tlv_array_len)
 {
 	const u8 *tlv = tlv_array;
-	u8 type, length, offset = 0;
+	u8 type, length;
+	u16 offset = 0;
 
 	pr_debug("TLV array length %d\n", tlv_array_len);
 
@@ -201,9 +202,20 @@ int nfc_llcp_parse_gb_tlv(struct nfc_llcp_local *local,
 		return -ENODEV;
 
 	while (offset < tlv_array_len) {
+		if (offset + 2 > tlv_array_len) {
+			pr_err("Truncated TLV header at offset %u\n", offset);
+			return -EINVAL;
+		}
+
 		type = tlv[0];
 		length = tlv[1];
 
+		if (offset + 2 + length > tlv_array_len) {
+			pr_err("TLV length %u overflows buffer at offset %u\n",
+			       length, offset);
+			return -EINVAL;
+		}
+
 		pr_debug("type 0x%x length %d\n", type, length);
 
 		switch (type) {
@@ -243,7 +255,8 @@ int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
 				  const u8 *tlv_array, u16 tlv_array_len)
 {
 	const u8 *tlv = tlv_array;
-	u8 type, length, offset = 0;
+	u8 type, length;
+	u16 offset = 0;
 
 	pr_debug("TLV array length %d\n", tlv_array_len);
 
@@ -251,9 +264,20 @@ int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
 		return -ENOTCONN;
 
 	while (offset < tlv_array_len) {
+		if (offset + 2 > tlv_array_len) {
+			pr_err("Truncated TLV header at offset %u\n", offset);
+			return -EINVAL;
+		}
+
 		type = tlv[0];
 		length = tlv[1];
 
+		if (offset + 2 + length > tlv_array_len) {
+			pr_err("TLV length %u overflows buffer at offset %u\n",
+			       length, offset);
+			return -EINVAL;
+		}
+
 		pr_debug("type 0x%x length %d\n", type, length);
 
 		switch (type) {
-- 
2.54.0

