Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470577;
	b=pyfZM5vuOAd9fxifvt94CMJ+J0A+dIu5kp+ih28FC+aDud1O0zjob7zMtam8GTxzvSMt
	 pLdVTXv7h1dXz/Ui/mouLi99yAB9/iEpO+FNoYgRhC6h0pUURRokGtbjkRDZgeQlm0Wjf
	 zAJAAKxuTG9mTELTtymsuRUE7+ydIQP01DBn06M/U8lklf/llNOP62qJ4nY9rZyDNClvt
	 S4YgzwzJLGbPwuPpn6cxHdoFllYMbCfthGf4G22PXxdMIqNEcQQ30TNvoW7kYA8A0Fnmp
	 sYBE+JHioYjtSNdRQcSoHuuDXaJqf6lsZPickbdpimJvSSUKL/ENJI16kC7p3MLsTWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470577;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3i4YFhDQqwFRN0eL3c14TmSfVrmtI+Win333xb2+xCE=;
	b=IKfOFsXZhecO7G4YuFziMRmPj7PIaiYKwuQmPyNSOP4MvSjQGyAUmDubiex1xQC9nC1k
	 miMpr1mv9mhLyLcNhLwSBl6JN8LRvpLolTf2erJ5vZWdP/vxHnDG3TVYC+leIqvBnFwqw
	 hFUbGSPAqoWInNiH+Ne2HLPrJ0A++nWERJbNjSd2WR4ThN3aT/0TTAPNQbwG5iPQDQOAp
	 fsXSN3srV/pmuqWcwHlpOx0sUgEImIOYhULWK7q/FyfRaQB1zh+BliF/h5ShsGep1cqiF
	 tlVHV4/Szzd/tFP64OyA7Ct9kq8rbjdT9wyGvPkYiZwHtjDTPq58ys51x5Nz0TbiZTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkcHA5+4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373D606A321
	for <oe-linux-nfc@lists.linux.dev>; Thu, 12 Nov 2026 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkcHA5+4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3761F00A05;
	Thu, 12 Nov 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794470577;
	bh=3i4YFhDQqwFRN0eL3c14TmSfVrmtI+Win333xb2+xCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RkcHA5+4+VVCeVaTTlJHrPbulzlLRpWtC6cycEICTduZB96BVQ8ct/AyHqFoSrh/R
	 ZFxufKVkpslmRQHXQ0UvKh2dIeHj21sa6OU6XaWBAiLS1BZFTjQbkIXzZnxgP3+iAZ
	 WYJmKDhZ3TOD39fYyf21mIYqUxcj3UJKdmTmQK+NwPC8j+nwnK0vL1CvG3W+HfB4pH
	 tNZSaOqgHTKMV9eSDgxFHKmvTU02I2EhGyr2Hr0dShxGqWEbosDNMq/lNn+1oH599x
	 XJWq3U00+6VmmFefNjRLs5N2P1So71gzVrQ/EQySAp9kX8UYoKF0GFLs1HOM25ia6d
	 a3f0enckfeJKQ==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xRPlm-000000014zB-2XFb;
	Thu, 12 Nov 2026 09:02:54 +0100
Date: Thu, 12 Nov 2026 09:02:54 +0100
From: Johan Hovold <johan@kernel.org>
To: bin luo <luob87709@gmail.com>
Cc: oe-linux-nfc@lists.linux.dev, david+nfc@ixit.cz
Subject: Re: [PATCH] NFC: fix skb ownership on data exchange errors
Message-ID: <avVyrsYGxh3ONYH8@hovoldconsulting.com>
References: <CALa7h7FHWZRHxnqEeAUEH=CNs6Y9pnkfPq1LrDHGfyCNaoqAeg@mail.gmail.com>
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
In-Reply-To: <CALa7h7FHWZRHxnqEeAUEH=CNs6Y9pnkfPq1LrDHGfyCNaoqAeg@mail.gmail.com>

