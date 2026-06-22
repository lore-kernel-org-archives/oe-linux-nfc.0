Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FFF3AFAEC
	for <oe-linux-nfc@lists.linux.dev>; Mon, 22 Jun 2026 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134292; cv=none; b=sQ2BMcV/rGV2D+vEzMnwF1+ci6TmOudeCeSl+4qEBEq0SsHJaYrdOIRS4xDDmh8POkHwrWPALeWpjszp8nyhMHdM3LE9geuRdwvGkWo8ZZZTKETElPgyhRreAVsfsB8erwPlIbMRgF/Y28EWC73PhvwaW4I49s0qKoXe1I/qr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134292; c=relaxed/simple;
	bh=yyw0nMtUQFYySF+Vo3tr4O3uzZRBP38LtrsViqoS/Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=becMBH6Sozlb5MnBTo2fsiXyKaB9q2b/RKu0EsssRSKIVsEhprDHDMH0v3EDhxVClKzCwGClyIq0L/W5R26BknK2NX/Ym8KIroZx5YxMQpKewDFryeV0HLTsU/ZMFtzKahkD86oo74/+e2zRXfpQLKFCaSXjLteCOZSIRybx13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg3v4hX4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg3v4hX4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6977c0814d1so3318638a12.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 22 Jun 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782134290; x=1782739090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64GS0cV1F3q6Azsz5ClQ2jQ7hHXoaFyqY/ADvWBZ5O8=;
        b=Wg3v4hX4XePxwaZ7+4C13jASNpLcJBZFheDWeR0xo+atL//oTm06TjhB2BkXyHc9Rd
         RL95qekM1/QZuwDBi8LtjEt3G7hPNf8mGMXoX/4OmfPm8+IMmlYfbS7LDriNT/KK7aie
         StWYZmjdDrFKrE6dzBIj6XARaqlkNowKtCFrE8wAZOIa1xdBCapqPiju7ooXjWmS4Tg6
         K+LV2DO85bQHP7kRDU07qDRGfWn9KA0hr6cciQFy6Q6jPdZezmlAKm1xVwDZYCPskzbv
         zNKY9xA5dkKc03wbCHiptBWRvP89GWBFfqm5LKOafKO0xoOIOKR0OnVYAblFUYtZMYxl
         Fq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134290; x=1782739090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64GS0cV1F3q6Azsz5ClQ2jQ7hHXoaFyqY/ADvWBZ5O8=;
        b=WZFRDRbgqUJIWRzWwprRKnuXHouqJP2ThjV4oU299Xj0SJmZWuXaE9ncyQH4YWsCJe
         xJNC21R83K/TGk6wdaex4nFi56lAvZ2fpVWwHD1TSmp2Y9VqNx8WyERolF9PfXPdrKa6
         ir1/MYQwoW18yFr45i7gbexBpen55rKpaJKFXIpbArYEiPWZHoxs3EymunvR+5Zg5oYD
         dWnxN74zxpSbq74rZli91vYetwqaQdwJNd15zDowjavG06gZK2NYo89X7ApiFN4WWwGc
         f9Wf73MHO1V3DSMdl8e239kIa5B/MWKStBEjPdYWbp5eyTTmeeGgPYihc6sXc26oasXv
         dyvA==
X-Forwarded-Encrypted: i=1; AFNElJ8Gl+/34GyEmNwgzez8XCcWm5WPBQFwvg9uCLEIa+I2Auy3FJM7GemjHinzB9x/ZbqRKvrzhXgh5EbIjVI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/YsZsvePj5Y4vKZ4TSm/Qv19jvQ5u90GaU6oCUs3p49AbE0dg
	LH815W9w10WTSkfdsK13mOk2NvXSIFl+pG5sefYryuZQ+nLKQuth9aRX
