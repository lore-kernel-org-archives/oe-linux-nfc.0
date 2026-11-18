Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996327;
	b=oupWphvNU1NvdvDFGtcsTCyEfMZb3s9OuGalDTuG9pHXtihU2lLzFmVh867nazaFMX29
	 zLNEqHn2eM91CB3U4KQKADs/xg7t9737AW9QISPPklZ7or6x5x3Y2RPjvZG09tLfxCOOf
	 bqZCpRvRdfzDpDsNYpsms5xjCZsnEIM1kbT7yXqXxqnHjNiP/Ax5EwZ2QXdkMeT9iu7vS
	 gxYzNEhzWAHt5fDqFYB9LywU/Sm2DJzHeBj4VVWTi2vvstRxIYIVNoho6jNvFjdjf3epz
	 nQMAPt1mtTP98KQrDeGH6pQ7AqRlVo9kxLjFh5B9r5yMaNDOgY6c+eK6IUceLEq2YUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996327;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OyDXF1a5PnZlSpt+KBvpQnzimcTAYF7v/9u7f8B0PNM=;
	b=cmZKKaG+AWgn0ymm2L/JkAQxSlFd84IecCp+FaGmg4Lavvgsg4ghF1E09URvnxPU33Eh
	 0MIyfUFCxkjgCdNQI1NVAd2qwV5R8qlbXzfDAGm/4B51cNbivjh646MUwLdjr1t/to89G
	 0IZZQ7h4cpQY6cpoGRrz1l83CJvCWA+rLgv5jBVcT/lKztjTPjBl2vU7etHMzic1mblMQ
	 K8sbgbbI36X6aNvt9tKXOOgc0bkaFJgMLj+tfnpEONgYFSmm8eYs2Iucvi6+HeL3yjHio
	 l5jHPGHAL7a729kXS64LyepetPYoW6NWm58wKmjssAY8WuOlOnpLQhz0bJZJ3jWp0Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHtDBXZU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A22606A32F;
	Wed, 18 Nov 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EHtDBXZU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99471F000C8;
	Wed, 18 Nov 2026 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794996326;
	bh=OyDXF1a5PnZlSpt+KBvpQnzimcTAYF7v/9u7f8B0PNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHtDBXZUba4cjORFIZhYfIeveTdtdy1Do587jMnwah18YY/dqoVbcea039Qf2nAP6
	 Ta4LAc7Mz7aV9fGcLYYaJVzegIUGf376ImlmqjBaBhd/Bj0iIU9+eSho6EjF92jgfB
	 iHk0KWh2vdQxwWOmWu5+9y0+DSBqe051B1JF95MrFm+ANOEyXhz12jDTumwvWxIPfC
	 5QUJdD9/ckBwk2yDAF7/v7O8a/I4k/qYnXwTRW3cfLoL61ukLiQJwQI80MkTJLX0aM
	 cDlEiyBDfvrdupclPcSyP2uh+2WW9ZbJwar/KfcaLDDZ2Qb5WyF+fTR3+vR7mHa3Lb
	 6rZ28B4tcTlYA==
Date: Wed, 18 Nov 2026 10:05:23 +0000
From: Simon Horman <horms@kernel.org>
To: joasantonio108@gmail.com
Cc: david@ixit.cz, krzk@kernel.org, oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] nfc: st21nfca: prevent double completion of
 SE APDU request
Message-ID: <20261118100523.GC860048@horms.kernel.org>
References: <20261112-st21nfca-v2-v3-0-c81702269e01@gmail.com>
 <20261112-st21nfca-v2-v3-2-c81702269e01@gmail.com>
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
In-Reply-To: <20261112-st21nfca-v2-v3-2-c81702269e01@gmail.com>

On Thu, Nov 12, 2026 at 01:39:30PM +0000, Joas Antonio dos Santos via B4 Relay wrote:
> From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> 
> Use the spinlock added in the previous commit to prevent completing an
> SE APDU request more than once.  Without this, the timeout work handler
> (st21nfca_se_wt_work) and the EVT_TRANSMIT_DATA event handler can both
> invoke the callback for the same request.  The callback frees its
> context, so the second call is a use-after-free followed by a double
> free.
> 
> Check bwi_active under the lock in both completion paths and only
> complete a request that is still pending.  A response that arrives
> after the timeout still gets its EVT_SE_END_OF_APDU_TRANSFER, as
> before, but no callback.
> 
> Also reject a new SE APDU request in st21nfca_hci_se_io() with -EBUSY
> while one is in progress, instead of overwriting the callback and
> context of the pending request.  The callback is not called in that
> case, so free the context like the -ENODEV path does; nfc_se_io() does
> not free it once the driver has been called.
> 
> Found by LLM-assisted manual code review.
> 
> Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element")
> Cc: Simon Horman <horms@kernel.org>
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>

Hi Joas,

Sashiko.dev has provided an AI-generated review of this patch at
https://sashiko.dev/#/patchset/20261112-st21nfca-v2-v3-0-c81702269e01%40gmail.com?part=2

It raises two issues.

