Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63532277C81
	for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 20:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779827552; cv=none; b=JaUpb7zeYeL3UBtMR6E4BV9Xsr9Mc2OHSDUcKM1v519ti0NjYb+0gxikni2boXSOOV2wo7mXVCS41HZ+He0p/o2YO2BWMRXMvY8f5VUu14Gdjfskm9gCzHU2+YRNyPb9MxkZJ/nohef95UlEEwXbGBd2Up7ecCUwueVYsTz2jIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779827552; c=relaxed/simple;
	bh=J8QTJB03WvozUL/lm9seJKVTmum3YvberljLi5CeonU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1glqZ9quRyoZKT4mfwlq6bqnOS37Frh8eV+AZWBKZzocsL8nXGPqRuixrWz0SdKPs98jBfLepNJtnqkbTlT396nQQ4uqQ0wHCT4LHEwGyiZuvGu6WnGIK57cmjjGwAktGq3t1b369PuUoa0ZzgSaT3dGEzrwBj/Bla2m6LP58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=Wwssbc5G; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="Wwssbc5G"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e7c636e74so5867412f8f.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 26 May 2026 13:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1779827549; x=1780432349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yOE68Mzf5nnVfNMftzrnIa4+AJ1pM+MIvuOSTOhC6JY=;
        b=Wwssbc5G466haqKRiE8lhOKH+CEyZZ+gJreiCJSKUwV8qS65PxdPc61S5PX3Ibz1aW
         VTKtx9U/XZqujpr2onbwnM7NXx9NOnfDZW3r7ZsgJY44P2zv/mhyFX4RhsReG0JpUHRf
         NAm4Gx4L59GLb8LuXRjykYaUEHSCvhuGD0Rvxym6GiR1rWZKnK8u8BsU/pOVemP8IHAf
         EIFkMS9+oTrGjXhe9lXM0/H692R5Hku932BioQlx6TdeamifSkseuDPyYnyBUfQpMnRy
         iyHdS8Bl/amqHOoFPzkqSRhvDIXjNz3aX1davksq2Q5ClXye8Kp0NjSlgEfiVkp53BCi
         AzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779827549; x=1780432349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOE68Mzf5nnVfNMftzrnIa4+AJ1pM+MIvuOSTOhC6JY=;
        b=NT/SyWKnNWLMW+prEkOs8YSaoR6utI8AKwAjupoS7nVW5/ecCtyyyGYlz0KKyiwx5A
         kviakvx6m3LXN8A1FT7xW1xM9UKAp8ze08w7VUAkhB78swTmhKixMzkA0kxZikc8kDqh
         xEdQ/Xcmk65EnAa0UqIkMCuYvbm1el/cIT988TYUQH5Lzawq6dAe096ReHtbjif4+X4x
         lIOjf2mFy8hdwXW179xLm2WRg9tB8m5PvagoBeUeLCKelGNXdEi7wxgNRUpAk7sorbPk
         xkTs1F9e1t0ZzGwuDk+oIstNcrU/7MwCeHBYEiiygY441wUYtJbRKEiTFxe5Fh9sdJ6i
         Nc2g==
X-Gm-Message-State: AOJu0Yyc6MvgUABEhWnwJSXtJ+RlG9CddftxQ4cxH5c/gq0+8YTfbOpH
	jP7023hSX0L3Kdl0KXaMLafdVrrh4qEq2gRQVGgnlffK+vv9/Eqsh29NFCAKJro7YYFrKTILWAQ
	2oqnGR20BLMA=
X-Gm-Gg: Acq92OH7b/pUYEfgGqRIUWh7Ga8ykYGqtqsUQITdtiVAX3h6lp6BISrep6fiBjv/p12
	KpK+6CDX8uh1tt46FSKgcDeSrh/S5I/demFbUKdGNuRkbWvJPYWbKbTnew8xtzLwYmjfQQJrLeD
	+OgQPmtrVmyPWFWys409EVr2Qh+ixNHcJIWFJ2Vbr7E3rokD7MGvIMvn8kE0OM5izYXC2PlwlZk
	e2mbOtkQaMuOb60lgkXc9LHPHkVUvhQvy8AAFigwvtoyu+mWwXUvbR70ifcmSh83SMdvYZmeU6/
	bkBEDFTtWyQpngQFCCsyEQz+nL/STYUstZWv62jKjmiE7zrUZ/y6md6x+9TdoSLXlBpn1wpu7fY
	fnGQzSgyPfFtZXLyn4NLGU207Act7SRHXhNkVOr7INDVrvOdRYrteq2Jy1eBvs6z3bC5vZybmYp
	b3ur88S9UC2qaTB8HGrxSXKRO6HirfdlTe8hdDuG0YoRsUef3JaGcy2/Of2nX+LFsqnl3P1fyD7
	a4acel9NW1lqpbf+mQL+njrgUIP/Uuc36YjxHgo2fqlSUFTnj9d09A=
X-Received: by 2002:a05:6000:41c7:b0:451:66e6:501b with SMTP id ffacd0b85a97d-45eb3324e34mr29057635f8f.0.1779827548645;
        Tue, 26 May 2026 13:32:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm851693f8f.12.2026.05.26.13.32.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 13:32:28 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: oe-linux-nfc@lists.linux.dev
Cc: security@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH net v2] nfc: llcp: fix integer underflow and missing bounds checks in TLV parsing
Date: Tue, 26 May 2026 22:32:26 +0200
Message-ID: <20260526203226.73345-1-doruk@0sec.ai>
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

Found by 0sec (https://0sec.ai) using automated source analysis.

Fixes: 19cfe5843e86 ("NFC: Initial SNL support")
Cc: stable@vger.kernel.org
Reported-by: Doruk Tan Ozturk <doruk@0sec.ai>
Closes: https://lore.kernel.org/netdev/20260525202427.67768-1-doruk@0sec.ai/
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2:
  - mark as net fix
  - add Fixes: tag and Cc: stable
  - add Closes: tag

Link: https://lore.kernel.org/netdev/20260525202427.67768-1-doruk@0sec.ai/

 net/nfc/llcp_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index XXXXXXX..YYYYYYY 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1302,6 +1302,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,

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
--
2.45.0
