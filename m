Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1433C3FA5F0
	for <oe-linux-nfc@lists.linux.dev>; Tue,  1 Sep 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274077; cv=none; b=DpsuCrW2BzewZ3u+tYEvRWFyvHFtFZ+DgFDz0A5n4bg/Izi8Q8kaNGWYk5UYlrw0RMB6G0PjqqeyVHcVy4+WmlNk4poruuu893EUNpCzrh2jR5IiLw3xTR99S4tEaYgZsGytk/Rq1UZmX9EX/lHEZOrQAStR17AvllIxaHmH9BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274077; c=relaxed/simple;
	bh=bqnDidL0h/ZcQFW836nIF9vhE8xMk4iT7WurfKQvwcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bg6cJ2ADX4gadPuA2wcb9zi4lnwvtUXgU9dcbGbDfTXh2QAGgDXz2NPpjfCPfkoUmzVE751qSBdFO6zd2xYNOB/NIHnaeIxuQs/CtP0YSGzMxySSF4itAQaH9GZLhujnh1T33sHQ/Lhujz+beSgGRKSQS083mAUtvd170YGq7f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=VJaZA5Nn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="VJaZA5Nn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc891373e0so44532725ad.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 01 Sep 2026 07:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788274075; x=1788878875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXcMG77ozJuXk/Ixzm8x0lK3YDKIcZWH78CeLX8unbw=;
        b=VJaZA5Nnls0q9Kqo3BiSrLir3JJWpzQTbkhktHA/Gj8E5pxcKz3yYSFZE73xMt/OmY
         /rGwrwErP6fl9FzpD1RKtqZZHhELywkFGVyQfOqAixiq3zRSZqQ09mmMspiUP5MhP2+2
         TWmyrRbHCIv9mPrVWkwplF+cLnZiSw7596S9LQg1nNfoX1WimAEYI9jcyrYnEEM2aZsB
         1zFO0DbO+oByxkTxSlWLxS6iYGzUTzApYDovXaQJEcsqbH4KWyVJBjCgzrMI4mIeyrUk
         cr9pA6fabO/H2p0TBxyXMMp4rSinFnOBQPXth1VScuI1CVW3n2JXQzAbdB/N7C3wxuaV
         QH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274075; x=1788878875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXcMG77ozJuXk/Ixzm8x0lK3YDKIcZWH78CeLX8unbw=;
        b=GW5zYGUiZJz7F+dizn5Uc+/z/4fUPixCLDtvHVowR5sesrOgLzE3Pe5+yZl1hbhnMt
         hEah8Jf/PS3QGrvLPSpn5/3Fdwn0yUJ/8qnAV3gPrq5RdlBrh1oXOXhq15+7HnPbENIM
         Q0IFjPcZs0BZxH0yQnQ8E9S9t8661LkfwVxIyD+kH3XUgxydIrD5TN5nkum8GskchRtF
         BgKL7ek+EUO7d3AdD7twFgWSmQqdeEOW4t0AbQ8dvbv1OdekARP5CgBQbTG2AsNQ4hEJ
         FpzNftKfStcd4ejjNs4CaRBbWpkJ/zVg5Fid4sN/j8MqcMbfu4TnzuiCQ0g/CGQt7h5B
         PsIw==
X-Gm-Message-State: AFuF++k8QaCQTtJ3uDyxGjC1YUKtnMSxEa5J6ao0JmKPQbvriXBrVShc
	trMyOjHCLjZHIwvunQV+8M1SpJ348VFF43FwQwnrGv63Lem2mizkKj0oXr/+umYSs6zte9tc0qy
	tGU/SwuSon0Y=
