Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291066;
	b=l4Bwe/c3OhtWEefUQYNvo+o6udtsaEAM3qCJXoSKlc1lMZruX2nr5uKt2XkPhJRj+ZYb
	 mWv3dcLJ4ukjHh0pLqY176v4H4IUS71IiGUnSxlHpyJXOjvpOe5j+ouOxy/39m6kfqOLs
	 GVHti/Ft4Eu35Sw8/1wEXeiIvzcc0hNDV348/nuZWMxsEgL1b1XCF9MRmQa1siHvyvhkq
	 wutGwFOJ7CQzJP1gXslkuVHzmsPBZyu85hgxoh6q6MBG0+YtHY5i5yzkbD9KmOeZcwwXx
	 3ojvza1VPMYw038D2J0dXRe9SwS1x2vY/SzdIPShKrE4OrOgO5lBwBnSTJaZnrdqEFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oNt+k5hd6gK3JHgbJpiRSUaj/zK/QDMMxaVigJ+IVv8=;
	b=C8QaDETi4VxlpSd3DVEf0jLWJQINq5t5O3pF1cpfPDObcOPC2A7OFhKZFrI2I6v4lOE2
	 aNTVAN128MUb0YAbwS1WUOfwmbKuuShE84qvuMFa0w1xP4CR8amLMLvHNjdsChO9FyJt1
	 gKPTn8na2ogpG9dJOMaIYoW9CPAXVCAefmMfgqYff33rT3yCNF/4fKytA1GWjQgtYog0H
	 qGTNeyRJex9uWb7qfynzsOAlmbermdCQNv6cVFa1tz+JX1QU6/uQ0FoCP/81qH01hrbek
	 aDgkrdI2IBcTM9F+5IaYPRpeYCwvv7q0m16YF7K14ROCYnmi5yeYq/Ek/xrGR9w/Vaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IJA/VbVm";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9AE606A31A
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 16:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D9AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJA/VbVm
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so1598136f8f.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 09:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793291064; x=1793895864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oNt+k5hd6gK3JHgbJpiRSUaj/zK/QDMMxaVigJ+IVv8=;
        b=IJA/VbVmTY7i/P76O6qDHLpY2Zc8yY5xeiV93FXHof7tywFPDDohBaThnpcAfy3mNW
         CgTgKQGF2WcICdOhMAON2fOVgvgv3Jto/o3QMF6r5KZxVTf0vjsP2D+g91YedFAOQTvS
         Dbuh5XJI/FmklQrlIC719berLQXjcRGLXrTiwHeWAR/ErRE56CWqT2zEwqRY36UJR76x
         8deY2RdbEOu33T7cI0ttYK0rnWgvDDABU7xuOUlhIx+08rmyKGBV/rM2EYGa5sQKFIfu
         a5q+aNfTpCV66JMqAtHBMj7GVuMCACfzw4FSTaYN0Iu8RA/nzaT/C5gL8akQ6zcgqhyZ
         lT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291064; x=1793895864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNt+k5hd6gK3JHgbJpiRSUaj/zK/QDMMxaVigJ+IVv8=;
        b=MKtIOnJx3F/LteyERxrgl9x5Boj19aPgy49Vx5xLkFh2wPPH+IgSHiemNClRRtxdUM
         hyyHhhzTqV2kXwb+WkWc7AI385+qqoK3F64YTpv0v+uxBBsShUQcf/tGxO++D4XeAqyH
         cZxg//wNtT5CLqbA2oKisk4AXaDuNv7DM1uByAUGXbpYfskNT66K/zXS0mhIJQWESxFT
         YG5MvME+6mBvPk4N/2+eewvVsaeFlCatoN8Qv3qUo61sBD/AxBwb/L2zam8Xv1Gctk2O
         A6WHT//ehn76vak9P3s4Xh9HN6lxwA5IZwHmMFvf04kPKhKSEZC34taw6vNaODalC1FN
         2e5w==
X-Forwarded-Encrypted: i=1; AKwUvBzzcQ8pqT2FdF0dBigWU2XwTdZMQotBYT31GMMl/UcHBvDJEkCWDd+pjr89deKw9BVPR+ewMOvNFoKG2aU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLANMYcK7xVv3jkyXj/ZFMbn/y+TMvxBEdoz0KJMdUxQk8oMzbB
	3ezYIrH8J3cLEiXapafNyFF0XI9Wf/jssiMUxlwIbuVdVxbjik6Nkm0=
