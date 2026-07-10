Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB752376BE8
	for <oe-linux-nfc@lists.linux.dev>; Fri, 10 Jul 2026 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706115; cv=none; b=FWrYfeiCFZ/tc3DUUxX63h05Z3op1lNbTH3gLBOVTPFs6iSV8a5bDEC1cqwZBj8dng57NJ83b0XhndoPj7Z39I8wv8EHWT+gA6oC5g8DmpO1/a4ZGb1MpS39/PjEiSQMA509ViMEnkxiIuNoJxP0/AR0LzB7d4eXY8852aa1QkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706115; c=relaxed/simple;
	bh=q2Pq9v5SXGlcc93M8LKL/aV+CQ++fQMQq3HsJTaHEFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WMEz0cjctcQ45v7eHvPhX/QVbShMT7MaMbg6mSHAJNVyGfXnt4xjlrBvpLMJq+8NmhaYThGUIyHJiHYCMir5Rm0tm5iaou0RVvlXwZKjXndRrjxOExLIMLLFZoYmuuRImpOY2N96+BDLF+JwZZSDh0mebTZ6j3g37t+yL8SWC9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbAHkw6/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbAHkw6/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so974364a91.1
        for <oe-linux-nfc@lists.linux.dev>; Fri, 10 Jul 2026 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783706113; x=1784310913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g/g6IlAQtSI8doB/Bb8hhgXDYZeL8IDA7KJYnBAyAHU=;
        b=ZbAHkw6/GBsebwbWRmEkVBzwEolykOify5jNMX1F5Cs7rOQoTOTJAuuxa6jJ+/7wxZ
         sCsYiGsT9OT6Z1sklO/lxItsmWxzcmEnWgFNyrNBwJ41s6f5fxMiQtcgoQviijD+gtw/
         0qhsymUi7ykb/OeD0Jw0tq9pCpf/d9utH+Y1fsM8UGjw43sbyo4TrkzsqGb1uV9WAd32
         AGtETw/6BSkWCwgiOOwf48HKDTFe89zOpKNdLKhOTUn0CVhsmjyhbXl80pCP2Hl3vaEv
         2uQICQkpQ4/bI3rz5jMRYl7RnyZBNX1yHHbCZ2cyyWEFR5pmg4O1NczB5ES2QZ2pTgdS
         8JXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706113; x=1784310913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/g6IlAQtSI8doB/Bb8hhgXDYZeL8IDA7KJYnBAyAHU=;
        b=YMbpXkXtkBHT+n1a04RDw1ESNtOsU6Unx7eSXTJK92bwNlmm+aC9yI1FT+qHiwDGX9
         Gjx3AXI9rYnc2LEu+/fti9pJ464U5Zq9z2gyliBr6GugOEL1lY65CLeZgXVlmWfdrlcr
         yb+163rEl08vQiMpUQs1Tg3G+3PbyU9LRlU7BQnne/yi3/288t9hi3P+ZH64iV2yH1wx
         +dNhu9rTxFVHMKFbmgO9oCpNxsaJwE3ys7asNORKwN/2B5/7vcGGd2hS0p0drCSexvnX
         El6NWFcl4y5cO6wE8pUmNlBxfxzmE0DHSPRIr98eJjyC3y+X6J+Bx3hY/ZrmTdYmd9to
         PjMA==
X-Gm-Message-State: AOJu0YxpjzV91ryAhhswCOSuvIiX1ybw8eIgIclOL9YhuLIYZjhfIbtL
	jPMtHvleF9PBLkUC5A5AjzCMhNI90MKuFMrqMyOh8jdnDmtiQ4dcFwt+
X-Gm-Gg: AfdE7cmxr5QvLQcG/Kf5k4O02eeomaOQamkIsAoESSw4Re5aC68xDPtHJxMlSV0uoSz
	1Gpixd1QE8cTYYXVeSDgSRZ41ioC4BmqHmDCufJf3IkCTjUL1TCIKnA197iXhFldCz4z55j3SIw
	5Fun2IuiBO3vs7h+f/XzUrNnSoit8rahZYqUY/mT4Hacw7LPd5YJm4/NMUfyzjIArYBkDRRHAaZ
	Wsam9LjuNxzes+r2AfTxYaYBs3gi+/reoCiNet82bQSFe6f2ZOwR/9XmUObkm0iDUiEGSFcEu7F
	fDinLdgilhduOn9NHs1KTlaQHLT0W9CgeMeCM6BRS9m/CkUM/iDekWi5kc0cyMCXtSNJtr2f6Kj
	D39SKh5Lfy1dCcRe8ZgiiNuBHz75aCk+GbFETCL2teFNNYM8wFqZyV7bguu1mS1h37bu5PxIiV1
	xdV/D1gKsjN3oEgzXmnynPpLLZe8C/Pz78zVTk1XEe1fOhdn6GnOlQH3WzPI4FWV3EmCMr
