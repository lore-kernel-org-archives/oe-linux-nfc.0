Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D92359A66
	for <oe-linux-nfc@lists.linux.dev>; Fri, 18 Sep 2026 03:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702770; cv=none; b=Mfi5TwGWaLLu8GAvAx44KDJDfdOP6FVA90Gmeb15h4dC6VgRDQ4NSNK4YTNXiGScWdxIBBu3wkPL94BDpxE9TEN4hBHR1jWB62WGY+QWI2mRB4h4jQL9fb9w81mYPZXSd2XrVp5/35Ak8waiQBCm/UvNms1od2qAPh/jus4GJiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702770; c=relaxed/simple;
	bh=fZjGGfzjD+e67lahGDJ1EAc/Am9Wz2vBr6GU6aH3PVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j57P1FOp7jYFS6ppclkwdRKQI7ihU9WkQha+957MgIors1IiG7rTzHQxyEyhQJC+eKLg9c0QIPOp32/yYFauSqanQvu8rdxdxAnstn/7cqfh84NG7vf6HsiZT5NPKtzLXckfDBoMgMhOfh6VlxdQQetc+s8MEZrQ9ZmLj1aWcEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5nR34QL; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5nR34QL"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso172484a12.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 20:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702768; x=1790307568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v9YKjnadMhV6kY6CH7XzaeiUdpmUgyn3iCQMQXyXjxw=;
        b=e5nR34QLV9npsqGvF4LLjjCtVwOJUJnfDq0GLkmIFPrFl2Dw/tm+kWci4IdNpgz3kA
         rnn3HFCTfMe4xDz50p92NuXqbJVyG4gN5tuh9hp4XcrOV+hxRRmYqL+5NBLTeEttztQ4
         PCnmCrYKTikYBjdO3nPoQOLVkoqGAh5ogietCFthopCZt+wUdjMH8oPHiO5GuiDcMG4H
         boC6dlDVx7qSd4ufxjx6H2RtOlcJjB+TSLOgCPbCq0KuY50ZvbrA0WrbAQgxee300asl
         lrWGhbDnVd6ghRIQQtEstDNU/G1dZPU2yz/a3fudeimyR+jpPTl1VJCVmtyk6EMI8XiR
         hG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702769; x=1790307569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9YKjnadMhV6kY6CH7XzaeiUdpmUgyn3iCQMQXyXjxw=;
        b=YsziJIysxKyGwRl4bc3yvGGa0EjjFbkb6pWgP8EuCKPMNL2+XJh4fL0elNwZZXTL0i
         QTreNMpDAHHRYYwy0yo7w2oc++qxPPM7Epis/tPUEzoq3LE7rZuKF9fgtgkSLT4DmOgI
         ntvFrO6kTWW8j08IimDIjotUZ90hE1DcpTv7vKY0WwFMpxsKCr1CvR/tl+vhUavcS47r
         urepjIF1Vry+KcpNsnQRX4fcXT/pXx9kxJMhezec5vGYw+wPRzcLJ4coT0ZwOMajdHsI
         7IvnN163yrMAXi03nIW9cpfAsjOWAymv1hPjJTnLuQRbb0DIpb1f4O08ooqUBdTsdOBS
         QhMA==
X-Forwarded-Encrypted: i=1; AKwUvBzM6blnvtPrw2z6OU1WqHZ2G1a5XWnKnvmKHJdLkpwhkAhEl1xKo+u1c1GjDTCl1x7HJsoVxN4NhQ6OjEg=@lists.linux.dev
X-Gm-Message-State: AFuF++nR4pkths/NMeVVcf4lUN/0V6ZtOK4BhuSbUBFI0ocTLqeXUj7e
	1okHLngP2lpkIZGrLXA53qnVXLUEuvgoBNlwsNf9oHcgYoct3V0SGUPj
