Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785253;
	b=ca/y4ME9LahH1Gk/3BILSdtd3Ve7uLaP1O5pbSEJf2XMw3HpwcSagXMeDv3N5ESLIlVN
	 WguC6ZzplRzdckRGKb1gjJGqC+cZNGIBJPGgH25v/EKJFVYyJY5i8oDq0kHSqRdn1c5OL
	 XIy3KlT0nOoneicUVSXMt31UUVxW45iCg38ukgZtjPBkr/OMEkbTa/GOzfWQ+9POwjBqa
	 bPwLFyDo2jwYF3SKKR3nUCdxRQl2wg/+bVHbvNr8h9HsWScNYv0w48KNKHril6ehWnU5D
	 mpwY5zsxo5oaVHoLMrnFlFh2sZdb6OAlRrYO8XC3tyJHo9s6SUWOIBLVGYO2js3rm3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OXHww7JRwC5sR22/HTGUO5MsP2p4PTlezupZRsfe/2E=;
	b=Q/WQ3H5wFJmS2+75ZwN523j3w6l22J3EuuTt/4WhgOcuyG98qOWEnwozZVqbNPNzyZFB
	 wkjxrN4n19PFm5c64svTxet3ukt64iH/zyIvxA95GMgNzuYkrWvn6zh5mWuH96zCDCf/n
	 km5aeUgp/a4Knu7wCuhjCIaz6z0GuFZcAtMsdloKYgT0ECbf/SOVgYQmsWutI7qFT3H8h
	 EeHWCsQLbkG/fW1+6Uf3eQJMBDdtfWEcP9Cd2+Dv2qFqqgIC62vB6Dag2WTlhjXnynRAb
	 D0lBddZ3how3bldyMApzegi5S302Oy1C06fJGPR2M6UGVo9V6xo9wZ+9TxQ0AkudO7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SrxJEEC6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6C8606A322
	for <oe-linux-nfc@lists.linux.dev>; Fri, 23 Oct 2026 19:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D6C8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SrxJEEC6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so11573065e9.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 23 Oct 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785251; x=1793390051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXHww7JRwC5sR22/HTGUO5MsP2p4PTlezupZRsfe/2E=;
        b=SrxJEEC6/rLmC+CcP5QF1d+47pldPpiAt1sov4P2u/ZFRQZzm/K5WXCv+I6VvgVpYY
         ihiCrfEkcGkeMYGa9xYHm45tStizKsaxrgje+ml9++uBRGqetpfu25ycIWtLd9aVP0mh
         rEFtBRCC0eGv7ryo1D5LMiUOaKPoAELcelcWENathgUQmHWPvuvbw4+yabj3jGz4TzWr
         cIlncj0Ei9M4vFoSLKc8/k2adXxoiMK1uGrn8PdCGSHbV5mB0bfCZQ7Qzp46jjhD/JV6
         9gfwgwAtydeeCGqN9CP+/yCvMk+8Fbah1shsZTuSDAMXmKNISCG3lEJ+82XFE+ZmMcFm
         x24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785251; x=1793390051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXHww7JRwC5sR22/HTGUO5MsP2p4PTlezupZRsfe/2E=;
        b=n6q0f3aUs+7h6Vdcv8xBiuj51dpENnjzWHXq0s+TzE0mAPvIvjUoQKHUGz0sYQ2/yq
         +HoP3OU/yILA0c5Ve+fBYsw+aye4+2D3R/yAPYE0ufQqY8KmO97IMN3hFTW0irC3W3+F
         fUeaB4QZNkaUQWvOJIqCLMXrdqSkSOL6bOLT4Vgh6n/4SCLCGC61ce/4b1whLhZM+tGF
         OwNRyQ0pri6zHWuA7LMdsQIQbgpeZVckRzRVlJcFCSWcyfFhKUh1lr2FtPcMSSEu4C44
         W1Zwkfl8ReVGGWsfx+nNSDLihS1IOjSS4dDCrD74lixTO2m9WBEvNm+jai/HI6QlKCWt
         5Tvw==
