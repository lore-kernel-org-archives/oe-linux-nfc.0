Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAE52D5926
	for <oe-linux-nfc@lists.linux.dev>; Sun, 19 Jul 2026 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784463253; cv=none; b=lbRB9kExPLGABGhlBPFZwE/uzjFgGgDGlGU6zgHzXYOMWby9GAJ7khhPWLoL+kahpstc1fSpTJL1CHvnZlwH9HhboU9QVCbKFwQRpLd7VfInwSOsVt7VOlwGux2LhSNhbL3UF3YwOGem+rl91a4MaZwQyMMb8TzkgrrOJ8bM9TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784463253; c=relaxed/simple;
	bh=n74QA6Bp7DlNao/fLiVOT578bz0UE/d51QFiAJzoY+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xkbs8zBxXuro5d7Wr4gZlgIo9uuKiz8r5Ex2FsFZJrK7uYvhr42VTp77zZMazoXIO4W+Swe/Iz8LfUdAPDTZmhEeD5sfj6va4DXcrWQGVSBZkeEoaIuEOdifRxT3MjgWeOlQSfvWUN9Do62YZxVdCnFdhLC5VcD9nBudI5g2MKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=B1RuRpwh; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="B1RuRpwh"
Received: from [192.168.1.182] (ip-62-24-73-79.bb.vodafone.cz [62.24.73.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 9A69653401F9;
	Sun, 19 Jul 2026 14:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1784463249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ab2MQ2LRcvSBzPXG69BvKFFbZxI1zSYKmeh8It7jStI=;
	b=B1RuRpwhYorVvqYgV8IwvhgPrUbo9ULLOcuzn2Tc/fRi2mV3cc2CnYv6LMxFwuxz2GFWys
	iq/kKjm/4LoU88z2Graq1NNrVbZm+Nv3K5PxJEkvmkPbjdGWwuSWma6h1vBqLiglA09ERR
	/5hou4gT0RoLUnCwVy3ZVspDf78kiaM=
Message-ID: <315535a1-ca29-4f52-b027-9e5af86effd3@ixit.cz>
Date: Sun, 19 Jul 2026 14:14:08 +0200
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nfc: pn533: free queued command skbs during cleanup
To: raoxu <raoxu@uniontech.com>
Cc: kuba@kernel.org, krzk@kernel.org, error27@gmail.com, kees@kernel.org,
 oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org
References: <3B4941C5D2E3FEE0+20260706083926.798888-1-raoxu@uniontech.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <3B4941C5D2E3FEE0+20260706083926.798888-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 10:39, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> pn53x_common_clean() destroys the workqueue and releases the common
> PN533 state. It purges resp_q, but leaves fragment_skb untouched and
> drops queued pn533_cmd objects without freeing their request skbs.
> 
> Queued commands are created by __pn533_send_async() when another command
> is pending. At that point the queued command owns cmd->req until it is
> sent or discarded. Fragmented transfers can also leave skbs queued in
> fragment_skb.
> 
> Purge fragment_skb and free queued command request skbs before freeing
> the command objects.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   drivers/nfc/pn533/pn533.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
Hello Xu,

thank you for working on this. Could you append Fixes tag and add Cc for stable?

btw. you may want to also look at Sashiko output below [1].
These issues are preexisting, just in case you wanted to fix more of pn533.


commit 6e3289c813a4d66537faa65e9880657bebff74b1
Author: Xu Rao <raoxu@uniontech.com>

     nfc: pn533: free queued command skbs during cleanup

     pn53x_common_clean() destroys the workqueue and releases the common
     PN533 state. It purges resp_q, but leaves fragment_skb untouched and
     drops queued pn533_cmd objects without freeing their request skbs.

 > diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
 > index d7bdbc82e2ba2..de2b7f4d708c6 100644
 > --- a/drivers/nfc/pn533/pn533.c
 > +++ b/drivers/nfc/pn533/pn533.c
 > @@ -2799,9 +2799,11 @@ void pn53x_common_clean(struct pn533 *priv)
 >  	destroy_workqueue(priv->wq);

This isn't a bug introduced by this patch, but is there a use-after-free
risk in the disconnect paths involving this cleanup?

In drivers/nfc/pn533/usb.c:pn533_usb_disconnect(), the core driver state
is freed via pn53x_common_clean() before hardware transport operations are
stopped:

	pn53x_common_clean(phy->priv);
	...
	usb_kill_urb(phy->in_urb);

When usb_kill_urb() cancels the in-flight URB, the completion callback
pn533_recv_ack() executes with -ENOENT and dereferences the already freed
priv pointer to queue work on this destroyed workqueue:

	case -ENOENT:
		dev_dbg(&phy->udev->dev,
			"The urb has been stopped (status %d)\n",
			urb->status);
		goto sched_wq;
	...
	sched_wq:
		queue_work(priv->wq, &priv->cmd_complete_work);

A similar ordering issue appears in
drivers/nfc/pn533/uart.c:pn532_uart_remove() where priv is freed before
timer_shutdown_sync(&pn532->cmd_timeout).

 >
 >  	skb_queue_purge(&priv->resp_q);
 > +	skb_queue_purge(&priv->fragment_skb);
 >
 >  	list_for_each_entry_safe(cmd, n, &priv->cmd_queue, queue) {
 >  		list_del(&cmd->queue);
 > +		dev_kfree_skb(cmd->req);
 >  		kfree(cmd);

This is a pre-existing issue, but does dropping queued commands here cause
callers to hang?

When commands are removed from the queue and freed, their complete_cb is
never invoked. Callers waiting on wait_for_completion() inside
pn533_send_cmd_sync() could hang forever in TASK_UNINTERRUPTIBLE, and
async callers might leak memory allocated for complete_cb_context.

This is also a pre-existing issue, but does this cleanup routine also need
to free the actively executing command?

If the device is removed while a command is actively in-flight, it seems
priv->cmd and its associated cmd->req SKB might be leaked here when priv
is ultimately freed, since the active command is not in the cmd_queue.

This is another pre-existing issue, but does a transmission failure
permanently stall the command queue elsewhere in this file?

In drivers/nfc/pn533/pn533.c:pn533_wq_cmd(), if the physical layer
transmission fails:

	rc = dev->phy_ops->send_frame(dev, cmd->req);
	if (rc < 0) {
		dev->cmd = NULL;
		dev_kfree_skb(cmd->req);
		kfree(cmd);
		return;
	}

The function frees the command but skips calling its complete_cb (hanging
the caller) and fails to reset dev->cmd_pending = 0. This seems like it
would permanently stall all subsequent commands in the cmd_queue.

 >  	}
 >


[1] 
https://sashiko.dev/#/patchset/3B4941C5D2E3FEE0%2B20260706083926.798888-1-raoxu%40uniontech.com
