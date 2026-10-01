Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5434A8435
	for <oe-linux-nfc@lists.linux.dev>; Thu,  1 Oct 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861354; cv=none; b=e5MkeZzVTlc95wr1d/qbW6pGmNKeV5TOGSRGv6b+b2Fo1wOHgVEgEZvnHtKZK4q16jiFBZhuNC1aLAg4o+B58kRVgcFI5+gL0VI1BxCzFLPN3b2FT4rctzQrU8unxSAZ3qvnSOCeZOGkbN44KgRJta83jXDhCKfh3Q+GVlGMW1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861354; c=relaxed/simple;
	bh=KpBvRv68yxx08EXLWVK3x95sBLwi6SLW+GcKR0oqMNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKqrGvObkO2CxDNLDcqM8+yODNbnjdZncOVFUqd0H0ra2SvLVCwVAAqw6/s9Qam0llirRv3IYi1sPKSqsvoXvSEyAO83DCrmykzOyheAa1BY0xE7sQyH/O6vwaqCYgDKkk7gTCoBMEM0KbIIBXH7S5Ku+tJpuBemNOcl8+cdfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QacToHBt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QacToHBt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso50054195e9.2
        for <oe-linux-nfc@lists.linux.dev>; Thu, 01 Oct 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861351; x=1791466151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AEptEgQP2inlUl9eYZ6E1q3HveZU/W7oAG+SS9vXAs=;
        b=QacToHBtK902bc3O+IPQBUpiac9iGqjShbXYKPXlp3PGSXF1tJbD4oZO9H5wdfPBNG
         x2vHxnPrR3C2+GbVnnbPxEfl1QLfFy1Xhpc7XdInkHV3yAKWzTSsATPqrRrEiwY+OX3o
         gCw1wGj1TUlmz+CTAerFxCjNzr+zsBPH7Gv34lRRAVybaqTiuBNVvETIp/i09uQ84ahl
         8zgzgPf5JcUkxDieQGhs/fsuvqyihVubTzMFfoNtvZqPmmJAjub6UR4RoFSVms3OZ3eG
         Eb30e0T5jo5A5iTKUBAuXxySfOEXEyaT8zHlOzxAMqxG03VBIhtgnf/5HhDIeKWFTvwf
         PVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861351; x=1791466151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AEptEgQP2inlUl9eYZ6E1q3HveZU/W7oAG+SS9vXAs=;
        b=upqeRNZBwboHXLy0DhFyQNEUYNtG1VO3A/P7FTfqQSAJl5/pSQprvphtNBP6w9dY1D
         73VP5wKyWo4L2KOhe+1pg5b8ypR8Uuh60KD1OenaB1f3FAbBZZ3J+mNipCFCZncq7nt1
         Yj3MkfN6V4bCI2Y1SFJA6jzxVxp4Nc2cEW9NmG9q7BdbAkn7jgRgZkK/8H/KNz4CZX7M
         LGMhiu+yzM8Sv3QZ95nUuKDXs8NplGlWlnAU7MivuvAEKZ3dFfDzrj2AjedEu+OmDcIe
         3fn8WdBcyYbRie68xX5xMAIX5PHIV8P0AFfnW4yWdshC3FCfAqRsJcn8yiM/DgBnJUBQ
         HOMA==
X-Gm-Message-State: AFuF++n12YGSkUV48FgGmB3CCQXyIGm4uD3CvoerY29o9NEm6O01FsI/
	ARLPWs1cg2EXOA/wT8sCQzfuFUUH0Q2BLkfoYfAcmApjHxLHSPrub/RV