X-Gm-Gg: AYBFou2ZvwGt2EBVyV5szKlrKN9+K4BjF0QLy8RfmljH391pb+kGwQoIbW0K+KO6hQ4
	ynbYgxICpNhmsUULcFlcEe5kdMEFpI0aldQfdh5PXxJWglhDdcpn8aphcpRc/METSCzd+9+Q+4L
	v5y0SUfk9VFy6gzmFhUTZowQCaSx/zfVSC8S5cNiZV2e1veJbl73iz9MihKhCiexr9wEZYWJgJC
	x190mn8pFowBMLxGscsfWvYO2cc8pgw2zYf+9+/8FDAPQiqCJNaRe1aHiY1bHMZCSuWV1dhqStT
	/j87Adg3RzOUIt81bBnefrtHqOEMNgY5qY472IKM6VS/5mMulbSQz/TWR/urXtAZ5GzQONu7Aao
	ElKdwaGxVY38YwnPjxb+VIA3c5CTJDTCldfAFHYGcUPc9POREtHUizpX2FNudBI0KFQUUPu3mG/
	n3eC5vn0oufNlCfXMsTIykj48COlH+fllbRwKiS1CXvRu3v4HBlHWlJ1gAW5QATX7WQ0iEV3zF
X-Received: by 2002:a17:903:2c9:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2d906dba09cmr306818265ad.11.1788274075242;
        Tue, 01 Sep 2026 07:47:55 -0700 (PDT)
Received: from enjou-Legion-Y7000P-2019 ([167.71.204.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd35da91sm245975ad.15.2026.09.01.07.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:47:53 -0700 (PDT)
From: Ren Wei <weir@nebusec.ai>
To: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	horms@kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	error27@gmail.com,
	kees@kernel.org,
	pengpeng@iscas.ac.cn,
	raoxu@uniontech.com,
	rosenp@gmail.com,
	dddddd@hust.edu.cn,
	joe@dama.to,
	ian.ray@gehealthcare.com,
	kuniyu@google.com,
	linma@zju.edu.cn,
	vega@nebusec.ai,
	rakukuip@gmail.com,
	weir@nebusec.ai
Subject: [PATCH net v2 0/1] net: nfc: Fix use-after-free in general bytes retrieval
Date: Tue,  1 Sep 2026 22:47:31 +0800
Message-ID: <cover.1788157545.git.rakukuip@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luxiao Xu <rakukuip@gmail.com>

Hi,

This patch fixes a use-after-free (UAF) bug in nfc_get_local_general_bytes()
where the local structure could be freed prematurely by nfc_llcp_local_put()
before the returned pointer was accessed by callers.

The fix refactors nfc_llcp_general_bytes() and nfc_get_local_general_bytes()
to accept a caller-provided destination buffer and copies the general bytes
safely before decrementing the reference count.

Changes in v2:
 - Fix GCC -Waddress compiler warning in nfc_llcp_general_bytes() by removing
   the redundant nullness check on 'local->gb' array.
 - Fix line wrap indentation and column width across modified driver files to
   conform to the 80-column limit.
v1 Link: https://lore.kernel.org/netdev/cover.1786029423.git.rakukuip@gmail.com/

Thanks,
Ren
Luxiao Xu

Luxiao Xu (1):
  net: nfc: fix use-after-free in nfc_get_local_general_bytes

 drivers/nfc/microread/microread.c |  6 +++---
 drivers/nfc/pn533/pn533.c         | 14 ++++++++------
 drivers/nfc/pn533/pn533.h         |  2 +-
 drivers/nfc/pn544/pn544.c         |  7 +++----
 drivers/nfc/st21nfca/core.c       |  8 ++++----
 include/net/nfc/hci.h             |  2 +-
 include/net/nfc/nfc.h             |  3 ++-
 net/nfc/core.c                    | 15 +++++++--------
 net/nfc/digital_dep.c             |  8 ++++----
 net/nfc/llcp_core.c               | 17 +++++++++++++----
 net/nfc/nci/core.c                | 16 +++++++---------
 net/nfc/nfc.h                     |  3 ++-
 12 files changed, 55 insertions(+), 46 deletions(-)

-- 
2.43.0
