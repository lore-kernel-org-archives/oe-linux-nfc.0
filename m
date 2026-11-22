Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795336242;
	b=mW4N73JjqVODJ+6xJj2iWGEnSRiHh/Ycns7a703/QM2jFursWWtxLe1OKzP0ctUrV2q1
	 7P3/VGRdU4fDLr/vfqw4/ngAtvRqD7dY2fC2BYCtMs8j4HNRuAON4EknfdQnHNJ7pKHQi
	 gkEcaOCjzQs3aBUuh6gpTaE/5PaWN4S2CI1C5lCkv8gVjk38UoxDfZPyak7/OufLGTlyK
	 4s9AI2xam+OXKJwtH34k3xDsBGVlIfXz/++ABp/VRvThPVjfHlAcUVAhPOMyqn39zJ3on
	 wmXMnO5864tFsIXApSLQzonQNUrp0fb/yCez+BdFF2k+1/aQfzfS3P2rkxJiEUORFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795336242;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=QghZHONbcC8cXlUHYrkvEWHCcbkwipOQI37JigyXCY4=;
	b=cl8dnhNuW8Qr+JYsinmteI3NRwhcbUUssimmQK4y8GtfoQZ5TCk5p0wPiJKjqQt7ad9T
	 h/Q8Jet7IfeLVoAiuGpImahGVDPIxeIdHjlFjA97IpFj34YKSTswBkdwypUOjANXbt9xm
	 fNJicX8NAnBEulk6D+sFdMAbX5SdVs6VRzAs5JsEKG9jtyL4ljiFc2c/1Nu12biRffeTm
	 7jUtHyPr7AbN3YQX9NrqwWXtk/tCzBygUWxouuEhuwsMzKS/VXK6uErddY0tLBMaNQUPD
	 d/etFWQDWjrYJj7KDOyqCBXgKsQ3R5SKWI9ABTqkRLUhXHCA3Mo48crTW+fv/SfNxGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLq5cGQc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465C606A330;
	Sun, 22 Nov 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLq5cGQc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F8A1F000C4;
	Sun, 22 Nov 2026 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795336242;
	bh=QghZHONbcC8cXlUHYrkvEWHCcbkwipOQI37JigyXCY4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iLq5cGQc/vWiTcdo4ee7/AsWiieeWDKdVAvRIW8QInXxgsM2G/SkfO6vWhLfO2szX
	 QQM/DkM/bCFN4ppMdjxSP+47NFIt/W3A3rqKFDbuIvxIUD/lfQ74aKPMXyXC/KlSuL
	 HkIfJ3ExOHv4nY/0gnCNGbaB3Q27HqLL4k7BsuCojxg1IJdYnbh1liInuqU0mUOI8h
	 We3n/c50sXSD1QvXjVz1Ee59Ja5u6TCxbgGIUXQAIyAISNtPdo9eq60AKtErYluED9
	 I7T5sT0MPymg8sGEbO+sacpjo7ZtX64M8c5GVeMNM2zT1sODezzo5VIlZQ2rQx79MJ
	 yeOxKhw1c5OEQ==
Subject: Re: [PATCH] net/nfc: fix skb ownership on data exchange errors
From: netdev-bot+sashiko@kernel.org
To: luob87709@gmail.com
Cc: oe-linux-nfc@lists.linux.dev, johan@kernel.org, david+nfc@ixit.cz,
 netdev@vger.kernel.org, kuba@kernel.org
Date: Sun, 22 Nov 2026 08:30:41 +0000
Message-ID: <179533624147.3135.15529520698659254387@kernel.org>
In-Reply-To: <20261118081341.1514-1-luob87709@gmail.com>
References: <20261118081341.1514-1-luob87709@gmail.com>
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

Critical: 0 · High: 1 (2) · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Low] The commit fixes skb leaks that users can hit, but it has no
  `Fixes:` tag and no `Cc: stable@vger.kernel.org`.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it runs
  through the rawsock error branch that the patch modifies.
- [High] This problem wasn't introduced by this patch, but it is in the
  function the patch changes.

--

net/nfc: fix skb ownership on data exchange errors

This patch documents that a data_exchange_cb_t callback takes ownership
of a non-NULL skb regardless of err. It frees the skb on the rawsock and
LLCP error paths and on the NCI loopback lookup failure, and clears the
Digital DEP response pointer after the callback is invoked.

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
With this rule the callback owns a non-NULL skb whatever err is. Are
there other data_exchange_cb_t implementations that still return early
on error without freeing it?

In drivers/nfc/st21nfca/dep.c, st21nfca_im_recv_atr_res_cb() and
st21nfca_im_recv_dep_res_cb() both start with:

	if (err != 0)
		return;

They are registered as the callback to nfc_hci_send_cmd_async() from
st21nfca_im_send_atr_req() and st21nfca_im_send_dep_req(). When the chip
answers with a non-OK HCI result, the path is:

nfc_hci_resp_received()
  __nfc_hci_cmd_completion(hdev, nfc_hci_result_to_errno(result), skb)
    st21nfca_im_recv_atr_res_cb(ctx, skb, err)  /* or _dep_res_cb */
      return;

Nothing on that path seems to free the response skb. Is it leaked on
every failed ATR_REQ or DEP_REQ? In the DEP_REQ case the upper layer also
never gets a completion.

In net/nfc/nci/hci.c, nci_hci_data_received_cb() has:

	if (err) {
		nci_req_complete(ndev, err);
		return;
	}

