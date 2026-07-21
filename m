Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543B2DBF75
	for <oe-linux-nfc@lists.linux.dev>; Tue, 21 Jul 2026 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657231; cv=none; b=Ww+t5jUK/lu4WjgCHPvG8wEOfusoMpcepN2GMw84Nl1DK/A6ny/jq3t475Qc965OsIXDtT/IntL0pRbF1WQ9iOWXNM8vviWFbu7awiSG5wm8KzWts6PAXK04TJXuWt3OQlxVtMeL+SLAOouCJH08WiEXjVBH4Yoq8/Ba3wFdJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657231; c=relaxed/simple;
	bh=9lXSt83zDc2iahpMJgYIEg63ZHtetzR6WzV0wmmwP5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJtWDN0eRD77oPezXlUid/BxdozWsA1AIuBXo63R30wt9emPsk2lM5RoRN6WVpY4+08cU8LPxadRA/WlNuBBDFgoE/lcfG6HUFm2M/2OXdiOaGW5NFzCWF627MvP8utJxeyQIZM7UcH/UuxKBvGu86NXu8YzyCHIdsaOqQhHLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ol+7fj9b; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ol+7fj9b"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8efec2c28f8so55397846d6.2
        for <oe-linux-nfc@lists.linux.dev>; Tue, 21 Jul 2026 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784657228; x=1785262028; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//omtI2xpVdB5Yf7tp/3B0bE0I7pWALaYODcnC7HZFM=;
        b=ol+7fj9btwzLLYvjQS6XdVUO9FlvcJPJIhc5RY4Cysd8YxY2Z0dGHRD952NzdeyZDw
         uwlnX1IuW3GqtfcAx9Qq/Q8aA6UttlJEGcPaLt6kzPu1WnePCilqkblRMEnPvcbcE7Is
         SOiTaywSUyVnPPdbRC79SPNPaxkunx8IasuuTFt9nfqhN6nWzSfYGFzeFxGO9kqzrb2i
         jRX6xARoXiFL9ijOT4zG0pPXd1CSGrnCRmJ9JvDhXjDt4sHz/3UMfSPpkZsxhv07RtqE
         yj6wqygdSxzPNCmZSnZAC9aXHSmy80cta3Ijl2E4+z8GxMG0NAoCG9tAbv+jSIIg46Sz
         OV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657228; x=1785262028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//omtI2xpVdB5Yf7tp/3B0bE0I7pWALaYODcnC7HZFM=;
        b=qlSG9bzH4NB8Fm81niINeg8CFgZXtHDkPHPOv9nyCkj6pTsPOPqNIXLgwd0+UWEQom
         2oY3CK1Iqv+WvgAw3rR0CjWRUIHh2i3Q0D+o92s3uDwIcBWGzv7zDN5g1g7iJGmkfVIq
         nIBqAAY8YBscEF0mkYoKGvJkGxagdiZRsCguZUGO2m287+uWUHnIUx9lbcDFRQcBqnUd
         jQAARwQgGf7zNWX+t6JY6SoVUiiKBdYHiOELnEbwUOPfJcR17usm3/89EaEMKD3Hz8c4
         G8eIqdHkffuZ/7HtQ+ei2L5yt0IaP6A1lxovQgBO7UQWiRLEE3irgTtWuEVF8jAoqLWA
         8MNg==
X-Gm-Message-State: AOJu0Yxj+K9eUp2pKExDVrXDNAIHbrjcgLYsjnr7pmvVcdw58HjKBZLe
	j5t0gIXz7Ugsbn4bq5934TKYw5eqbd5OqKhhiUO83aseZl1GLcbTsBRp
X-Gm-Gg: AR+sD11IknWA3Bdeh3TsNRzaQI+PXddlQpqoqDd1eE7S33xgQNAwbs0WyQtELFSU5Rj
	4y2LTNXCVSFwkQf2aieUzuX9tVGO5Xk+EKnQLEtB3vs8dMkWmt5LfZIjWj9PhqMWQbViq8p5aoM
	qJWyCbj6KLa6Z/lbPMYxEXosdkesLNR5uqr11MIlnW9BGj89hzgCsIMqmUGF3ewslKKkwv9XtD6
	85zZP5ahebJxvKRUCTAXNXJbynPYbQd0d6FqaK8i2CsX92u8i3taprKH9yG8mT0nil7GXoHsUxe
	S0kETdpXNnya2S9d4wzSuUKHCa5e47di3DNkRRBMnofy48V7zvz5nRWNBr//O0cZ0l3IR18HKaX
	+oR76QDpjnCCi9idrpxvc/+Ffqe5fNRpdWJi91txQxRnHo8EroPO2Fm/2ihpMOOE4nnjemUYnBw
	oWIvIbDRSvnjwSrmItV4nmNhSu4rQpqA==