X-Forwarded-Encrypted: i=1; AKwUvBxO6wjHCJZUpTLFE31zjZ7YtoMpFNsu2VQIQoxD04uKiUYuy7G98g+Ujp9xE0hHZyGayc3MPqydO+ry6WA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIvb3Oe6MfHDrpDautDG2akuLkvWGJW9oM/A9hHlSmPexXUdF4m
	Y4iVVvMOgMnr4NdakVqtOl3PLxhHLuNCQzh1MgqyhzOG9uUrqDY1eyE=
X-Gm-Gg: AYBFou0C1P4jumHdW2BBzv/OHFHJBE1dR0CiyfTPHOfSyZXc61cPVQqmy1HaDo0yEPg
	8X49RYeNefM4zvHJHfl/JtFjJmVBqVuArE32u/1LGQ33J1oT2ZWxy0/r9O9Vs9o5dQOLNNAadaR
	VxR7WVywjjBLNYSPtw8Vm6HSo9YiHnoLeKJD9ElOWKI6xeRc3mZ2KlBfHTXMmGVYb3gTDZstDCj
	k21mhy21GL1jWCuAnkUEYA49El0QPLERDD9REW9GLVzokqS0LyH47AxbaQlNaeVNf631ZESxpay
	Nl5WelH2KRJ7YrGpYxGgHZciB20RvelURFz0wB5RILEZ7qmrokLI9b8+gQ9b4PAGCndLUJjE2wt
	pVTSu2sLQG4DXPhRB69C7fxoulbJb2OOgy097VGHSiwQCYNxCmeF80GPFTiDXGV9mqoSxOzCcP7
	Nzn7w7YGRGA6ueVLtRFh+qufzkSqc4NjRR6FuA0Sq0sjfKv99BdnQQLfNdILXXeRUzdW8mZhJHH
	HYKZH+EfoQI83oD3/JTrvEq
X-Received: by 2002:a05:600c:c170:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a2190fd130mr29520455e9.35.1792785251101;
        Fri, 23 Oct 2026 12:54:11 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a574088sm3346915e9.9.2026.10.23.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:54:09 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	"John W . Linville" <linville@tuxdriver.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] nfc: llcp: use timer_shutdown_sync to prevent timer rearm
Date: Fri, 23 Oct 2026 19:54:09 +0000
Message-ID: <20261023195409.3532540-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

local_cleanup() uses timer_delete_sync() on link_timer and
sdreq_timer, followed by cancel_work_sync() on their associated
work items.  However, tx_work unconditionally re-arms link_timer
via mod_timer() when it runs, and sdreq_timeout_work conditionally
re-arms sdreq_timer.  If a work callback executes during
cancel_work_sync and re-arms the timer, the timer fires after
kfree(local), producing a crash via schedule_work on freed memory.

Use timer_shutdown_sync() instead, which prevents subsequent
mod_timer() calls from re-arming the timers.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 net/nfc/llcp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817007cf2..a098d72a15ba8 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -173,14 +173,14 @@ static struct nfc_llcp_local *nfc_llcp_local_get(struct nfc_llcp_local *local)
 static void local_cleanup(struct nfc_llcp_local *local)
 {
 	nfc_llcp_socket_release(local, false, ENXIO);
-	timer_delete_sync(&local->link_timer);
+	timer_shutdown_sync(&local->link_timer);
 	skb_queue_purge(&local->tx_queue);
 	cancel_work_sync(&local->tx_work);
 	cancel_work_sync(&local->rx_work);
 	cancel_work_sync(&local->timeout_work);
 	kfree_skb(local->rx_pending);
 	local->rx_pending = NULL;
-	timer_delete_sync(&local->sdreq_timer);
+	timer_shutdown_sync(&local->sdreq_timer);
 	cancel_work_sync(&local->sdreq_timeout_work);
 	nfc_llcp_free_sdp_tlv_list(&local->pending_sdreqs);
 }
-- 
2.47.3

