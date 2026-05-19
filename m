Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B162D5432
	for <oe-linux-nfc@lists.linux.dev>; Tue, 19 May 2026 01:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153791; cv=none; b=Djzkln16X122xld/jd7/FqOUPU12ZdZoR/njKyGwUE8mr2YWqsYo9gQ1iOvBOUVXg2nDX/ovYSCkcBE2FIxfSQere0pZ9yjrCFcdeagLpBmC3qg+oa6K+JPaYtobGwPxbb4WdfoG4K8iYOHfq7lIFjumjzs19VjIWr6Ao6ZQou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153791; c=relaxed/simple;
	bh=4vi/+e3xOXjw7xLTlUAikVPvzws2OAFyV8H8dZm6ePs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b92XAPeJWkFnxb+pz2nLdY4dBiUPl6bj0rny3OprCKBF4WPWxlxm3g6PmEvJ1elyHv3Nlq3mlFVNCse5QQ17wEDGMr4izmsB/+cMhAYCuWVSlhA5oQw3mK9L7t2MtVsRLmJXKKK5VdGCeiHNZBGKllYQ6go2tQPy/lpU5hwf2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1Wx4Bop; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1Wx4Bop"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so34967015e9.2
        for <oe-linux-nfc@lists.linux.dev>; Mon, 18 May 2026 18:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779153786; x=1779758586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T0H92Yt0pUbOJ2kFSqG2xMZBSz8hScaz9YpU8JwLL0=;
        b=f1Wx4BopxWhAZfSRcuO+DFGYnuhi8dfmM+JC67WmURHYSQXBnUWWgRIiIcaD2WohHX
         bEgIPbn3nzHWbchvR2VjEG2O4rqCjy9Wzd96Myj6wZHHuakFP+ZchVc+n/5bslLP8FYI
         zhkwlVZxDI7j9I+Hv52fb1ukmpjdIldEifwrW7r+d2h1y+/3wzwYFLEsfdoK/AXVD3Jt
         qnEP4QbK+j9v5e6AoJcWEwScB1UtpDG47GtMyZ6SMJ4c8LkPM6rUX2Lg4D0MQaYb5Kxd
         MF6/rYIy+tFmQ59gX75L/XTTE2XE0muAGPHToMnPPHwMs3BAWftVrbzBVqqGETA0QBYu
         YVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153786; x=1779758586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+T0H92Yt0pUbOJ2kFSqG2xMZBSz8hScaz9YpU8JwLL0=;
        b=RTWR4uSSCH+nf5+CkYWz05ybeF2N3uHYRws7+EJ4fNdHqX7xJmhYUXkrn/xcHaMO8p
         bO6P3JXPkip6THHL/0hxsVzGoLEwwO5uwas68ddoLpM3q91UZ9dYHC5GCN9AV57WG5bQ
         ODqg5zO9/Wn7oKvivIF+eBr29ztxYx75FYywzZZqzDpRRPb3/8K1PYSNGOUWp9kRF4XT
         Sn+0Aozb1XQF3Ng7JsghDeFFRBibsGryRRKB0V/glDh7Deh2bLybHBXXCm2wwwMo6y0F
         VN9zj2iNcFI0gkYLhLufqXSXq6IgyELyP4cWRpP4gErPZgOqWc/atCeIc/ihwnqA8cWv
         25bQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DNir4LBqS9lZSnzhATFJW3TbbZywthwvEXmUFIdgcxj3wnEAlUNmgONvMfUXl5VangOfyJpdnzi5p84E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzArsa5adU2LzebgEuLrsseGuFDnon9VD3Kjirr9fg//e4eTBYq
	yePQpJrY7duqhexBIRa/0e+NnBLu/AqVWGq93lOTg9A3lG1kvN5LKlVd