X-Gm-Gg: AYBFou3jqHG+yTAS/W6OVOSX9xmy6rssXq2lNNs3cFt7JC/17F8bdtSyY6Oy2/a78I2
	1vYPL3aO7umTBI0GIu+Vy5Pf9JR/9IznhLHCF2H+3D14NwMajDxgCQN2xHkFV6YzlZuwc4do5ij
	XKX+rpSNbFQHfPcU0qpJ4MSKKbOLoWH9KGBD1DQx+UY6RAcYd2P3YIOQ8fp0xCUQJtO0g8Cx5xY
	xVHxXQ0FcriN1HfryFT+jXQoSFBnr9CbvWTG6bnf8SOvJ24w8CpUnPhjjkHhdf2srHFCAcHo1kg
	87Ero/U9QrebO7Khk577x2CjMJzJDHFxfNxq650971rIZ76xUTLM+15q2jckGPWPomApLEn71lK
	C7l0zYAt+qKnm4Okm1zd9IKdfb1VBt/T3h4j+3RY2VYRmx3cl96YWZlMCb2iR9Vx2K6jHebUUR/
	T79FQdSdoxCeZ9H3qQccEhLIJiZ5jv3NsQDPH9gqQSYeiqfkB+E2REsfOGldUOLvNW5t+MWD8fK
	ir7kXhZnMMQlG4cwKCocfabsUFiLNTmyCccxupJNumqtRxr9SMYZUaqZ6Pf3suq1MBUcygl/w==
X-Received: by 2002:a05:6000:603:b0:48e:389:d2d5 with SMTP id ffacd0b85a97d-48e5d5b4a5emr14665720f8f.51.1793291064450;
        Thu, 29 Oct 2026 09:24:24 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6dfaa4ccsm135494f8f.39.2026.10.29.09.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:24:21 -0700 (PDT)
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
Subject: [PATCH v2 net] nfc: llcp: use disable_work_sync and timer_shutdown_sync in local_cleanup
Date: Thu, 29 Oct 2026 16:24:19 +0000
Message-ID: <20261029162419.2420980-1-tristmd@gmail.com>
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

local_cleanup() tears down timers and work items before
local_release_work() frees the nfc_llcp_local structure.  The current
code has two ordering problems:

1) timer_delete_sync() does not prevent timer callbacks from re-arming
   the timer via mod_timer().  nfc_llcp_tx_work() unconditionally
   re-arms link_timer, and nfc_llcp_sdreq_timeout_work() conditionally
   re-arms sdreq_timer.  A work callback that runs during
   cancel_work_sync() and calls mod_timer() causes the timer to fire
   after the structure is freed.

2) cancel_work_sync() does not prevent work items from being
   re-queued.  nfc_llcp_rx_work() queues tx_work via
   schedule_work(), and the timer callbacks queue their associated
   work items.  Since tx_work is cancelled before rx_work, a
   running rx_work instance can re-queue tx_work after its
   cancel_work_sync() has returned.  The re-queued tx_work then
   runs on the freed structure.

Switch the timers to timer_shutdown_sync() which rejects subsequent
mod_timer() calls.  Switch the work items to disable_work_sync()
which rejects subsequent schedule_work() calls.

Reorder the teardown sequence so that both timers are shut down
first (their callbacks queue work items), rx_work is disabled
before tx_work (rx_work queues tx_work), and data structures are
freed only after all asynchronous callbacks are quiesced.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v2:
  - Switch work items from cancel_work_sync() to disable_work_sync()
    to prevent re-queuing after cancellation, as identified by the
    automated review and confirmed by Simon Horman
  - Reorder teardown: shut down both timers first (their callbacks
    queue work items), then disable rx_work before tx_work (rx_work
    queues tx_work), then disable remaining work items
  - Move data structure cleanup (skb_queue_purge, kfree_skb) after
    all asynchronous callbacks are quiesced
 net/nfc/llcp_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817007cf2..984e7088288f0 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -173,15 +173,15 @@ static struct nfc_llcp_local *nfc_llcp_local_get(struct nfc_llcp_local *local)
 static void local_cleanup(struct nfc_llcp_local *local)
 {
 	nfc_llcp_socket_release(local, false, ENXIO);
-	timer_delete_sync(&local->link_timer);
+	timer_shutdown_sync(&local->link_timer);
+	timer_shutdown_sync(&local->sdreq_timer);
+	disable_work_sync(&local->rx_work);
+	disable_work_sync(&local->tx_work);
+	disable_work_sync(&local->timeout_work);
+	disable_work_sync(&local->sdreq_timeout_work);
 	skb_queue_purge(&local->tx_queue);
-	cancel_work_sync(&local->tx_work);
-	cancel_work_sync(&local->rx_work);
-	cancel_work_sync(&local->timeout_work);
 	kfree_skb(local->rx_pending);
 	local->rx_pending = NULL;
-	timer_delete_sync(&local->sdreq_timer);
-	cancel_work_sync(&local->sdreq_timeout_work);
 	nfc_llcp_free_sdp_tlv_list(&local->pending_sdreqs);
 }
 
-- 
2.47.3