X-Gm-Gg: AfdE7cn8rxTS5ifylsGs7Te3EgwPE97QzjSAQd79blVqK5RH8oMYw4rSWlUY54Is3qU
	vuBl6HMv5eatzPmsWlSuhBb02G6iLyze+gFOIfcgvGXFB6ddSP04PNzTX+ZLJmcMkXHMzz9K+QV
	6MgfPvfqmqFs0TyBOAH+qPqoWtEXiPZ0f3EgmM4Ko546VF3GoLVgjayAzk1jKh0r49elqMvfKPn
	Xj/byLB5A9Fg5vAXOYM8/ZkoVnooSPPcc+I/HSa+ghk5Ep0tmRu3MXYEJ2R5kWg6KIXHeUreQEH
	hQnLqxoBVzC7E0+AzDD+a32BYERV6P/Tq4hIRQNqJaoloUkp+AukJgWx20YEtJJM2c5h/VPADIP
	9iKIHKJ5fTjMNu+0gXSXro3pJc+qjNU59muii/fQhZvUbIXAk2hKcgijB9RG9+V9a1AvCfK3eeD
	FnrjOjEjMkxbTT++ta20UVxtbUF5NiGqCPpiv7AJ4NkIAuFvDqKmGEaTkOk7o=
X-Received: by 2002:a17:907:3e9a:b0:c0f:cbe8:7830 with SMTP id a640c23a62f3a-c0fcbe8976dmr71683266b.38.1782134288453;
        Mon, 22 Jun 2026 06:18:08 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99b968sm356605966b.24.2026.06.22.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:07 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	krzk@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v2] nfc: llcp: fix OOB read and u8 offset wrap in TLV parsers
Date: Mon, 22 Jun 2026 18:18:02 +0500
Message-ID: <20260622131802.239035-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
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
Reviewed-by: Simon Horman <horms@kernel.org>
---

Notes:
    v2:
     - Rebased onto current nfc/for-next.
     - Dropped the previous nfc_llcp_recv_snl() fix since equivalent checks
       were merged by commit ed85d4cbbfaa ("nfc: llcp: bound SNL TLV parsing
       to the skb and add length checks").
     - Retain only the fixes for u8 offset wraparound and missing TLV bounds
       checks in nfc_llcp_parse_gb_tlv() and nfc_llcp_parse_connection_tlv().
     - Reject invalid TLVs silently with -EINVAL; dropped the v1 pr_err()
       logging, which was reachable from a remote peer.
    
    Link: https://lore.kernel.org/netdev/20260519011937.12903-1-meatuni001@gmail.com/

 net/nfc/llcp_commands.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 291f26facbf3a..ca89fe967d6a2 100644
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
 
@@ -201,9 +202,15 @@ int nfc_llcp_parse_gb_tlv(struct nfc_llcp_local *local,
 		return -ENODEV;
 
 	while (offset < tlv_array_len) {
+		if (offset + 2 > tlv_array_len)
+			return -EINVAL;
+
 		type = tlv[0];
 		length = tlv[1];
 
+		if (offset + 2 + length > tlv_array_len)
+			return -EINVAL;
+
 		pr_debug("type 0x%x length %d\n", type, length);
 
 		switch (type) {
@@ -243,7 +250,8 @@ int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
 				  const u8 *tlv_array, u16 tlv_array_len)
 {
 	const u8 *tlv = tlv_array;
-	u8 type, length, offset = 0;
+	u8 type, length;
+	u16 offset = 0;
 
 	pr_debug("TLV array length %d\n", tlv_array_len);
 
@@ -251,9 +259,15 @@ int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
 		return -ENOTCONN;
 
 	while (offset < tlv_array_len) {
+		if (offset + 2 > tlv_array_len)
+			return -EINVAL;
+
 		type = tlv[0];
 		length = tlv[1];
 
+		if (offset + 2 + length > tlv_array_len)
+			return -EINVAL;
+
 		pr_debug("type 0x%x length %d\n", type, length);
 
 		switch (type) {

base-commit: ed85d4cbbfaa4e630c5aa0d607348b42620d976b
-- 
2.54.0

