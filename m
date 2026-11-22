Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336794;
	b=TKX/5uAgauGRAYS285JOnlp0DO5oQuXY01a2SqIFjXB1NFMsybV8nVL6Q5m0RAttGOkI
	 LJUSYcqnuZDJ3Hnuz4tEAPA4gWJcQaRP8We2Dz9OXarA+sDhyWNfM9xIcBmdpBbpfzhDd
	 r/vpZRFNt+TBtdzpHD2kDL4hnDKw6YVnGF+hgUUHy6oYcLHj2OG2uLq6VN6e8DHY3MXTE
	 ewWGqPZIckc7g2T2bHM1PXOc8zW89X9nlvUOk/4/x2Xr2AaCtzonpcakInLHWkukSXOzi
	 naV6n2yLMEQeWtUJnWGGJQ9lU6qDn1Pj4KHkmR8vBGXnBb6hFDFHh2os+2/lVldidGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336794;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=82tcMrGFYnv3COc/Y81tp4EqEYsTMRAGEcxNCdMHdRc=;
	b=SkAAruU1vIoOPyLYrukNZ0eLpl0UJQ20IQAiIt8xwVYhwpXIHeYOjwvsABDl0uAArkAp
	 fCvCvAMQJfsYrf6YQsGUNoSjv100ZdE9L79GCpdWmfN1mtn+SGDclwAD7gn/rQ6Y7jtAy
	 G3rFUsHZxESTkq+5RkHSXR6do0huN0xLGNPT7jAAHDfrymWN8++0nJtDZ5ClCVK00cfbs
	 58DpzEXY1knMwPAMUYw/aoDtit34MfWiDkf0/1yYTUJrmk/2wIiybIG/uTygnH6aufuMQ
	 6Vx3vHEuAbJWdC/5CyyFW8V8TiQDctrq+a642X2dIGlKL4h8UYOEc2T6Jo5j7L/b0jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qd8eb41b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EA7606A335;
	Sun, 22 Nov 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qd8eb41b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AB51F000C4;
	Sun, 22 Nov 2026 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795336793;
	bh=82tcMrGFYnv3COc/Y81tp4EqEYsTMRAGEcxNCdMHdRc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qd8eb41bJedj+mQUUvTaHt6REHI79qptfzrHrEd1wff4Qydzlbv2mRiTbHCjpNoF0
	 vGrBaUBc9LN3ietU9JGaIeCfTr7chKK5F8DIWztMidhwFUWGE4S55ndJPK0eG/umHd
	 JRydsd62Psp6lmOSDiO8tc+DZwQ/KpA5ttU8lKROnhObZYQ9N3Vtg1MFBqn43MRSgV
	 Lodhbot6dCi1LYHoKZBQC1gUXPYeqjiij5k/2lr8IgufbIk6UzMFvSmxX8dF4Mz1l4
	 9B5+Ycd/zS77dSSYLAgMLYFWLSGs8ClTy41mV954GSAZ/lyPzypnAmsGVx2AovFbSp
	 qJjsSQIPfuUrw==
Subject: Re: [PATCH v2] net/nfc: fix skb ownership on data exchange errors
From: netdev-bot+sashiko@kernel.org
To: luob87709@gmail.com
Cc: oe-linux-nfc@lists.linux.dev, johan@kernel.org, david+nfc@ixit.cz,
 netdev@vger.kernel.org, kuba@kernel.org
Date: Sun, 22 Nov 2026 08:39:52 +0000
Message-ID: <179533679278.3135.7201159366500267043@kernel.org>
In-Reply-To: <20261118081530.32-1-luob87709@gmail.com>
References: <20261118081530.32-1-luob87709@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Low] The commit fixes a user-reachable skb leak in
  rawsock_data_exchange_complete() (net/nfc/rawsock.c) and changes…

--

net/nfc: fix skb ownership on data exchange errors

The commit documents that a data_exchange_cb_t callback takes ownership
of a non-NULL skb regardless of err. It frees the skb on the rawsock,
LLCP and NCI loopback error paths. It also stops digital DEP from
freeing the response after the callback has been invoked.

> diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
> index bcafab5c53e51..d3c2d67357f1b 100644
> --- a/include/net/nfc/nfc.h
> +++ b/include/net/nfc/nfc.h
> @@ -37,6 +37,8 @@ struct nfc_dev;
>   *
>   * When a rx or tx package is lost or corrupted or the target gets out
>   * of the operating field, err is -EIO.
> + * If skb is non-NULL, ownership is transferred to the callback regardless
> + * of err. Providers must not access or free skb after invoking the callback.
>   */
>  typedef void (*data_exchange_cb_t)(void *context, struct sk_buff *skb,
>  								int err);

[Severity: High]
This rule now covers every data_exchange_cb_t implementer. Several
in-tree callbacks still return on error without freeing the skb. Is the
fix complete without them?

In net/nfc/nci/hci.c, nci_hci_data_received_cb() is installed as
conn_info->data_exchange_cb and does:

	if (err) {
		nci_req_complete(ndev, err);
		return;
	}

nci_rx_data_packet() strips a status byte for every conn_id, based on
the device-wide ndev->target_active_prot. That status ends up in:

nci_rx_data_packet()
  nci_add_rx_data_frag(..., nci_to_errno(status))
    nci_data_exchange_complete(ndev, skb, conn_id, err)
      cb(cb_context, skb, err);

Suppose an NFCC sends an error-status data packet on the HCI conn_id
while a frame-I/F target is active and an RF transceive is pending.
Wouldn't that skb leak? This is the same provider path that was tested
for rawsock.

On the HCI side, nfc_hci_resp_received() calls:

	__nfc_hci_cmd_completion(hdev, nfc_hci_result_to_errno(result), skb);

As a result, every non-OK HCI response reaches the callback registered
by nfc_hci_send_cmd_async() with both a non-NULL skb and a nonzero err.
In drivers/nfc/st21nfca/dep.c, st21nfca_im_recv_atr_res_cb() and
st21nfca_im_recv_dep_res_cb() are registered directly as that callback.
Both start with:

	if (err != 0)
		return;

Would every HCI error response during NFC-DEP leak the response skb
here? For example, a timeout when the peer leaves the field.

Separately, the ST21NFCA_CB_TYPE_READER_F success branch of
st21nfca_im_recv_atr_res_cb() never frees skb at all.

Four default branches only free on success:

	default:
		if (err == 0)
			kfree_skb(skb);
		break;

They are hci_transceive_cb() in net/nfc/hci/core.c,
pn544_hci_data_exchange_cb() in drivers/nfc/pn544/pn544.c,
st21nfca_hci_data_exchange_cb() in drivers/nfc/st21nfca/core.c and
microread_im_transceive_cb() in drivers/nfc/microread/microread.c. Under
the new contract, don't these leak skb when err != 0?

nfc_hci_execute_cb() already frees skb on error, so the in-tree
callbacks end up inconsistent with each other and with the documented
rule. Should these callbacks be updated in the same patch, or at least
mentioned in the commit message?

> diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
> index 968547c306a5d..c7f5378cd12e2 100644
> --- a/net/nfc/digital_dep.c
> +++ b/net/nfc/digital_dep.c
> @@ -882,6 +882,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
>  
>  exit:
>  	data_exch->cb(data_exch->cb_context, resp, rc);
> +	resp = NULL;
>  
>  error:
>  	kfree(data_exch);

[Severity: Low]
This isn't a bug, but should this carry a Fixes: tag and Cc: stable? The
rawsock_data_exchange_complete() leak can be reached by an unprivileged
user through an NFC raw socket.

The hunks also depend on each other. The resp = NULL in
digital_in_recv_dep_res() stops the provider from freeing resp, and the
rawsock and LLCP hunks make the consumers free it.

A partial backport would either leak or double free the skb. Fixes:
tags would help stable take the change as one unit.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118081530.32-1-luob87709%40gmail.com