On Thu, Nov 12, 2026 at 12:50:52PM +0800, bin luo wrote:
> Hi David and Johan,
> 
> Thanks for reviewing the report. I will follow up with this as an ordinary
> NFC bug fix.
> 
> The issue is that a data-exchange completion may pass both a non-NULL
> response skb and a nonzero error to its callback, but the callback contract
> does not state who owns the skb in that case. In rawsock,
> rawsock_data_exchange_complete() jumps directly to its error handling path
> and never reaches the existing error_skb cleanup. The LLCP completion
> callback has the same ownership gap: nfc_llcp_recv() logs the error and
> returns without releasing a non-NULL skb.
> 
> I propose to make the rule explicit: ownership of every non-NULL response
> skb transfers to the callback, irrespective of err. The rawsock and LLCP
> callbacks then release the skb on their error paths. Digital DEP currently
> calls the callback and then falls through to cleanup that may free resp
> again when rc is nonzero; setting resp to NULL immediately after the
> callback prevents that double-free. The digital_core completion already
> frees an errored response and passes NULL to its callback. The NCI loopback
> callback also needs to release skb if its connection lookup fails.
> 
> The final five-file patch was built against Linux v7.4-rc1, commit
> 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4, with the same x86_64
> NFC_VIRTUAL_NCI, KASAN, and kmemleak configuration used for the baseline.
> The QEMU TCG guest ran 32 NCI 1.0 MIFARE exchanges with a nonzero data
> status. Each rawsock create/connect/send/error-receive sequence ran with
> effective UID 65534 after the root harness had provisioned the virtual NCI
> device and polling session. All 32 iterations passed. The fixed-kernel
> serial log contains no kmemleak unreferenced-object records and no KASAN
> report. The baseline run of the same test recorded 48 kmemleak suspects.
> This runtime test covers the NCI-to-rawsock path; the Digital DEP and LLCP
> changes were compile-tested but were not triggered by this QEMU selftest.
> The NCI loopback cleanup was compiled but that failure branch was not
> triggered by the QEMU selftest.
> 
> For reproduction, the root harness opens /dev/virtual_nci, registers a
> virtual NCI controller, and starts polling for a MIFARE target. The test then
> switches its effective UID to 65534, creates an AF_NFC SOCK_SEQPACKET socket,
> connects to the target, and sends the MIFARE command 30 00. The virtual
> controller returns the NCI data frame 00 00 02 aa 01: connection id 0, RFU 0,
> payload length 2, response byte aa, and nonzero data status 01. The guest
> repeats this as 32 separately initialized virtual-device sessions and runs
> kmemleak scans afterward. The same test on the baseline produced 47 detailed
> unreferenced-object records; the fixed run produced none.
> 
> The complete proposed change is inline below; no binary attachment is
> included.Best regards,
> 
> Bin Luo
> University of Electronic Science and Technology of China (UESTC)

Please provide commit message in the common format (problem description
followed by a short indication on how the patch addresses that written
in imperative mood).

It's good to mention how you found and tested things but such
information, along with greetings etc, can also go under the --- line
below so that they don't end up in the commit logs.

See https://docs.kernel.org/process/submitting-patches.html for details.

> Signed-off-by: Bin Luo <luob87709@gmail.com>
> 
> ---
>  include/net/nfc/nfc.h | 2 ++
>  net/nfc/nci/core.c    | 1 +
>  net/nfc/rawsock.c     | 5 ++++-
>  net/nfc/llcp_core.c   | 2 ++
>  net/nfc/digital_dep.c | 1 +
>  5 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
> --- a/include/net/nfc/nfc.h
> +++ b/include/net/nfc/nfc.h
> @@ -38,5 +38,7 @@
>   * When a rx or tx package is lost or corrupted or the target gets out
>   * of the operating field, err is -EIO.
> + * If skb is non-NULL, ownership is transferred to the callback regardless
> + * of err. Providers must not access or free skb after invoking the callback.
>   */
>  typedef void (*data_exchange_cb_t)(void *context, struct sk_buff *skb,
>   int err);
> 
> diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
> --- a/net/nfc/rawsock.c
> +++ b/net/nfc/rawsock.c
> @@ -157,5 +157,8 @@
>   pr_debug("sk=%p err=%d\n", sk, err);
> 
> - if (err)
> - goto error;
> + if (err) {
> + if (skb)
> + kfree_skb(skb);
> + goto error;
> + }

Also note that your patch is whitespace damaged (tabs removed) so
something is wrong with your email setup.

Try sending the patch to yourself first and make sure you can run
checkpatch and apply the result using git am.

git-format-patch and git-send-email are useful tools for this.

I believe you should also CC the netdev list.

Johan
