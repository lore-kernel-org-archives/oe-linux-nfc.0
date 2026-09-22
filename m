Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7E407CD0
	for <oe-linux-nfc@lists.linux.dev>; Tue, 22 Sep 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064483; cv=none; b=iWFT47Ndlr/2UuuA6bhGw3N8di+j34SPjzo6DnwRgvC910tJjROnlqTJwTCk/W1nSnjfBxNxIujVP9GY9NCc85ewZMA3wSGSpIxTy/L0vt+0W1ECIxElMqjXQNvZ2JVf0fWhYmT4cZcJldWfQd28QYism3wBZB1Tj/i1tc8e58s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064483; c=relaxed/simple;
	bh=Xgr9P5NDRohHNy557cU23inSf3q8IPgz3jcsZq7IAqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KmeunM5HZYCua+izH7upxESxPTRJBr90QiZ0KGIq44PJiPCT4JWgo3ywG/WkkgZLdckPsmtU+gEuRwFIjCaS+EE01x6OtyvSPDhMzRaDyteCmxklCIBdW8bwe8xz62Ad/d7s+qaBP27Y2abymqY+m2G7iJ6DUGcKsvzsUqZkzdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuWTJDI0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuWTJDI0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so3254706a91.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 22 Sep 2026 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064471; x=1790669271; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xgr9P5NDRohHNy557cU23inSf3q8IPgz3jcsZq7IAqg=;
        b=OuWTJDI0w/y7Yz26kkaGEjOSnuDXl28SMQad3/G/8ALGkRBkLQLQpcvmtbaWqLtEwg
         aRv9gU0ZeMmfm98+hBDyhxgkYbhJUbO8Qi4lOtC6Nth6B9Q6mpSY2UVKbHWaDoIwRvUC
         5lSPcfJfWzgIejkSVx1eLSJCgLHeqbws3Z1IAUumDczzeDZBuP7AuLkl7qu/Bnh0r+8k
         k1VPZmTBp65bI2l+2QJEw0OyNhFfOzdELgsxXuuvR01Ziy/Dg3YgwcEi21Au3EqYjp6Q
         kiz3sFVNy+eiv0SYUdvDrjbQ0aW482W9Y3wUECgOGn8hzndz83WdyGsaNdsEx3aqrvZZ
         5FXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064471; x=1790669271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xgr9P5NDRohHNy557cU23inSf3q8IPgz3jcsZq7IAqg=;
        b=q3Wx4iT67ajNaPrl1DOsG19D9VRoxfgzClHANdGvRc9+dRi5/z0BZrEKzVj9W8ISDi
         j9h1lbzHJVCEAL1TSDeHDHL3CkzON6TOTyJHIUIegDr5+cHUbLWVQ+jlvOtFn+T7cCdL
         Bu+Op71NwKBo/s3r3FOmp18/Z4ZTafABKAwNGOqwUWaJvJoU2fuHPVVbkUS1axoh0p2M
         hIbLoFP3ynaFaVY2MzJAoI5Bw9zu5fJ8buABkDwtW8kj/pXvJDRGoItUxGB8z49F/gL5
         HxS0TH/p4IUA4ZQNMIOLQ6I2KsSNSAvdBTWCCgMlhPEqO6UElDS9cp4xLULdOlrQT20g
         SI+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlUWdeJ02HYx9fANUSK641VMq4Qv/keTKYI3+JL4bdRpDeEKCFx4NEGS5OUY1BH9/rh5pFuMvnP3g2LVU=@lists.linux.dev
X-Gm-Message-State: AFuF++nuSfqXKMr6IzGVo1++ek0pWC/tdc22Tvrw2O2rwUiMQKurbZmk
	dDwa72QYAxtP4l7icc5NHdNecul7eUDcNiMPkY/rWttJ3OblxdUIbMaL