Issue 1:

  > diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
  > index 03a30f797ff8f..63a88a61d310f 100644
  > --- a/drivers/nfc/st21nfca/se.c
  > +++ b/drivers/nfc/st21nfca/se.c
  > @@ -228,6 +228,12 @@ int st21nfca_hci_se_io(struct nfc_hci_dev *hdev, u32 se_idx,
  >  	switch (se_idx) {
  >  	case ST21NFCA_ESE_HOST_ID:
  >  		spin_lock(&info->se_info.se_lock);
  > +		if (info->se_info.bwi_active) {
  > +			spin_unlock(&info->se_info.se_lock);
  > +			/* The callback is not called, see the comment below */
  > +			kfree(cb_context);
  > +			return -EBUSY;
  > +		}
  >  		info->se_info.cb = cb;
  >  		info->se_info.cb_context = cb_context;
  >  		info->se_info.bwi_active = true;

  What happens if nfc_hci_send_event() fails at the end of this case?

  drivers/nfc/st21nfca/se.c:st21nfca_hci_se_io() {
      ...
  		info->se_info.bwi_active = true;
  		spin_unlock(&info->se_info.se_lock);
  		mod_timer(&info->se_info.bwi_timer, jiffies +
  			  msecs_to_jiffies(info->se_info.wt_timeout));
  		return nfc_hci_send_event(hdev, ST21NFCA_APDU_READER_GATE,
  					ST21NFCA_EVT_TRANSMIT_DATA,
  					apdu, apdu_length);
      ...
  }

  When nfc_hci_send_event() returns a synchronous error such as
  -EADDRNOTAVAIL, info->se_info.bwi_active stays true and
  info->se_info.bwi_timer remains armed.  With the new -EBUSY check, every
  later st21nfca_hci_se_io() call is rejected until the timer expires, at
  which point st21nfca_se_wt_work() sends a spurious reset to the secure
  element and invokes cb(cb_context, NULL, 0, -ETIME) for a request that
  already failed synchronously.

It seems to me that while this is worth checking into, it may well
be theoretical or unreachable. In which case I think any solution
need not be included in this patch-set.

Issue 2:

  > @@ -269,6 +275,10 @@ static void st21nfca_se_wt_work(struct work_struct *work)
  >  						se_info.timeout_work);
  >
  >  	spin_lock(&info->se_info.se_lock);
  > +	if (!info->se_info.bwi_active) {
  > +		spin_unlock(&info->se_info.se_lock);
  > +		return;
  > +	}
  >  	info->se_info.bwi_active = false;
  >  	cb = info->se_info.cb;
  >  	cb_context = info->se_info.cb_context;
  > @@ -383,6 +393,7 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
  >  					u8 event, struct sk_buff *skb)
  >  {
  >  	int r = 0;
  > +	bool active;
  >  	se_io_cb_t cb;
  >  	void *cb_context;
  >  	struct st21nfca_hci_info *info = nfc_hci_get_clientdata(hdev);
  > @@ -395,6 +406,7 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
  >  		cancel_work_sync(&info->se_info.timeout_work);
  >
  >  		spin_lock(&info->se_info.se_lock);
  > +		active = info->se_info.bwi_active;
  >  		info->se_info.bwi_active = false;
  >  		cb = info->se_info.cb;
  >  		cb_context = info->se_info.cb_context;
  > @@ -405,7 +417,9 @@ int st21nfca_apdu_reader_event_received(struct nfc_hci_dev *hdev,
  >  		if (r < 0)
  >  			goto exit;
  >
  > -		cb(cb_context, skb->data, skb->len, 0);
  > +		/* The request may have been completed by the timeout already */
  > +		if (active)
  > +			cb(cb_context, skb->data, skb->len, 0);
  >  		break;

  Can a late ST21NFCA_EVT_TRANSMIT_DATA from a timed-out request complete a
  newly submitted request instead?

  CPU0 (timeout_work)       CPU1 (msg_rx_work)        CPU2 (syscall)
  st21nfca_se_wt_work()     st21nfca_apdu_reader_event_received()
    spin_lock(&se_lock)       timer_delete_sync()
    bwi_active = false        cancel_work_sync()
    spin_unlock(&se_lock)
                                                      st21nfca_hci_se_io()
                                                        spin_lock(&se_lock)
                                                        cb = req2_cb
                                                        cb_context = req2_ctx
                                                        bwi_active = true
                                                        spin_unlock(&se_lock)
                                                        mod_timer(&bwi_timer)
    nfc_hci_send_event(reset)
    req1_cb(req1_ctx, -ETIME)
                              spin_lock(&se_lock)
                              active = bwi_active (true)
                              bwi_active = false
                              cb = req2_cb
                              cb_context = req2_ctx
                              spin_unlock(&se_lock)
                              ...
                              req2_cb(req2_ctx, req1_skb)  <-- wrong request

  Once st21nfca_se_wt_work() clears info->se_info.bwi_active and drops
  info->se_info.se_lock, a new st21nfca_hci_se_io() call can install a second
  request before st21nfca_apdu_reader_event_received() acquires se_lock (or
  before a late response from the first request arrives).  The first
  request's response then completes and frees the second request's
  cb_context with stale data, while st21nfca_se_wt_work() can also queue its
  reset after the new request.

  In addition, because both st21nfca_apdu_reader_event_received() above and
  st21nfca_hci_se_io() call timer_delete_sync() / mod_timer() outside
  se_lock, info->se_info.bwi_timer can remain armed after bwi_active is set
  to false; st21nfca_se_deinit() only deletes bwi_timer when bwi_active is
  true, so removing the device before the timer expires can then trigger a
  use-after-free.

This seems to be a problem, but it also seems to be related to the
tear-down race flagged in patch 1/2. And as per my opinion there,
I think this is likely out-of scope for this patch-set.
