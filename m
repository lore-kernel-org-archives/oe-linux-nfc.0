Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.42.129.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399963;
	b=LNy6bi/UdtWVmQeycSKJeD7HU9ULRNjyC619831+qzFWljypttqjlOX9oqn6V14wTLGD
	 dG3aqW9iXn7sElCLh0gptGsSFxBEmrVQFZsFpZdkQYVugbuPAXHKXR1ct3NlZ6kodoEvB
	 USOJb4+yW8MvsS2tu3M8Xfeg14RAeVUbuC+zHheignlSymHNYaV01HCjS0don47LVZJBz
	 vKuMxArJsX+SdSg58f+1NDE2mGDgdI/5/TKNrp+2s8zrroJgfrOQsHwBY2meEda0CaC7U
	 Ls68zVri7V5Zi73DAXXMb8AKUNuB6RdU3fUWI6m9nUYK55xdMFVVVPUUNLv12r38VMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399963;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LhhnpK/PlLWovez2c7y+KG05tfOfXBnjt/Ro2hrq1us=;
	b=oRSYpIZOVfY6rgBagPjQo3NGanSpPnyIr11u9BwbKx39CuMWjSmFkadi/ohBgiwpjCio
	 HyPvdCP56XnTrNd2Zoy+Ag2b7XCECUhaJzzYNIhiC7TrlxhWqGYj5I6AMrWWPU4sKAUSZ
	 Y90FDZkiVVgzmCxmdCFb3SaxUMB0pU9W0i+cyyeQlw8a1SpoNcuEHXODqOy8Tfw4Wg0Ye
	 lV7T/yj7E3iwM2YJwWiV4wQyHe9uwXtcXYF3MXl0AsIXEtZUtRmEj/8gsO/4x9SeGNDUt
	 fDKSmsIU6oiZLCh2L+6/4EKeclEq2fQQdrcAsxnniv+cnqpzW0TeFw7lk7DdmkU8D/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ixit.cz;
	spf=pass smtp.mailfrom=ixit.cz;
	dkim=pass header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=r4wZzS24;
	arc=none smtp.remote-ip=84.42.129.46
Received: from ixit.cz (ixit.cz [84.42.129.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73D0606A31A
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 02:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B73D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256 header.s=dkim header.b=r4wZzS24
Received: from [IPV6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e] (unknown [IPv6:2a02:830a:f787:8f00:d622:eaa3:3dd6:8f5e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 926755340102;
	Mon, 23 Nov 2026 03:12:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1795399954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LhhnpK/PlLWovez2c7y+KG05tfOfXBnjt/Ro2hrq1us=;
	b=r4wZzS24rRH2WvFfR01xXWNwLjHNZiDi9dr0d63sGVO2bv9vkZSc1pLQadSctorZsCSvS/
	CvVX8yevhN0M8dTsZgckWjaZhg/OJRS9GOaOaKogUCVquitWfwQMjqJgwUoqCFxu4keqRY
	p04+DS8wAdhpM7oUZn9Uc92XDyUMIcs=
Message-ID: <2e4a2767-ab88-4255-88d5-335cbafe90b3@ixit.cz>
Date: Mon, 23 Nov 2026 03:12:34 +0100
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nfc: nxp-nci: i2c: Do not keep a fault taken in reset
 across power-up
To: emcp@enser.io
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Perrochaud?= <clement.perrochaud@nxp.com>,
 Samuel Ortiz <sameo@linux.intel.com>
References: <20261122-b4-nxp-nci-cold-fault-v1-1-fad784c73cfe@enser.io>
Content-Language: en-US, cs-CZ
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20261122-b4-nxp-nci-cold-fault-v1-1-fad784c73cfe@enser.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 06:13, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>
> 
> On a OnePlus 6T (PN553), the controller powers up once after boot and
> never again. Each power-down logs a read error, and every later
> power-up times out:
> 
>    nxp-nci_i2c 3-0028: NFC: Read failed with error -121
>    nci: __nci_request: wait_for_completion_interruptible_timeout failed 0
> 
> nxp_nci_close() holds info_lock while it drops EN and sets the mode to
> COLD, and the IRQ thread takes the same lock. An interrupt raised as
> the controller goes into reset is therefore handled after close() has
> finished, in COLD mode, where the IRQ thread treats it as -EREMOTEIO and
> records it in hard_fault. set_mode() clears hard_fault only on entry to
> COLD, which has already happened, so the fault survives into the next
> power-up: nxp_nci_i2c_write() returns it for CORE_RESET without touching
> the bus, and the request times out.
> 
> Do not count an interrupt taken while the controller is held in reset
> as a fault, and clear hard_fault on every mode change, since each one
> drives EN/FW and so resets the controller.
> 
> Tested on a OnePlus 6T with this change on the postmarketOS sdm845
> kernel (6.18): five power-up/power-down cycles through the NFC netlink
> interface all succeed, 0.03-0.04 s each, with no read errors. Without
> it, every power-up after the first times out.
> 
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.
> 
> Fixes: 6be88670fc59 ("NFC: nxp-nci_i2c: Add I2C support to NXP NCI driver")
> Signed-off-by: EMCP333 <emcp@enser.io>
Thank you for your contribution, sadly I would need you to use a real name 
following the [1]

|| using a known identity (sorry, no anonymous contributions.)

Thanks
David

[1] https://docs.kernel.org/process/submitting-patches.html