X-Received: by 2002:a05:6214:301d:b0:8ef:a4d5:1523 with SMTP id 6a1803df08f44-907783b31d6mr217236786d6.42.1784657228144;
        Tue, 21 Jul 2026 11:07:08 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1145:4:3aa6:65e3:232d:4717? ([2620:10d:c091:500::571])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e1ad3sm1710816d6.29.2026.07.21.11.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:07:07 -0700 (PDT)
Message-ID: <7fd2e4f3-ccfe-4e09-8f24-8dcf89b4774d@gmail.com>
Date: Tue, 21 Jul 2026 14:07:06 -0400
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] nfc: digital: fix use-after-free in
 nfc_digital_unregister_device()
To: Weiming Shi <bestswngs@gmail.com>, David Heidelberg <david@ixit.cz>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiang Mei <xmei5@asu.edu>
References: <20260721163632.1570651-1-bestswngs@gmail.com>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <20260721163632.1570651-1-bestswngs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/21/26 12:36 PM, Weiming Shi wrote:
> nfc_digital_unregister_device() cancels cmd_work and cmd_complete_work
> once each and then frees the command queue.  The two works re-arm each
> other: digital_wq_cmd_complete() ends with schedule_work(&ddev->cmd_work),
> and digital_wq_cmd() hands a command to the driver whose asynchronous
> completion schedules cmd_complete_work.  cancel_work_sync() only waits for
> the instance it cancels; it does not stop the work from being queued again.
> A work re-armed after its cancel_work_sync() therefore runs concurrently
> with the cmd_queue cleanup and dereferences a digital_cmd the cleanup has
> already freed.  digital_wq_cmd() widens the window by dropping cmd_lock
> before using the command it took from the queue, while the cleanup loop
> frees the commands without holding cmd_lock.
> 
> It is reproducible with the software NFC simulator (CONFIG_NFC_SIM): start
> an NFC-DEP exchange between the two nfcsim devices and unload the module
> while it is running.
> 
>   BUG: KASAN: slab-use-after-free in digital_wq_cmd (net/nfc/digital_core.c:174)
>   Read of size 1 by task kworker/1:5
>   Workqueue: events digital_wq_cmd
>    digital_wq_cmd (net/nfc/digital_core.c:174)
>    process_one_work
>    worker_thread
>    kthread
> 
>   Allocated by task 5124:
>    digital_send_cmd (net/nfc/digital_core.c:234)
>    digital_in_send_sdd_req
>    digital_in_recv_sens_res
>    digital_wq_cmd_complete (net/nfc/digital_core.c:134)
> 
>   Freed by task 4994:
>    kfree
>    nfc_digital_unregister_device (net/nfc/digital_core.c:859)
>    nfcsim_device_free [nfcsim]
>    nfcsim_exit [nfcsim]
>    __do_sys_delete_module
> 
> Use disable_work_sync() instead of cancel_work_sync() for the two command
> works.  disable_work_sync() cancels the work and disables it, so any later
> schedule_work() -- whether from the sibling work re-arming it or from the
> driver's completion callback -- becomes a no-op.  Once both works are
> disabled no work can run, and the cleanup loop frees the queue with no work
> able to reach a freed command.
> 
> Fixes: 59ee2361c924 ("NFC Digital: Implement driver commands mechanism")

Fix for this commit should target the net tree instead of net-next.

> Reported-by: Xiang Mei <xmei5@asu.edu>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   net/nfc/digital_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
> index 7cb1e6aaae90..6def5132a4a6 100644
> --- a/net/nfc/digital_core.c
> +++ b/net/nfc/digital_core.c
> @@ -843,8 +843,8 @@ void nfc_digital_unregister_device(struct nfc_digital_dev *ddev)
>   	mutex_unlock(&ddev->poll_lock);
>   
>   	cancel_delayed_work_sync(&ddev->poll_work);
> -	cancel_work_sync(&ddev->cmd_work);
> -	cancel_work_sync(&ddev->cmd_complete_work);
> +	disable_work_sync(&ddev->cmd_work);
> +	disable_work_sync(&ddev->cmd_complete_work);
>   
>   	list_for_each_entry_safe(cmd, n, &ddev->cmd_queue, queue) {
>   		list_del(&cmd->queue);
> 
> base-commit: d4932951a19a5f1ec93200260b85e1a4c080ff77