nci_add_rx_data_frag() can hand the original skb plus a non-zero err to
nci_data_exchange_complete() through its "if (status) { err = status;
goto exit; }" path. This needs NCI_DATA_EXCHANGE to be set when the frame
arrives, because nci_data_exchange_complete() only calls the callback
after test_and_clear_bit(NCI_DATA_EXCHANGE) succeeds.

Should this branch call kfree_skb(skb) as well?

The HCI wrapper callbacks hci_transceive_cb() in net/nfc/hci/core.c,
pn544_hci_data_exchange_cb(), st21nfca_hci_data_exchange_cb() and
microread_im_transceive_cb() all have a default branch like:

	default:
		if (err == 0)
			kfree_skb(skb);
		break;

That branch only runs with an unexpected async_cb_type. Under the new
rule, though, wouldn't it leak the skb when err is non-zero?

The subject says this fixes skb ownership on data exchange errors.
Should these callbacks be converted too?

> diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
> index 968547c306a5d..c7f5378cd12e2 100644
> --- a/net/nfc/digital_dep.c
> +++ b/net/nfc/digital_dep.c
> @@ -882,6 +882,7 @@ static void digital_in_recv_dep_res(struct nfc_digital_dev *ddev, void *arg,
>  
>  exit:
>  	data_exch->cb(data_exch->cb_context, resp, rc);
> +	resp = NULL;

[Severity: Low]
This fixes skb leaks that users can reach: rawsock_data_exchange_complete()
and nfc_llcp_recv() on NCI or HCI error completions, and
nci_nfcc_loopback_cb() when the connection lookup fails. Should the
commit carry Fixes: tags and Cc: stable@vger.kernel.org?

The hunks also depend on each other. Before this patch, the exit: path
in digital_in_recv_dep_res() with rc != 0 freed resp after the callback:

	if (rc)
		kfree_skb(resp);

A backport that took only the rawsock and LLCP hunks would turn Digital
error paths into a double free, for example the NACK bit case
(rc = -EIO; goto exit;).

Could the commit message say that the resp = NULL change has to go
together with the rawsock and LLCP frees?

>  
>  error:
>  	kfree(data_exch);

[Severity: High]
This is a pre-existing issue and wasn't introduced by this patch, but it
is in the function being changed. Several error paths in
digital_in_recv_dep_res() jump straight to error: and free data_exch
without ever calling data_exch->cb(). For example:

	if (resp->len < size || dep_res->dir != DIGITAL_NFC_DEP_FRAME_DIR_IN ||
	    dep_res->cmd != DIGITAL_CMD_DEP_RES) {
		rc = -EIO;
		goto error;
	}

The CRC failure path does the same once the NACK retries run out, or
when the frame is shorter than 4 bytes:

		PROTOCOL_ERR("14.4.1.6");
		goto error;

Other cases:

  - the DID bit is set
  - the I-PDU PNI does not match
  - digital_in_send_nack(), digital_in_send_atn(),
    digital_in_send_dep_req(), digital_in_send_saved_skb() or
    digital_in_send_rtox() fails
  - the ATN/NACK count or the RTOX value is invalid

Take a raw socket connected to an NFC_DEP target on a Digital driver.
rawsock_tx_work() does:

	sock_hold(sk);
	rc = nfc_data_exchange(dev, target_idx, skb,
			       rawsock_data_exchange_complete, sk);

Only rawsock_data_exchange_complete() drops that reference and clears
tx_work_scheduled. If the callback never runs, does the socket reference
leak? If so, rawsock_destruct() never calls nfc_deactivate_target() or
nfc_put_device(), the target stays active, and later
nfc_activate_target() calls fail with -EBUSY.

tx_work_scheduled would also stay true, so later sendmsg() calls queue
data that is never sent.

A remote peer can reach these paths by sending a malformed DEP_RES. The
resp = NULL added here sits between exit: and error: and does not cover
them.

[ ... ]

> diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
> index f7d7a599fade7..3bf65b1fbe255 100644
> --- a/net/nfc/rawsock.c
> +++ b/net/nfc/rawsock.c
> @@ -156,8 +156,11 @@ static void rawsock_data_exchange_complete(void *context, struct sk_buff *skb,
>  
>  	pr_debug("sk=%p err=%d\n", sk, err);
>  
> -	if (err)
> +	if (err) {
> +		if (skb)
> +			kfree_skb(skb);
>  		goto error;
> +	}

[Severity: High]
This is a pre-existing issue and wasn't introduced by this patch, but
this error branch can get a positive err from the NCI path.
nci_rx_data_packet() does:

	nci_add_rx_data_frag(ndev, skb, pbf, conn_id, nci_to_errno(status));

but nci_add_rx_data_frag() declares the last parameter as __u8:

static void nci_add_rx_data_frag(struct nci_dev *ndev,
				 struct sk_buff *skb,
				 __u8 pbf, __u8 conn_id, __u8 status)

So a negative errno is truncated to a positive byte. For example,
-ETIMEDOUT (-110) becomes 146 and is passed on as err.

rawsock_report_error() then does:

	sk->sk_err = -err;

That leaves sk_err at -146, so sock_error() returns +146. In
rawsock_recvmsg() that value comes back as rc:

	skb = skb_recv_datagram(sk, flags, &rc);
	if (!skb)
		return rc;

Doesn't this make an error look like a 146-byte read with no data
copied?

This affects MIFARE, Jewel, FeliCa and ISO15693 targets on NCI
controllers whenever the frame status byte is non-zero, for example when
the tag leaves the field.

Should the status parameter of nci_add_rx_data_frag() be an int?

>  
>  	err = rawsock_add_header(skb);
>  	if (err)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118081341.1514-1-luob87709%40gmail.com
