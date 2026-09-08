Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE534CA793
	for <oe-linux-nfc@lists.linux.dev>; Tue,  8 Sep 2026 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867047; cv=none; b=G+1da0BlvFHN5g0kp4FHLKaG6+xk5K7I4jAuA3MPaKWdvcIwDW47TEEM8tpqhXetsHgTZLatMkiTIP0HooiRhrqAtnj4wXX+ZPhQbjM+aYyOSiYdEfMf9XqkVmOdz+Mv70vB2rQaqS2J5HwPWb895vEYj9fMCIt8fstDYmX0heg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867047; c=relaxed/simple;
	bh=31c0r96KNwxH60URkYG/Dq8KPtohqhJi7zlAxQBZBzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQB3/BHDATxzPI/AsOVhIULYMKO8EtVn8ukn9kmmk2oWfV7HHKjIZ53HtS7M3AKNR22SxkOWTu6faOB82EYVJHSgAmLrHv/KTOHUI38Hj6EyG8/1zul6Ia6Df4F9IrbUWxlnsOHhE7ko5URjO2eAdimw1H3rqtNsX58v4EL9Z4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmY2d6yC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmY2d6yC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso56802905e9.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 08 Sep 2026 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788867036; x=1789471836; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0b12Cm5Gb+b1IM+WblZsuohOBmH8KyzuDASigLWND6Y=;
        b=BmY2d6yCqr1rBQ/l5COJDJ2qEpNgqzjobv9o+bJzy0Ht/gtgMKhAedYw9XI7X6wU4C
         DoQkulgE5aH5u2Ewfp/76yHuyNhBlgoqsIFlExE9n5AGcVm9grpSOHMomAHWyLKbMrt+
         f/D/sQAORjZLeFhdFxp8nv+iBANKzNLzvWCzY/EX0CrMFgpbpMmnmVYGRxP+UuOGOSO8
         i+cU4I4LaM/nXWn06xzyz4va5GkQtmPTfVT9aMIZ9xhhKKqrz0OLjZ9vikqNXEWd7hcL
         MLq1DZ7CSdXn/taot+2RgIRyye1pUlwHCO5mUW+werfilOKsDc0gfTiyuyEK6CY0m+yE
         38LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867036; x=1789471836;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0b12Cm5Gb+b1IM+WblZsuohOBmH8KyzuDASigLWND6Y=;
        b=GwHToPkuWWP/AqoxGfOwq86Oed2F4cbLHef9H/nSuQNd20C6m+0COV6pZHFuKyExcP
         GqC5SccKzB0Jxmc9W04NDcsSkSBzgs7NLu9wwC84mS9Sfmw3iC8xKisRWEEgR/4rSkXY
         xFX23VBJAhxJIzS75LY+BDJR3TO94P0JtNkS8S4/rvlOLnl6iS5miXaxh/gGzbdcmSu2
         7YT2igH5C33IEEI9Or2UJDqL69lFN/hMOo+lmdS6tDHSIivrbz74kFB7beI9bKu7H8NA
         +6ILJvUjNvRqkyhhMEYEASmOJbn9j6ecstt4I3PFJMifDUKDfrHjn3lFN6NV1vhJ20Lb
         13mQ==
X-Gm-Message-State: AFuF++mOi0bbBHe3EoXHgJi80Ae/nCbWfGaGLQ+BGu2/3nubIh/R+gNG
	nfoc+EF3V4MpWdbluVuXKuaOFdY/LSuW0kPqJWuF15oSxfHgvMIEkmj1
X-Gm-Gg: AYBFou0zzXr/Vf8zUCtOagNWpQUSxF6cc3YXrkYP0DwkQA6fFth8xZwPfJC+0h1TtCq
	Tkagnjg7QFqrbcEmxBAKazdWNtOfUMpEu7zSE6DQ2pNUQtV1k1vp9vRG//K/4SUC6sXlzEO4JxB
	cSDoJ8ySdQKm5EArSrg4nEhh/oxCTemd8S1eygn07Fxp5HjRnCUiHnfSmITs2sPCplBiKMhFSGf
	ev8aPerByhjhjszS0vA22PmCDihHhbcsOZTti9kP0OvJN0rZa3kpPpV8FxRPUIQJLfklb40s2O2
	zVpVwNZxxEpZ7wMGhQ+3HHYKPoLlx2KU/YcdVp/Ujr9O4ANiuRBH/uEXADIYA2J1QJnCdXyE6YJ
	Bb0PjMuQfurwMFlcLmuxDxi5dGd7kYOEv0U9So83q8eMyPbxr2iJWu/X4gNAYERSxVAYiu1/I8i
	QbsBjnvLv0rVSTsoS9e2bWZbsTVVChtgRxNuAjIH48NB6Qe143XoxFfnTGmzKAWhTgtItKCtr0U
	GBF5jETk399I7/zCbl8ygnT9+EveDuaemfgnLZO+xAj3bh+wJrPBac4/ansKPPJW0EI911AiglJ
	WFOR85f1MisaDQ2QHNPiQCnx/gLKBGMWEKCzWq+NimcIfX0A/M1zZeh0Gr29M+IRaMi88lGgros
	THCmwrVQz5HJaAuuYANQmryvcAiJKJRTYVAPic/F5khIhFVostORaWKtls5uUwvf7v/gWDQ==
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr314405825e9.3.1788867036409;
        Tue, 08 Sep 2026 04:30:36 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm331050675e9.0.2026.09.08.04.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:30:36 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:30:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org,
 syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Subject: Re: [PATCH] nfc: nfcmrvl: fix null pointer dereference in
 nfcmrvl_bulk_complete
Message-ID: <20260908133033.000037c5@gmail.com>
In-Reply-To: <20260831104110.1307-1-joshua.crofts1@gmail.com>
References: <20260831104110.1307-1-joshua.crofts1@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 10:41:10 +0000
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> A race condition in the current implementation can cause a null pointer
> dereference. When nfcmrvl_nci_register_dev() calls nci_register_device(),
> the NCI device is immediately exposed to userspace. If userspace brings
> up the device before probe() finishes assigning drv_data->priv,
> submitted bulk URBs can complete while priv is still NULL.
> 
> Additionally, nfcmrvl_bulk_complete() incorrectly checked
> NFCMRVL_NCI_RUNNING on drv_data->flags instead of drv_data->priv->flags.
> 
> Fix this by adding a NULL check and testing NFCMRVL_NCI_RUNNING on
> drv_data->priv->flags before processing the completed URB.
> 
> Fixes: f26e30cc6b50 ("NFC: nfcmrvl: Initial commit for Marvell NFC driver")
> Reported-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=59d5e6a8ed04e6a000c8
> Tested-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/nfc/nfcmrvl/usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
> index c7f2afe00b93..c22d783718fe 100644
> --- a/drivers/nfc/nfcmrvl/usb.c
> +++ b/drivers/nfc/nfcmrvl/usb.c
> @@ -61,7 +61,7 @@ static void nfcmrvl_bulk_complete(struct urb *urb)
>  	dev_dbg(&drv_data->udev->dev, "urb %p status %d count %d\n",
>  		urb, urb->status, urb->actual_length);
>  
> -	if (!test_bit(NFCMRVL_NCI_RUNNING, &drv_data->flags))
> +	if (!drv_data->priv || !test_bit(NFCMRVL_NCI_RUNNING, &drv_data->priv->flags))
>  		return;
>  
>  	if (!urb->status) {

Hi David,

gentle ping on this patch.

-- 
Kind regards,
Joshua Crofts
