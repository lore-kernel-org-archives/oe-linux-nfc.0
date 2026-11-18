Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996310;
	b=IzLu+w/2eRntjnZXek8tTQfc0cB51rUFCJio+oSwIBFKpdtXGxBGRISIt5OuY9Qg3rTN
	 CN5h8clEFjjVWvgNhYQg8ifUFI5K2/YhJwF+4htRWx6ETusBt18pPGfooykhiXdKtoSvq
	 ddiWR+6Z4By71CzR5MmaL02VbnPIYDSSg0OSsgYcKgkutzKnCgjrIQrdtDOz/FJvJNJoy
	 /0S+UW6oupzpqYmRop9Qd1TldWB+bcSUOiQDZYH1bjfR2PdI/7FEo3R2eo164UL+aG0aZ
	 8VNXWaY3g874pdlnXILeJ18rMgiUQ4dYsuSYxdHoQFDhU4VDIuccUacVNwKPxB6JlpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996310;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9CUfMcOWf/ySS4QRwsQRGf/yO85yR43VJtR79G/UDeU=;
	b=iTBrWIzQmDzOTLx6vF9mYCw3cIamgDqCK+HyDD3/ApR7nV/0v66hJySi9fOqsvFKtgjF
	 +udlGGTRg545DNtC4s6EncwnoBuZCT2ZuBT192CPcw7uhIsLBViX5FIZf3O2Le07pHmgz
	 K6TEZhYygrTaPqxuZEEOYGAMoc8+O5vPi1d6sTq5hi2UGWmjK3BsltFYnXnRA1qFZWfC3
	 oSKddwA47nYW0Glg1U7Ps3Cs7ku+/OK8Spf7PJtS4ybbWIZAdpmW0LMzwKY1E619f7vuc
	 ESQf3GHQa4ZM221Bn3zqPFahdvjdSL62ICk6AzPvc28BxDzPz4tbgLaGxdwMwMgJtTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cotHS17t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49AB606A31C;
	Wed, 18 Nov 2026 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cotHS17t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9611F000C4;
	Wed, 18 Nov 2026 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996310;
	bh=9CUfMcOWf/ySS4QRwsQRGf/yO85yR43VJtR79G/UDeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cotHS17tDk8ESqd+ambByDtxQFvyc8PHtid4yZuQ1cInxZUY0CHB/+19XYLhRujUE
	 WilRsY107GHFLf/2TK/eQjfE1K45NxIGaDMgeIbe7GRPiUNRbjXxxjF2McY4BBPDSm
	 KPKFvgCo4MefIX/v0a8mqGCK+rFve1WUOcfIfIEr4KHDBDubUDT+aCPeykbHeEohiR
	 op2C+lF1BNYSwunExNPtVdgVq90JdXhWvrPmzPjtaNSeFqBmdvcAG6tPIOrHkSwpoB
	 TKJOLjEZon/KSJ1/M13d6//AigXviqLVA8h+cj+nlOmkUKJ9Z7Wp0eRo+GNHq6Qlrl
	 jyBGSVGwWLH+Q==
Date: Wed, 18 Nov 2026 10:05:06 +0000
From: Simon Horman <horms@kernel.org>
To: joasantonio108@gmail.com
Cc: david@ixit.cz, krzk@kernel.org, oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] nfc: st21nfca: add spinlock to serialize SE
 APDU request state
Message-ID: <20261118100506.GB860048@horms.kernel.org>
References: <20261112-st21nfca-v2-v3-0-c81702269e01@gmail.com>
 <20261112-st21nfca-v2-v3-1-c81702269e01@gmail.com>
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
In-Reply-To: <20261112-st21nfca-v2-v3-1-c81702269e01@gmail.com>

On Thu, Nov 12, 2026 at 01:39:29PM +0000, Joas Antonio dos Santos via B4 Relay wrote:
> From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> 
> The bwi_active flag, callback pointer (cb), and callback context
> (cb_context) in st21nfca_se_info are accessed concurrently from
> multiple contexts without synchronization:
> 
>  - st21nfca_hci_se_io() sets them from the netlink path
>  - st21nfca_se_wt_work() reads/clears them from the timeout workqueue
>  - st21nfca_apdu_reader_event_received() reads/clears them from the
>    HCI rx path
> 
> Add a spinlock (se_lock) and take it around the accesses in these
> three paths.  The callback pointer and context are copied under the
> lock and invoked after releasing it, since both the callback and
> nfc_hci_send_event() may sleep.
> 
> Also move the bwi_active = true assignment before mod_timer() so that
> the flag is always set before the timeout handler could observe it.
> 
> st21nfca_se_deinit() is not changed here.  It still accesses
> bwi_active without the lock; the teardown ordering has problems of its
> own which need a separate fix.
> 
> Found by LLM-assisted manual code review.
> 
> Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element")
> Cc: Simon Horman <horms@kernel.org>
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>

Hi Joas,

sashiko.dev has provided an AI-generated review of this patch,
which seems to raise issues not covered so far.

  Can releasing se_lock before mod_timer() leave bwi_timer armed while
  bwi_active is false?

  CPU0                                    CPU1
  st21nfca_hci_se_io()
    spin_lock(&se_lock)
    bwi_active = true
    spin_unlock(&se_lock)
                                          st21nfca_apdu_reader_event_received()
                                            timer_delete_sync(&bwi_timer)
                                            ...
                                            spin_lock(&se_lock)
                                            bwi_active = false
                                            spin_unlock(&se_lock)
    mod_timer(&bwi_timer, ...)
                                          st21nfca_hci_remove()
                                            st21nfca_se_deinit()
                                              /* bwi_active is false, skips
                                               * timer_delete_sync() */
                                            kfree(info)
  <softirq>
    st21nfca_se_wt_timeout()
      schedule_work(&info->...)  <-- use-after-free

  The ST21NFCA_EVT_WTX_REQUEST branch in st21nfca_apdu_reader_event_received()
  also calls mod_timer(&info->se_info.bwi_timer, ...) without holding se_lock or
  checking bwi_active, which likewise re-arms bwi_timer after a timeout or on an
  unsolicited event while bwi_active is false.

  In addition, st21nfca_se_deinit() reads and clears bwi_active without se_lock,
  only calls timer_delete_sync(&info->se_info.bwi_timer) when bwi_active is
  true, and leaks cb_context if it cancels an in-flight request:

  drivers/nfc/st21nfca/se.c:st21nfca_se_deinit() {
  	if (info->se_info.bwi_active)
  		timer_delete_sync(&info->se_info.bwi_timer);
  	if (info->se_info.se_active)
  		timer_delete_sync(&info->se_info.se_active_timer);
  	cancel_work_sync(&info->se_info.timeout_work);
  	info->se_info.bwi_active = false;
  	info->se_info.se_active = false;
  }

  These gaps are not addressed in the follow-up commit "nfc: st21nfca: prevent
  double completion of SE APDU request" either.

  Link: https://sashiko.dev/#/patchset/20261112-st21nfca-v2-v3-0-c81702269e01%40gmail.com?part=1

I actually think there are two issues here.

1. The headline issue relating to races in teardown. This strikes me as
   a pre-existing problem. And suitable for follow-up.

2. This part: " In addition, st21nfca_se_deinit() reads and clears
   bwi_active without se_lock". And it seems to me it would be worth
   addressing that in an updated version of this patch for completeness.