X-Gm-Gg: AYBFou1ocLTdNieE/Kde7W/2mwp8URaWJQBie82hwBXED0xWGqeMn0DC0IY5U9mpIiM
	McK/x1xcJsOP2mJ9zFBilVpGRm4jxEbtIyhzkt4e206aVGeLuMrZzy8A17cIjgbMm3I70Tj54LW
	kJPVQw7moU6f55dSfjkgKCJI0VUFzJIzCkWWcS7VjeIXSpxEjtanCi1DQvsEtqkVQ/cczM4fAOU
	YXjBIowNL2XsZxtH6nBMcIjNuNUhtoIpl/mG4QttYNpHwcpZtXTxm2um5oZOZFFMkBr9rTRYM3s
	gWaQ037jc0kd/E+P1ZNbf3vbudJjhRamx4i43H9qV1d0gmaEEzwQvDEROgXkB7Q4R8kpuE6PqNK
	iiqllqWHs3jGZK3XElG0zmk2hxmbp5SdN5H+YN5VL05Kly8aQOauDBySCgJaSLviYUy4nruNNEQ
	PtFDjd82Z4AMxYU+dBNd6zqeewVrUPIo/1QWeABDbP/o43fKY+4JH4eFoXF1x4Hg==
X-Received: by 2002:a05:600c:3b93:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a01b126e77mr98473445e9.32.1790861350760;
        Thu, 01 Oct 2026 06:29:10 -0700 (PDT)
Received: from beelink.. ([187.40.42.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0691c4c4sm7249850f8f.22.2026.10.01.06.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:29:10 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: horms@kernel.org,
	david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+ci3c472c63e196fe9e@syzkaller.appspotmail.com,
	sashiko-bot@kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH net v2] nfc: llcp: prevent resource leak on repeated connect after DM
Date: Thu,  1 Oct 2026 10:28:53 -0300
Message-ID: <20261001132853.1468565-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179058922656.3145.17540746696102333949@kernel.org>
References: <179058922656.3145.17540746696102333949@kernel.org>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the detailed review.  v3 addresses the device reference
issues; the remaining points are either pre-existing or need a
follow-up.  Responding to each finding below.

> [Critical] Can this release resources that a blocking connect() on the
> same socket still owns?  (Thread A in sock_wait_state, Thread B wins
> lock_sock and runs cleanup, Thread A unwinds with stale local/dev)

This is a real concern but pre-existing: the socket lock is dropped
inside sock_wait_state() and a second connect() on the same fd from
another thread can race regardless of this patch.  The cleanup does
not make the window wider -- without it, Thread B's connect() would
overwrite the fields without releasing anything (the original leak).
A proper fix for concurrent connect() on the same socket would need
serialization beyond the socket lock, which is a separate change.

> [Critical] Does a CLOSED socket with non-NULL llcp_sock->dev always
> own a reference?  bind() keeps dev without a reference;
> socket_release() drops the connected ref without clearing dev.

This is what syzbot confirmed and v3 fixes.  v3 clears llcp_sock->dev
in nfc_llcp_socket_release() after the connected put, and for
bound/listening sockets that never owned a device reference.  It also
clears dev in nfc_llcp_recv_dm() for bound/listening sockets before
setting LLCP_CLOSED.  After v3, the cleanup's if (llcp_sock->dev)
guard only fires when the socket genuinely owns the reference (the
rejected async connect case).

The syzbot reproducer for the v2 double-put passes cleanly with v3
applied (tested with KASAN, 0 reports).

> [High] Is the socket always off local->sockets at this point?
> Cleanup sets local = NULL without unlinking; socket stays hashed.

Valid concern.  The cleanup should unlink the socket from whichever
list it is on before clearing ->local.  This is not addressed in v3
and needs a follow-up patch.  I will send one.

> [High] Can the same leak happen through bind()?

Yes.  bind() also accepts CLOSED sockets and overwrites the fields.
The cleanup helper should be called from bind() as well.  Not
addressed in v3; will include in the follow-up.

> [High, pre-existing] Stale sk_err = ENXIO from recv_dm not cleared
> on retry; if recv_cc() races in, connect() unwinds and leaves dev
> NULL, then destruct dereferences NULL.

Pre-existing and not introduced by this patch.  Clearing sk_err in
the LLCP_CLOSED cleanup is the right thing to do.  Will include in
the follow-up.

Summary of what is addressed and what remains:

  v3 fixes:
  - Device reference underflow (syzbot confirmed, KASAN verified)

  Follow-up needed:
  - Unlink socket from local->sockets/connecting_sockets in cleanup
  - Call cleanup from bind() as well
  - Clear stale sk_err on reconnect

I will send the follow-up as a separate patch once v3 is reviewed.

thanks,
Aldo