X-Gm-Gg: AYBFou0FwUZX4iTL6635QR5z5W6NE3EYe/eUlz2lJbcLl2PCwEewdx4ZbfcP0INMH4Z
	HEwxXd05UaNBCyepZ8NZKz1jJV9FbXbdB7P3hynZHdsMb7Q7nvKmLAMrli0DHjQjLcicFnSrF+1
	KyKtjcy/OzQBlkOGgtWvGMer8KL8WEjEb4qdlzQyCzoa0v4khOXu/kPAdupa6gEOy2dpALTF7Pv
	Is97U85AlUYunv/vYe8xonhbACzEDih0F2WdN6LkPgoAukUY95RCjMYQB8VkE4c2O5jfOw8TRsR
	9Sr9tOl+OsliYIZ220TURGCj2eEIYM1d0t/R6MWZTgT8soUowivzyBR3nEPFa8b8D7rkLFUiPI1
	1uXkwKUcu2dNC+Q9iW2kg41x3MFlnHZKaTVN5lXZ6TD3x1O6diwDOVWQ7hTwXaMjtJsIYdww3ox
	tXpr0ybIHEHQ2McQ0uZjR/WtVpt7lAszacS+xY2QILs30+GmNQdNMkURa/kfGlxl3+NrWFaMSuf
	tCyEC+5Lg01TooZ5iqrO+s1yDdQShqpNE/ww/EYyXQ5HwJIEA==
X-Received: by 2002:a17:90b:2e0e:b0:39e:6a7f:eef0 with SMTP id 98e67ed59e1d1-3a0731ef86fmr388880a91.21.1790064470681;
        Tue, 22 Sep 2026 01:07:50 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:c92a:4bc0:f68c:8fc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06747204csm3350233a91.11.2026.09.22.01.07.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 01:07:48 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH 1/1] nfc: nci: ignore unexpected CORE_RESET_NTF
Date: Tue, 22 Sep 2026 16:07:39 +0800
Message-ID: <20260922080739.35915-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260921125805.224979-1-horms@kernel.org>
References: <20260921125805.224979-1-horms@kernel.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Simon,

Thank you (and the sashiko reviewer) for the thorough review.
The points raised are completely valid and insightful.

1. Regarding FDP firmware update breakage (Severity: High):
You are absolutely right. In nci_ntf_packet(), returning -EINVAL from
nci_core_reset_ntf_packet() aborts the dispatch pipeline (goto end), which
prevents nci_core_ntf_packet() from running driver-specific handlers. In
drivers/nfc/fdp/fdp.c, the firmware patching path relies on this spontaneous
CORE_RESET_NTF to wake up info->setup_wq; dropping the packet causes it to
block indefinitely.

As suggested, in v2 we drop only the core-level bookkeeping (skipping the
ndev->nci_ver update and nci_req_complete) and return 0 so that driver-registered
ops continue to receive the notification.

2. Regarding ntf->reset_trigger (Severity: Medium):
The reset_trigger field is revision-dependent: in NCI 1.0, CORE_RESET_CMD
is reported as 0x00 (0x01 is powered-on), while NCI 2.0 defines 0x00 as
an unrecoverable error and reports CORE_RESET_CMD as 0x02. Hardcoding
either value would break the other generation of devices, so v2 gates
the core bookkeeping on NCI_RESET_PENDING alone and only skips power-on
notifications (trigger 0x01, which means the same in both revisions).
Power-on notifications never overlap a pending reset in the protocol
flow, and both revision's command-triggered values reach the flag gate.

3. Regarding nci_core_reset_rsp_packet() (Severity: Medium):
Agreed. nci_core_reset_rsp_packet() now checks whether NCI_RESET_PENDING
is set before calling nci_req_complete() on non-OK or NCI 1.x responses to avoid
prematurely completing an unrelated request.

4. Regarding NCI 1.x response length check (Severity: Low):
In v2, we explicitly check skb->len >= sizeof(*rsp) to ensure config_status is
not read out-of-bounds in pr_debug().

5. Regarding request serialization / stale notifications (Severity: Medium):
All requests are serialized under ndev->req_lock, and __nci_request() unconditionally
clears NCI_RESET_PENDING before dropping req_lock. Filtering out power-on notifications
(trigger 0x01) ensures spontaneous controller power-ups are ignored, while checking and
clearing the pending flag ensures each command matches at most one notification.

6. Regarding request generation (Severity: Medium on both questions):
The NCI protocol gives notifications no request correlation, so a stale
CORE_RESET_NTF/RSP that is already inside nci_rx_work when a reset times
out and userspace retries cannot be distinguished from the new attempt's
own frame: the flag gate and the trigger check narrow the window, but a
generation identity would require protocol support that does not exist.
The failure path purges queued frames; only an in-flight worker frame can
straddle, and the data it carries originates from the same controller.
If you would prefer, I can add a per-request generation check for the RSP
path where an identity exists, as a follow-up.

v2 patch has been sent as reply to this thread.

Thanks,
Yuchao
