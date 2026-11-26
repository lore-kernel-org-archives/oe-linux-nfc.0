Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696829;
	b=JQMvI6IrP+ucZfbLwCGStD2RK5+ECRdA3jklao+OauI5YjClHVPL8mw9lgSoYlTqpdK2
	 imQBs1vRQQu4An5QDs9wtSIguziYu0sDWAozqC9cHuV+uXG+fagQ+m8d9pGsmIu38mDd3
	 Mdlzvt2ZGq7oew0gxuvQnCIOug+FTXwax3s6Sw5mM5pByZqcMQc8H4w1jqOadFV0bwqHD
	 9w1gWl8z3QAuz8K1YoeXCKIXtJ9MEAi12fIisoJhIAz5dTlTOoyg81y2tuXD2EjF/d1/L
	 z4ZLehsC1R6XKyXkrJe9wmJgBCP37yhOJsdqhPPdtTWIInBuy0lPqdfP9ck+14txbOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696829;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vB1GV/8tGNyQg/NxcqXtlLxd+LWTEmgxjMt7djdRTys=;
	b=WOvveCLVB9V1wwNpYy/J4744oeqtlzv1LhZ212PDHr+dwaH9CPFUTv3Nh7/5e3LTTETM
	 /LQ91iM8S++p9PLGQZxNtYoYrxhJF2nvQcN8QPl3dJOge0ogI6AxvjODVBVk8wChzhiou
	 hsrVDx4uTYKSSZXEbXk8H4ZVZX9eE2Q6AdEABpFeSTLDp+IKt+hGXZDIIJUoTO6zPHxlu
	 oTnD9fwTuPsFRkxpYbSOt7OsvCw1m6U29pe1gKjn7RkScudsOVSV4r4v/3hF8+EvbVY21
	 Z0RKVtrbzMEcaYbYw1plF1Z7HCmZJMP6WIKXCA336JI9+KfKmAPl+oSljpVEemoK2wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U5cV6LKW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3286606A31C;
	Thu, 26 Nov 2026 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U5cV6LKW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B151F000CA;
	Thu, 26 Nov 2026 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696829;
	bh=vB1GV/8tGNyQg/NxcqXtlLxd+LWTEmgxjMt7djdRTys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U5cV6LKWcgZlxvIWRzedSIIMtpX0UPX8eo4cNa89pDcm+O+6+1z2904/FUVvaqKE/
	 dZUteQCpLUaoUAtxqC2G6ChYnzw54gY08cay27S4RD/l3uKhRUOzrcfOv9WYqC7gTG
	 YWc+9O22Q1LGJyChT/IJ4Ve9KIkUnH4anl71ra5UEz6xaUVTvL9UkjlUibn3jI+WV/
	 UloQlyivqpW5v/ZOhRBJfehAm9cJlLr/q7vk0BooCSfDcy3fnTfTMl7H+z5j5g+LtP
	 +R4nx4FJz79Xok/PFcBo6f4kGIxXutJCeYmw/IKAEgvYRHws8UwXDXbTCxRX6i0++3
	 olCdJN/SIXHPw==
Date: Thu, 26 Nov 2026 12:40:26 +0000
From: Simon Horman <horms@kernel.org>
To: Shubham Antil <shubham@octane.security>
Cc: netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev, david@ixit.cz,
	gio@octane.security
Subject: Re: [PATCH net v8 3/4] nfc: nci: uart: quiesce callbacks during
 teardown
Message-ID: <20261126124026.GZ31322@horms.kernel.org>
References: <20261119040253.15986-1-shubham@octane.security>
 <20261119040253.15986-4-shubham@octane.security>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119040253.15986-4-shubham@octane.security>

