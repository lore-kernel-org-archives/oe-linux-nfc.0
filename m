Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8534A8A30;
	Tue,  8 Sep 2026 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859103; cv=none; b=MtKOHuPq4Kticf8JNNSX8JVGx+1siqBncoLKY5Ic6HxkM4Ptbd4BmgdX2RUBSlugbR/dLRwMgsIjyxcilm/cGAgKelC2/5nw1wsDIOg4KF0/4u50QsiSwu+7IN7lTa+CmdSjPZ7gAzDgHZUo+TzBvJ7W0fCRmJpsmej/yYMXDf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859103; c=relaxed/simple;
	bh=kNvlalvxumVn6sCpfeN7Zr5Pc4Top0tq/uQLcaoUWaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlYpbTUXhn5dw1AohTV+kSaQrhQaO6CI7rnOolueMT23ASVxSOt8qv5BM6BRsZnYJ9TLJ5gxDWlyGiCLo5m+pCoNa4LOSfUjm5UArrHqNWjBdIb9x2sg4j54kjVs/lxaWBg33G66nZD1L5sUPC0OLI6YHi2RCun0LsBnV7ISzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1vOm3Hq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1vOm3Hq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BEE1F00A3A;
	Tue,  8 Sep 2026 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859101;
	bh=+Qw7ePvRlsoruXdWC3tzKOfYz/49B9gKiFf5BdErUec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z1vOm3HqXuYyGC+lhZgfOqwY1dP6PZyLe1ciF3WcZ53p9tn65MCdDF5wS4BSAhvbl
	 4/qr0F0xIO7QW83WRDuhMH9ogonTR1cG+i3tY8CuCRGNV8Oy/h05thkUc5e9f5SmyV
	 u0ZHdWqQIwfOoemocKpW2/dAgJBBi0Bk9vTpp6kA6hyfQq7K/PM7MZCD2JrSbu9Jgw
	 8Eny9N6Jms0hgGodt7XpdOoC9ho2aEPjdQIRMSJaFp5WCavJztbV+tD+wi3BRrAOBp
	 wcNlykqNNIA/cnB9ols54QS/TmcDZtP1EOZy2YuUUV2+4pYZrFGgwvQEB8o56fAoCC
	 LKrX4jPrZKm+w==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1x3ry5-00000001Hcx-2XXT;
	Tue, 08 Sep 2026 11:18:17 +0200
Date: Tue, 8 Sep 2026 11:18:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: david@ixit.cz, kuba@kernel.org, horms@kernel.org, error27@gmail.com,
	gregkh@linuxfoundation.org, michael.thalmeier@hale.at,
	sameo@linux.intel.com, oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
Subject: Re: [PATCH] nfc: pn533: fix OOB read in
 pn533_acr122_is_rx_frame_valid()
Message-ID: <ap_S2eIZW6bYqZFU@hovoldconsulting.com>
References: <20260906054336.20187-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906054336.20187-1-kartikey406@gmail.com>

On Sun, Sep 06, 2026 at 11:13:36AM +0530, Deepanshu Kartikey wrote:
> frame->ccid.datalen is read directly from the USB response frame
> and used, unchecked, as an index into frame->data[]. A malicious or
> malfunctioning device can set this field to an arbitrary value,
> causing the driver to read far outside the received buffer.
> 
> Bound ccid.datalen against the maximum possible ACR122 frame size
> before using it, and reject values less than 2 to avoid the
> "datalen - 2" underflowing.
> 
> Fixes: 9815c7cf22da ("NFC: pn533: Separate physical layer from the core implementation")
> Reported-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=1853daab1a47603d4678
> Tested-by: syzbot+1853daab1a47603d4678@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

Are you missing an Assisted-by tag here?

> ---
>  drivers/nfc/pn533/usb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
> index efb07f944fce..d08d3b0df988 100644
> --- a/drivers/nfc/pn533/usb.c
> +++ b/drivers/nfc/pn533/usb.c
> @@ -322,6 +322,11 @@ static bool pn533_acr122_is_rx_frame_valid(void *_frame, struct pn533 *dev)
>  	if (!frame->ccid.datalen)
>  		return false;
>  
> +	if (frame->ccid.datalen < 2 ||
> +	    frame->ccid.datalen > PN533_ACR122_FRAME_MAX_PAYLOAD_LEN +
> +	    PN533_ACR122_RX_FRAME_TAIL_LEN)
> +		return false;
> +

Just a drive-by comment, but should this not replace the existing
datalen == 0 check?

>  	if (frame->data[frame->ccid.datalen - 2] == 0x63)
>  		return false;

Johan