X-Gm-Gg: AYBFou3lBM0V5p31OJjw8+z5PE+G+7+1SZ2M9wAJWzSRmL9JcePMuygE0Jc5Fecwv8x
	wmy6q2Xw/G4qjG9DV8LN91AW5kHM4O+AWK1ReALjVh9DlZJr2Als6XLsxNPXBh2Qb1mcnuaGM5J
	TQ/u2Z3K9qWyVF03vr9VW3sU75M5w3/y5/HoJd9wzPBIVWSaZNXbDK/DK1HrmOlFL5O++SAjhyF
	6nTnu3C5sw2as98dJMmDqvslXdCo1GjwABXRd6qDMeZKZRh4RrlsmgTdB/+D3q9RAkwPlslNf7H
	Botkm4/j4CNr+bBMkwtOeHMugpEs7H0Abs7JrR/N4v0UmEBlPy+5PCdSPeniHg9/HQCqSTS7fYz
	JFHN21Fc5qJKYOmtEuplUR5r4TcUAStSjcDoF5vjERhf3EVskHiR5TKOe+GTIi+zZvJWGVZjXxa
	aIyZsy6rDN7OV88DzO9992/rPB0/00fbJXbXqhfM/c6oYuPYUs0GIXhjhbX/GFkniLu64CheW+H
	NEDlPiF0bNY4pgzu8L0V5/ZtsiKgv4DyL/Ki1V/qCvEPjMEng==
X-Received: by 2002:a05:6300:4049:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3dd8c2dc837mr2488298637.1.1789702768516;
        Thu, 17 Sep 2026 20:39:28 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:79da:8b9b:16b2:8431])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cdfe957asm1039280c88.7.2026.09.17.20.39.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 20:39:27 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH 0/1] nfc: llcp: reject connect() on sockets not in LLCP_CLOSED state
Date: Fri, 18 Sep 2026 11:39:19 +0800
Message-ID: <20260918033920.85025-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses a socket state validation gap in NFC LLCP socket
connection logic where connect() can be invoked on sockets in the
LLCP_BOUND (or LLCP_LISTEN) state.

Historical background and context:
Earlier patches addressing CVE-2020-25670 / CVE-2020-25673 added an
explicit check for the LLCP_CONNECTING state in llcp_sock_connect() to
prevent duplicate in-flight connection requests on non-blocking sockets
from linking the socket multiple times into local->connecting_sockets.

However, that check implicitly assumed that any socket that was neither
LLCP_CONNECTED nor LLCP_CONNECTING was in LLCP_CLOSED. It omitted the
possibility that a socket had already been bound via llcp_sock_bind(),
which transitions the socket to LLCP_BOUND and adds it to local->sockets.

Vulnerability impact:
When connect() is called on an already bound socket:
1. llcp_sock_connect() overwrites llcp_sock->dev and llcp_sock->local
   without dropping the original references, causing refcount and memory
   leaks (service_name).
2. The socket is added to local->connecting_sockets while still remaining
   linked in local->sockets.
3. Upon receiving connection confirmation (CC), nfc_llcp_recv_cc() unlinks
   the socket from connecting_sockets and links it into local->sockets.
   Because the head of local->sockets still pointed to the socket itself,
   hlist_add_head() links the node to itself (node->next = node), forming
   an infinite loop. Subsequent traversals of local->sockets (e.g. during
   lookup or release) loop indefinitely under spinlock, leading to kernel
   soft-lockups and RCU stalls.
4. If connect() targets a different device index, the socket becomes linked
   across two different NFC devices, causing cross-device socket confusion.

Fix:
Enforce that sockets must be in LLCP_CLOSED before initiating a connection,
returning -EBADFD otherwise, aligning with the state check behavior in
llcp_sock_bind() and llcp_raw_sock_bind().

Tested and confirmed style-compliant with checkpatch.pl
(0 errors, 0 warnings).

Yuchao Zhang (1):
  nfc: llcp: reject connect() on sockets not in LLCP_CLOSED state

 net/nfc/llcp_sock.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.53.0