X-Gm-Gg: Acq92OHxj1qdSZjvtZ6zFcPoxuG0CUNqUyeSAWRvzWAftryy0p3TfwIRrDMiYEuttWo
	1qb8AAKl07/7+pq07umTKcCJSXcJ3bWc5wMBpOEJrRHz6B6D3oOnXh+SkeHM5B9TOOtjuzc2E43
	oNMO8dVkVwKBJZigzdLRvQL1zE7HE5+VSgelCkg/MEJx4kpNHvSqLATpx6hK4Z0C9tVk9j5PSVZ
	7E7xh5fOJmYHik/WxykLGzX2rrV/g9V40OkH68RgWkKAzqPtqskx8H5cBIlmQ2vcjBJCNMVs1Gx
	rbJgpyjLEpj07TaKj9mPuHwj/wnZcHEpVkXB8thz9oHBDA7eJJ7i9iz8x3rdkWjUfaFsxxdqncr
	i67Ox41cR4TDXU1YJkdXII9dvKJiM1oRwEsnrBfZnwCwE5S950Vc4HQHAmhHPtBrohsQCNBcudu
	z41edHMXpCIm6WJqp7GTbZ38MiwB86DLJ9kIQEW7hdtv3Fl681I1Vho8jiEZ54Y/rZrLyS21lgV
	g==
X-Received: by 2002:a05:600d:10:b0:48f:e230:2a1b with SMTP id 5b1f17b1804b1-48fe6630137mr219596215e9.30.1779153785784;
        Mon, 18 May 2026 18:23:05 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm44255416f8f.10.2026.05.18.18.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:23:05 -0700 (PDT)
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
Subject: [PATCH net 2/2] nfc: llcp: add missing bounds checks in nfc_llcp_recv_snl()
Date: Mon, 18 May 2026 21:19:37 -0400
Message-ID: <20260519011937.12903-3-meatuni001@gmail.com>
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

nfc_llcp_recv_snl() processes remotely supplied SNL frames without
validating TLV buffer boundaries before accessing header and value
bytes, leading to three issues:

1. No bounds check before reading tlv[0] (type) and tlv[1] (length).
   When tlv_len - offset == 1, reading tlv[1] accesses one byte past
   the end of the skb data.

2. For LLCP_TLV_SDREQ entries, tlv[2] (tid) and tlv[3+]
   (service_name) are read without checking offset+2+length <= tlv_len,
   allowing out-of-bounds reads beyond the skb data boundary.

3. service_name_len = length - 1 with length as u8 and service_name_len
   as size_t. When length == 0, the subtraction yields SIZE_MAX on
   64-bit kernels due to integer promotion. The computed SIZE_MAX value
   is propagated into nfc_llcp_sock_from_sn() as sn_len, bypassing the
   sn_len == 0 guard and reaching subsequent comparison logic with an
   excessively large length argument.

Fix all three issues by:
  - Adding a header bounds check before reading tlv[0]/tlv[1].
  - Adding a value bounds check after reading length.
  - Rejecting SDREQ TLVs with length < 1 to prevent the SIZE_MAX
    underflow, while preserving length == 1 as a valid case.
  - Rejecting SDRES TLVs with length < 2 since both tlv[2] and
    tlv[3] are required.

Fixes: 19cfe5843e86 ("NFC: Initial SNL support")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 net/nfc/llcp_core.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index db5bc6a87..da7c6377d 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1300,12 +1300,28 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 	sdres_tlvs_len = 0;
 
 	while (offset < tlv_len) {
-		type = tlv[0];
+		if (offset + 2 > tlv_len) {
+			pr_err("Truncated TLV header at offset %u\n", offset);
+			goto exit;
+		}
+
+		type   = tlv[0];
 		length = tlv[1];
 
+		if (offset + 2 + length > tlv_len) {
+			pr_err("TLV length %u overflows buffer at offset %u\n",
+			       length, offset);
+			goto exit;
+		}
+
 		switch (type) {
 		case LLCP_TLV_SDREQ:
-			tid = tlv[2];
+			if (length < 1) {
+				pr_err("SDREQ TLV length %u too short\n", length);
+				goto exit;
+			}
+
+			tid          = tlv[2];
 			service_name = (char *) &tlv[3];
 			service_name_len = length - 1;
 
@@ -1369,6 +1385,9 @@ static void nfc_llcp_recv_snl(struct nfc_llcp_local *local,
 			break;
 
 		case LLCP_TLV_SDRES:
+			if (length < 2)
+				break;
+
 			mutex_lock(&local->sdreq_lock);
 
 			pr_debug("LLCP_TLV_SDRES: searching tid %d\n", tlv[2]);
-- 
2.54.0