On Thu, Nov 19, 2026 at 09:32:52AM +0530, Shubham Antil wrote:
> The UART write worker can miss a wakeup while handing SENDING back to a
> producer.  Teardown also has no state which prevents a new wakeup from
> queuing work after the close path starts cancelling it.
> 
> The Marvell open path has a related publication window.  It registers the
> NCI device before publishing the UART back-pointers, so an early open can
> use unset transport state or lose the controller response.
> 
> Serialize transmit scheduling and the worker's final state transition.
> When a transmit burst is active, record a wakeup before consulting the
> shared queue.  A partial skb can temporarily be owned only by the worker,
> and an empty-queue test in that window would otherwise discard the sole tty
> wakeup.  Once quiescing starts, block new work and cancel the worker
> synchronously.  Track an active transmit burst across partial writes and
> worker restarts so each tx_start() has exactly one tx_done(), including
> when close interrupts the burst.  Protect tx_skb with the same lock as the
> transmit state.
> 
> Publish the Marvell UART back-pointers before NCI registration, but keep
> UART callbacks gated until nci_register_device() has initialized the core
> queues.  Add a core ready callback immediately before public registration
> so transport state is visible before an early device-open can submit its
> first reset.  Keep the generic ready publication after transport open as an
> idempotent fallback.  Gate receive parsing on an active firmware download,
> NCI_UP, or NCI_INIT.  Bytes rejected outside those states discard any
> partial parser state and still unthrottle the tty, so a later reset
> response cannot be spliced into an old frame and a throttled peer cannot
> remain asleep.
> 
> Before the close-time reset, close command admission and drain a response
> already owned by the NCI receive worker before cancelling command work.
> Make the response and command workers honor that closing gate, then reopen
> it only for the reset exchange and a driver's final close command.  Cancel
> commands after both synchronous stages so a signal cannot leave its skb for
> the next open.  This also preserves close callbacks which legitimately
> submit a final proprietary command.  A late response therefore cannot make
> an old command runnable after cancellation.
> 
> Ask the transport to finish complete queued frames and wait for both the
> UART queue and tty driver buffer with a bounded timeout.  Keep a partial
> frame intact while a reset exchange remains possible.  If framing cannot
> be preserved, skip the reset, stop the writer, flush the tty driver's
> output, and release the unsent data.  Leave that line-discipline instance
> poisoned so a later NCI open cannot append bytes; recovery requires closing
> and selecting the line discipline again.  Clear receive parser state after
> the transport flush and immediately before reset admission opens.  Retry a
> partial write from the bounded flush itself, so line-discipline close does
> not depend on a write-wakeup callback which its write lock prevents.
> 
> Keep tty->disc_data and receive admission valid while the transport close
> performs its reset exchange.  Stop generic callbacks afterward, halt the
> controller while its device-managed reset GPIO is still valid, and withdraw
> the UART back-pointers before releasing private state.  Apply the same
> barriers to the failed-open path and document the sleep, lifetime, and
> queue-ownership contracts of the lifecycle helpers.
> 
> Discovered during an AI-assisted source audit using OpenAI Codex,
> gpt-5.6-sol.  Patch development and test planning used the same assistant.
> Confirmed with repeated NCI UART registration, device-open, and hangup
> cycles using an unmodified kernel and a pty-backed user-space controller;
> no error injection was used.
> 
> With the fix applied, the final v8 registration/publication reproducer
> passed 5 cycles under KASAN, UBSAN, and lockdep, and 5 cycles under
> strict-mode KCSAN.  Lifecycle testing observed all four expected CORE_RESET
> commands in each of 5 cycles under both configurations.  No physical
> Marvell controller was available, and no in-tree selftest covers this UART
> path.
> 
> Fixes: 9961127d4bce ("NFC: nci: add generic uart support")
> Fixes: e097dc624f78 ("NFC: nfcmrvl: add UART driver")
> Signed-off-by: Shubham Antil <shubham@octane.security>
> ---
>  drivers/nfc/nfcmrvl/main.c    |  40 +++-
>  drivers/nfc/nfcmrvl/nfcmrvl.h |   4 +
>  drivers/nfc/nfcmrvl/uart.c    |  60 +++++-
>  include/net/nfc/nci_core.h    |  20 ++
>  net/nfc/core.c                |   7 +-
>  net/nfc/nci/core.c            |  73 +++++--
>  net/nfc/nci/rsp.c             |   3 +
>  net/nfc/nci/uart.c            | 347 +++++++++++++++++++++++++++++++---
>  8 files changed, 496 insertions(+), 58 deletions(-)

Hi Shubham,

This patch is large and complex.
It adds both core changes and a driver implementation of them.
Please consider splitting this up into smaller steps.

I have similar concerns about the complexity of patches 1/4 and 4/4.

And, less critically, patch 2/4 could be split into a patch
that adds READ/WRITE_ONCE annotations, followed by one that fixes
the bug described there.

Given the overall complexity here, you may wish to consider multiple
patch-sets; the bugs described seem independent of each other.

I suggest splitting things up because smaller patch-sets are easier to
advance than larger ones. And the current series seems too large to me,
even if split into smaller patches.

