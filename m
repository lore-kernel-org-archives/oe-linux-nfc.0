Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8C0229B12
	for <oe-linux-nfc@lists.linux.dev>; Tue, 19 May 2026 01:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779153782; cv=none; b=nxgVC6CfwGpfjen8X+VTbrT1Kg0uB/DYGqwDhdTGf4Fafj8WgK2xeaPWkp5U4taRnkUoVYVaxF62tA/jmtRATNVkk5eDneRY1EP7s/AumJq7CjUgnBmtprHEm1hS03EPPUNudiveJtnAVTosFJoubrhwxHVZI8kiuw5ZMt83IHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779153782; c=relaxed/simple;
	bh=Y08IJeT7eg1AM0JqdRzNKlNYQAhW+GW1ufuXhwZO65Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qu/kIm1f6b6q2zB/MvKdjOJtM5Le/s4/yF7+/AdeC17Atq6gkTFfYkQamu7917G1axOjgu/8ZCW1kiC8PAoJlvS+iWDs3TKxpETbduTAZhdnVuQ1zcpBuYpMPTmwS1+nfX3K6nn+NPf7i8IirHAfkvHg4ynn5zXVeqNWF8R/YxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPNJO36s; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPNJO36s"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso28768205e9.3
        for <oe-linux-nfc@lists.linux.dev>; Mon, 18 May 2026 18:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779153779; x=1779758579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVADxebGolKTYEx0uBYNzU/+4nP14YmYsqJ1cjkXF0w=;
        b=jPNJO36sao/EG2zO5PhxrYqspDGd38wwsTzQQNHHAf273aMGD+MeXCODwrIUqQ67pN
         NWSlese/Inf+0qBkjt3ebIYjVEUZ07ee0Um8gBspzL72mygswu5KdndBO6F7tK103czW
         Pqt553Jqw234L48fHTs1o13u0BUrTyBGylz0CR5bOFGDhvets/Uf47Idk7fqUE2781Z6
         hGi+CTRQouRIorprMz0q6AhM5pnipHofYQQIZwnT1d51sQdrtE87AQCV2bRN3ak4v3o/
         DQ3gdZ8eGXq+iRIVwkx4f+orh7MhvBum2DRdnKJqy2C2O+5wU+JN05NURech+kwsUcRS
         zvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779153779; x=1779758579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVADxebGolKTYEx0uBYNzU/+4nP14YmYsqJ1cjkXF0w=;
        b=TFYKwOElwz0F0PwsHSOpggLCLhp4s4WPpmp1oT1i6/DBODsmu0WGI1NauJz3DmJ4e+
         j8i4ZAwwPLCg0KdjsHPCleoF9xhpSZxbDMnFfiv3hWIcmt9NpMzjufihUtXcMQrBvkOg
         GQ3g6bpJcoshq1dyfHrwppcf7ZEiO07g9By8u7fGLpEFdTZOT1IDKytmLhHsG4VUJLfT
         aeg5NMWeyj8xW4kxB3yGqEHa45YGXjVAX0yXr2SO18qGo00TUpViJ3bSxs3c7BVhRAXv
         psyaf1kRHr5lh6ZMpiept98hVdA5PCu18GsCBSZpCUg8vPSgPxgfNbkpCJjMOYryDj2d
         We8w==
X-Forwarded-Encrypted: i=1; AFNElJ9cnhpx/HeQBCDzRmpUqeZPRMSVwCY9vvRnG+hHmpsreBKU7NE+iv8S6ZUtBVX50XR/JFFFxQgM5VAb2f8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1xH7ywZ5p4MvpmqhcFffMdHDxSHgs5YRPFofFFU6PePKnzoHv
	sXAwTaBJb8KQjqO3jYzwQxs+kDWEleobgpBPDtrVwb++lvM0T+3kYWZY
X-Gm-Gg: Acq92OHkO0TR+AbwuYZGXdOeyCm7HAdlJQr9fCfbXj/zDhXOO0tzsnckBs++6YFhdxP
	e58aF72cIjspklzehBoLBtgIHrKh3Qq08ffsamHUUmC32jy/snxWFkgqRCiGP3HHS4idfBjoEbX
	7TZEeXgx/Z0xr9DTFO3yTntu6PAvZ3w7CTVN2vh0QBhzhPcFVzkTbYe+qkla5xLVsfhm26z5RPv
	pFTCiJPK77/01LnTIhuWlPBQ1viu3PDENN7Q/yvUVq5u5ZTC+E/P3OTf1rlSxEUNsuuJWUhMmXg
	IURUIwl4qAAgyn/La1gKlgwKdiXop+dLowz4ngdxWZ7D/Azp0H3R2N3bRqpIvAEGKBeB4WuX9vm
	CXjUM1+HCY66h/vYJb7elJBxLuiwDmwdn7h7CrEbKE+Q8uSG33EeKB47wglYa3Js+XDVkXKp1pp
	libPqoP2+hpBcmexOiU8raL0+NM8c1CRD/lAzXSjvLcWkqmFkBzmSjBAXR/+k0BA+jPTy1UMarG
	Q==
X-Received: by 2002:a05:600c:46ce:b0:48f:d2b5:d7 with SMTP id 5b1f17b1804b1-48fe60edd2dmr255838215e9.12.1779153779331;
        Mon, 18 May 2026 18:22:59 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm44255416f8f.10.2026.05.18.18.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 18:22:59 -0700 (PDT)
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
Subject: [PATCH net 0/2] nfc: llcp: fix OOB reads and integer bugs in TLV parsers
Date: Mon, 18 May 2026 21:19:35 -0400
Message-ID: <20260519011937.12903-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes memory safety bugs in the NFC LLCP TLV parsing code,
reachable from a remote NFC peer via crafted LLCP frames.

Patch 1 fixes nfc_llcp_parse_gb_tlv() and nfc_llcp_parse_connection_tlv():
  - u8 offset wraps to zero after 255 (widened to u16)
  - OOB read of TLV header on truncated buffer
  - OOB read of value field via attacker-controlled length byte

Patch 2 fixes nfc_llcp_recv_snl():
  - OOB read of TLV header when tlv_len - offset == 1
  - OOB read of SDREQ value via attacker-controlled length
  - SIZE_MAX underflow when length == 0 in service_name_len,
    bypassing the sn_len == 0 guard in nfc_llcp_sock_from_sn()

Previously reported to security@kernel.org on 2026-05-15. Willy Tarreau
advised posting to public lists as NFC is currently orphaned.

Muhammad Bilal (2):
  nfc: llcp: fix OOB read and u8 offset wrap in TLV parsers
  nfc: llcp: add missing bounds checks in nfc_llcp_recv_snl()

 net/nfc/llcp_commands.c | 28 ++++++++++++++++++++++++++--
 net/nfc/llcp_core.c     | 23 +++++++++++++++++++++--
 2 files changed, 47 insertions(+), 4 deletions(-)

-- 
2.54.0

