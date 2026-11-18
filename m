Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025814;
	b=1VzZbdz15rokYt9ZLniTVXmKnx1W2ScfFCUDDIg0KCYr4cAUvaGSRcPW5UaSl7dOPTBb
	 4Zg/06OwgCp0tZcgLCm42oV7Tvfqrz759d67D++nSvDmT+Lru7roGdP/vAFBeMJyeRvGr
	 QQx7iSzjJibTZ6yFHHVAdgmy/EUfRwRBAvV1cSWGP1nV5HZZP6wHhOR9YEqu0Eny5OR6X
	 cCiuL0xJMdCaWYhKanONWVp/KbmDwi79LaeMldqgm+3qha9OkoE1QUz56MTR9JSul60HJ
	 teaILGH+zPDUhm+KQHgCadI3nSX04Ky7bUVhfHCJlokazX1kVNOtBLhyxl+GccGQc4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025814;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8xIQBbs0SQnfnb2Q6EmYFwPaMd/Q9LTyn9jZVwWF/mk=;
	b=OmBIIDtpwdaxfH7IoEoVBVjImIY9+m/rzLm9pnmZNbYs3m0767yrDtlEKBpG9RTIflzL
	 AtEit8lIZXHqrbkA/oX8WXuoUcJc/9j3XGYIUKr//P3+Wyeao1/cYZQ718Cnraxf8mPUN
	 NCLmxhaquH1FCj1w17JSNsmPCCiFe9T6sDYCqWNeQHzi15uL3YmRKG3n9z7IZPVEGONmM
	 H+8x3ZYlxu1zKOdIhHYc+BOiu84/7rDoO+XamCAU+339/k9UcS5qwHNCorw4lvyjooca9
	 eVcldv+EC4I3VwCmbTd530aeixOzSPbT6hOrNb7tS+8l8slwGgnhpDJt9bC8oPPClxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lhpz2WGX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168A606A320;
	Wed, 18 Nov 2026 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lhpz2WGX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339AD1F000C5;
	Wed, 18 Nov 2026 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025813;
	bh=8xIQBbs0SQnfnb2Q6EmYFwPaMd/Q9LTyn9jZVwWF/mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lhpz2WGXjwx+bqL/p+xO8CummT3MYCqm09s22/8rtMWvfP9Tl0avLQmxWvEn22fpW
	 tuXe/dA3DZYVyFAugLG+cgMVTr/QaIafn56jOan4JMdqKSOHwkx4WGroR6aHZiGCAg
	 sgLzfwbeRNhzaSjWa8b/sQEojjRat24+v/7CP0fuen0MXJVXFjkb3BM9AXWs/XSDoO
	 OUn59AnyHAQJZ/bhi3+YRhLqB4iCKAvIPcJPZpBygq3YuH3cPdZNHgt4Of0KvJHWJl
	 VQC/i36TmrcqFOX9juoEyFkRzaXI/zUph2QIUNOjUR+TAhbioEGQhVW855q4mWR1/S
	 nJz/Qg9T2tF9A==
Date: Wed, 18 Nov 2026 18:16:50 +0000
From: Simon Horman <horms@kernel.org>
To: shyckless@gmail.com
Cc: netdev@vger.kernel.org, david@ixit.cz, edumazet@kernel.org,
	kuba@kernel.org, oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org, pabeni@redhat.com,
	davem@davemloft.net
Subject: Re: [PATCH net 2/2] nfc: st21nfca: Free the ATR_REQ skb after
 sending it
Message-ID: <20261118181650.GQ860048@horms.kernel.org>
References: <20261112-nfc-v1-0-ab0ef166f382@gmail.com>
 <20261112-nfc-v1-2-ab0ef166f382@gmail.com>
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
In-Reply-To: <20261112-nfc-v1-2-ab0ef166f382@gmail.com>

On Thu, Nov 12, 2026 at 10:04:49AM +0000, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> st21nfca_im_send_atr_req() allocates an skb for the ATR_REQ, passes
> its data to the HCI layer and then forgets about it:
> 
>     return nfc_hci_send_cmd_async(hdev, ST21NFCA_RF_READER_F_GATE,
>                             ST21NFCA_WR_XCHG_DATA, skb->data,
>                             skb->len, info->async_cb, info);
> 
> nfc_hci_send_cmd_async() copies the payload into its own fragments, so
> the skb is still ours to free. As it is, one skb leaks on every ATR_REQ
> sent in initiator mode, whether or not the command was queued.
> 
> Free it right after the call, on success and on error, as
> st21nfca_tx_work() does for the same call.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 1892bf844ea0 ("NFC: st21nfca: Adding P2P support to st21nfca in Initiator & Target mode")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested only, I don't have ST21NFCA hardware.

Reviewed-by: Simon Horman <horms@kernel.org>

