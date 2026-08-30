Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E6F3BB674
	for <oe-linux-nfc@lists.linux.dev>; Sun, 30 Aug 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788107091; cv=none; b=rpnImYoWADEN7a8rB9uIzUB+Y5n1fjke1jVNFvpp3A9l63t5pozu+TCMFcxF+N/pBUzXf3qLuVuVEmsusTKr2h8omQ4cNiad7TLTqCyo7CZqhGJ+h5NVsQ3GMLxEHN/nDVW5PTEPk7nYOtBKofDPTpL1oUz2AMT8bnS0LDLA2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788107091; c=relaxed/simple;
	bh=wd4/Np9BcKgCQVe8dzA/j4ReDI2xnURtUc5ruSckYZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rr4kqlASzlnRrliLIgBBB7Bop1bMVmMOjV6w2w3d7fIvw50kqrPzT4vEPNg7MT/pjqIfM6ItrNZUJ2ZyTCkb+TAktfhOCn0REkzbwffKSr9+4O0Bx8BMJgFRMD31Pa7lCYB4C+l5obJF1kieWJ3ib+W2gG4XoPaR3eWnpc9l6Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHMN/H2R; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHMN/H2R"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398ba166ce3so755683a91.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 30 Aug 2026 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788107088; x=1788711888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uoOcHIFQQdBWhdhIIcmPfZrkUN2MX77IqhljKCPDFs=;
        b=mHMN/H2RFVZGWzqQRu5o9hnaF3dhXlcIPsd4x7NiQ/+EvTXvJ/AkvHnJRlDbjUI6r+
         ZBzs/6dUBZQd3d1WEs6rU/VP+RojYDRtwt+nIG8l25eBobXjZeBt2rQdjvgNASgdi/v6
         wogf/odBauhitrUa1Mb6NNDarAPws/T88iGhIIiGEfrfO7AP23m4mhh2uwPeb4duKIsE
         SZgnOzlBcQkG/iBD6MlqtZuh3FX/ctpmKGaFn6bFxOqyyYAkywW+LBgNPqTM0hKhkgEK
         Mhel0/Dw9B4puJvV0aCEu7wbzNJloZwn8fEA44cvYNFVmcaCxn7uXB0ftC6DA9J2PHAQ
         VmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788107088; x=1788711888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uoOcHIFQQdBWhdhIIcmPfZrkUN2MX77IqhljKCPDFs=;
        b=iHHNxXPvq7e2Aj73m7AmtKuHM0uSKjYnYpSMASM8ZacSxsM8kWV/NXHGdjh+IbdPec
         G6pz+h/g/CZbZQsL2CkljdF6OqMoSXAiEXGe9mYncuBgT/1sQiRo1JAcDrR9sdbXw/mK
         oMAzZ52ldjT08RQsuTW4zcagOoGS2RokIP+SkHAQIVl1PU9WmktUT1ahrcLTUiq0OXam
         waRffIHAMU0DxIAHxOomYkJb1n3463Y6FBCZJVYbv6YUVB/ZKzy7ypLr08bsPizBKGF3
         T5iwq+D5QmDMQmM35F0GYaOuzwX60KQGkCy5sp9rCQrF6AFz2WEPhX1R/DiutvArPgAb
         6CBA==
X-Forwarded-Encrypted: i=1; AKwUvBzflDJ5GvuosKCTxlDgUlc2aoqurFW4RZe9owuPbLAaqGQA0SSqShdSk4eMBZVOAevxxGQkYRUI0amJZ2A=@lists.linux.dev
X-Gm-Message-State: AFuF++lYUb/fi4wtxM1qPUaGL690n/q7GXgvjuT1zl3eCGj+ZF8cGVLB
	UMV9t9eP/qUxxsSW8w9wcEyi23YGcRqwSMqmGY+Pd/yCacec1ObLRDSG50MquC63
X-Gm-Gg: AYBFou3rVzwg5rxbitmiD7tQ5AK7NNbiLkuKUyf4WKzc50oC6obVul0MMG8CaAhT5/n
	9VgqQj+SPe+oh0YVoE/Ug2LJZ+5l6HYBrO0KGiPCFEFA9dxlgn1kpxKR0xl3lSEcAlBvK4h03LD
	VoDwHuIAZcBlQr+pfdVi+BKb0KrSjPSvAVwuRluNKym0CUGLGSMdo82AsHVOrUPGLOrprwivkyu
	SOGE76bko8Oz365jC8w9K/3HcTPh2yv1DnXAfdpjWuqIZpSbYJXQ5ZXTrZH3iqNG+1VygTCowu1
	Ic0H8uvxdQMSMgXZhgX4nzk6GUkVV09vPG3FYH/N/1qk5LGcfu88VtvpOX9juw63hodGBKxgUQI
	Co4IBQ/2OlC3J9j5Ga3kX8doI2pumfSx0rMg0a7eSMPqSMLnCL9z6FpSmjVAQjypC7kcqMs37pH
	7C/bqnFpP/dKinW9DmH6H8BfwQfXHs/SDuPSIpusdBzeAIPxlEjX2+19GLYO1GX9V1pw==
X-Received: by 2002:a17:90a:38a3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-398d6e8ffbamr3534533a91.9.1788107088286;
        Sun, 30 Aug 2026 09:24:48 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:fcb:65b0:addd:e3f8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e907fsm21087126eec.25.2026.08.30.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:24:47 -0700 (PDT)
Date: Sun, 30 Aug 2026 21:54:19 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: syzbot <syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, david@ixit.cz, edumazet@google.com,
	horms@kernel.org, krzk@kernel.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [nfc?] [net?] memory leak in nci_send_cmd
Message-ID: <apRZM5ZkGw7KQq4-@user>
References: <6a942714.4d659fcc.734b4.003a.GAE@google.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a942714.4d659fcc.734b4.003a.GAE@google.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 73ae59e975966d24e32926247ddb45a537ebe184

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c7f2afe00b93..7a4094797ba4 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -224,12 +224,16 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
        unsigned int pipe;
        int err;
 
-       if (!drv_data->bulk_tx_ep)
+       if (!drv_data->bulk_tx_ep) {
+               kfree_skb(skb);
                return -ENODEV;
+       }
 
        urb = usb_alloc_urb(0, GFP_ATOMIC);
-       if (!urb)
+       if (!urb) {
+               kfree_skb(skb);
                return -ENOMEM;
+       }
 
        pipe = usb_sndbulkpipe(drv_data->udev,
                                drv_data->bulk_tx_ep->bEndpointAddress);
@@ -254,6 +258,7 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
                                "urb %p submission failed (%d)\n", urb, -err);
                kfree(urb->setup_packet);
                usb_unanchor_urb(urb);
+               kfree_skb(skb);
        } else {
                usb_mark_last_busy(drv_data->udev);
        }