X-Received: by 2002:a17:90b:2401:b0:38d:9eda:fa04 with SMTP id 98e67ed59e1d1-38d9edafc8emr2029326a91.2.1783706113230;
        Fri, 10 Jul 2026 10:55:13 -0700 (PDT)
Received: from fx.tailc0aff1.ts.net ([206.206.192.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm43051871eec.2.2026.07.10.10.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:55:12 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xmei5@asu.edu,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH net] nfc: llcp: validate TLV length before parsing to fix OOB read
Date: Fri, 10 Jul 2026 10:55:01 -0700
Message-ID: <20260710175500.2068564-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfc_llcp_parse_gb_tlv() and nfc_llcp_parse_connection_tlv() iterate over
a TLV array supplied by the remote peer. Each iteration reads the type
and length from tlv[0]/tlv[1] and then advances by length + 2, but the
loop only tests offset < tlv_array_len and never checks that the 2-byte
header fits in the remaining space. A truncated trailing entry is enough
to read past the buffer on the tlv[1] access.

The length byte then makes it worse. offset is a u8, so length + 2 wraps
at 256: length == 0xff advances by 0x101 and leaves offset unchanged, so
the loop stays live while tlv keeps moving forward. The parse walks well
past the buffer, and the next iteration's tlv[0]/tlv[1] read lands out of
bounds rather than the walk stopping one entry over.

nfc_llcp_parse_gb_tlv() runs on the general bytes of an activated
NFC-DEP link. An RF_INTF_ACTIVATED_NTF in listen mode reaches it via
nci_ntf_packet() -> nfc_tm_activated() -> nfc_llcp_set_remote_gb(), which
copies the peer's general bytes into the 48-byte remote_gb[] field of the
heap-allocated struct nfc_llcp_local; the wrapped walk runs off the end
of that allocation. nfc_llcp_parse_connection_tlv() is reached the same
way from CONNECT/CC PDUs, over tlv data taken from the received skb.

Bound each iteration to tlv_array_len before touching the header, and
widen offset to u16 so the advance can no longer wrap. Well-formed TLVs
are parsed as before; a malformed trailing entry ends the loop.

 BUG: KASAN: slab-out-of-bounds in nfc_llcp_parse_gb_tlv (net/nfc/llcp_commands.c:204)
 Read of size 1 by task kworker/u8:3
  nfc_llcp_parse_gb_tlv (net/nfc/llcp_commands.c:204)
  nfc_llcp_set_remote_gb (net/nfc/llcp_core.c:681)
  nfc_tm_activated (net/nfc/core.c:643 net/nfc/core.c:677)
  nci_ntf_packet (net/nfc/nci/ntf.c:883 net/nfc/nci/ntf.c:1015)
  nci_rx_work (net/nfc/nci/core.c:1564)

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Reported-by: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 net/nfc/llcp_commands.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 291f26facbf3..3f0f8eef9890 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -193,17 +193,21 @@ int nfc_llcp_parse_gb_tlv(struct nfc_llcp_local *local,
 			  const u8 *tlv_array, u16 tlv_array_len)
 {
 	const u8 *tlv = tlv_array;
-	u8 type, length, offset = 0;
+	u8 type, length;
+	u16 offset = 0;
 
 	pr_debug("TLV array length %d\n", tlv_array_len);
 
 	if (local == NULL)
 		return -ENODEV;
 
-	while (offset < tlv_array_len) {
+	while (offset + 2 <= tlv_array_len) {
 		type = tlv[0];
 		length = tlv[1];
 
+		if (offset + 2 + length > tlv_array_len)
+			break;
+
 		pr_debug("type 0x%x length %d\n", type, length);
 
 		switch (type) {
@@ -243,17 +247,21 @@ int nfc_llcp_parse_connection_tlv(struct nfc_llcp_sock *sock,
 				  const u8 *tlv_array, u16 tlv_array_len)
 {
 	const u8 *tlv = tlv_array;
-	u8 type, length, offset = 0;
+	u8 type, length;
+	u16 offset = 0;
 
 	pr_debug("TLV array length %d\n", tlv_array_len);
 
 	if (sock == NULL)
 		return -ENOTCONN;
 
-	while (offset < tlv_array_len) {
+	while (offset + 2 <= tlv_array_len) {
 		type = tlv[0];
 		length = tlv[1];
 
+		if (offset + 2 + length > tlv_array_len)
+			break;
+
 		pr_debug("type 0x%x length %d\n", type, length);
 
 		switch (type) {
-- 
2.43.0

