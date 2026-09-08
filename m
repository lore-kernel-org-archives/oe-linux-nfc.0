Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1354A3412
	for <oe-linux-nfc@lists.linux.dev>; Tue,  8 Sep 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896955; cv=none; b=RrhQb+Cr7OpZMCTNvslPAZ6KWWgXd6CV7cWDCghlXfriAA11x6c8IZf5qN5mQaYC+FNcu1l3rm+TnI1JZUHoYlMc353UCMSougDAdG/c7NuGxwMTTHpFIRqc2e7cjUfXnlFaK+v1P3kTldq6cj7zwdqCsbA8Gau9Vo7/1ZJ3e78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896955; c=relaxed/simple;
	bh=nPSLAw4dDFRQB8/GppYQJplsDn5fKUicYHTIt8XvrIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ioJUrGsTy+GXxNRbZxmTDOUyMsi8VwUwAQ10GIixpz6thj4QEA7gEg9P3ddRB1JckyI38Ey1WeSKE+M2h/u6wy4JdLYjMvIzfjUwSKYjn5M5QBWMin8RC+ltOZTfzy+jqzoamLKx4adgxm/maclF3sio6EwfTcZ1x49p6B6p9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G614LP+z; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G614LP+z"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db858d60e0so8785595ad.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 08 Sep 2026 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896951; x=1789501751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nPSLAw4dDFRQB8/GppYQJplsDn5fKUicYHTIt8XvrIg=;
        b=G614LP+zcP6QIjm2L1YiVBX/rt5jBeBHvWAqNvKBVR3+08tT5GDWLoIJz/7NsvCMpe
         h00zBDbHmgmj0raTfpniW3BkJp9DxBXMnskvGPJvqFTamiLBEWtPXBg16shT3bXuvK/l
         joRex1hSgSwyDBsM95yPuhZSaCrEyrHdchyHg9w4jOqOCykOva07/2s9d5ueX91wdKH0
         Xw8Gztt780rXbthrLXobQXR0TldhH5yYDblj9wD6YI/ZIjmJYhWt+z2ovmTueo+vrlMD
         R6wi9UXGyDiVl4VnL6o1vhG1muugdxxAIloQliwnW2sXl3XhkmGZG9UYTky+DhakEPTw
         Fl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896951; x=1789501751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nPSLAw4dDFRQB8/GppYQJplsDn5fKUicYHTIt8XvrIg=;
        b=JRkXKEH9oYVuWukvJTFD87uVQgFj0a594NfBp4XW3PGnSafyMULXxBnI8q+jdZxdNS
         y6iFQlc2ORZ2duC8IGXphKQyX/qK5zOyHZuPweX+qlAGglQ5fnVZ0+prsUTW+DUujP/O
         U03ae0bdsIoi4WPaObVK/dayOVXGPJ+wHVRLWtFv0AXBUWJi0/4nJ1vd/LRD7cSbPfyz
         W/uRSNvfCYVlZxqdYI6JMsmNS0z4PE5auQeplwTXluhge0nEEAsjkFL8rLLEXxWvKPET
         JlTaoA4AXUaMiWj1X74bJ9YgB1z73ewr7oqvkqylhf8bDuEm+A8CEv0wpW+sDllU7ZRF
         YItg==
X-Forwarded-Encrypted: i=1; AKwUvBy32phn9Ua6EZUE67Bbs/S6TIQb3D4SIVeFCrfH6mS1FPyUO30q3gmcuLbrVcV0u2V+Klwrt9thkdS7n/g=@lists.linux.dev
X-Gm-Message-State: AFuF++mtdBgqhY+3PZTsZu4XziVYI0LNYI/Jx2XZO87tQArLUBg35oOJ
	Xauo1YXF/DGrF18BoDnPiSYWyME0e7LQbhcPc1UXQEECbubVmkK7Rjlh
X-Gm-Gg: AYBFou1t9foEFA5f0kJh4d8BXyU3nvxuICgJ9AQNqbaBD/Sm4u9JMzq088TgBmO6PWv
	jhYeYROg1RIGyve3w5wev5uFcta1rz4e7A1QnWi9+5fFVNZjVI2JJjF/bbkBsgOcMTEIPXNlBLC
	mjkHodZ0j50IUcXHisR44CXj0mqpIozp3/CrQoZ+wnrm1HLFVjduXbE9gcxL2XvZQMfQZBL/FTX
	sfrfoGTX1/23CqAqY7kalXSC+GupKlGOnybwoUSbyEymeJT2tbCMiY2JymkbYVT/Og3ac+8xGoI
	iNhc4SrUCo2WMT4Eq/bYsZJzVTwLU93ia9c1qeTKpWCTrBot2lrEIQ9KcV8SFt9zuIlBof5qQAv
	FFwBErS5a3Lu2XfxspVJOBDXfoZ+O1xogaPW8zetHP8Ad5fT5ydTOvn1OOGy9Z/0B2xliZFPnQP
	C7fLR/bNhBeVgsNlkUBqJ9kmc1gHx5l+eP68tsGrIGmblFFQkllQBTAz+F1gDQ7fZCUw==
X-Received: by 2002:a17:90b:4fc5:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-39b26190c25mr45385141a91.6.1788896950843;
        Tue, 08 Sep 2026 12:49:10 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:4b36:fe93:5f92:db19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm35534183a91.16.2026.09.08.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:49:10 -0700 (PDT)
Date: Wed, 9 Sep 2026 01:18:48 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: david@ixit.cz
Cc: linux-kernel@vger.kernel.org, johan@kernel.org, xujialu@vimux.org,
	bartosz.golaszewski@oss.qualcomm.com, kuba@kernel.org,
	u.kleine-koenig@baylibre.com, skhan@linuxfoundation.org,
	syzkaller-bugs@googlegroups.com, bzhao@marvell.com,
	oe-linux-nfc@lists.linux.dev,
	syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com
Subject: Re: [PATCH] nfc: nfcmrvl: fix memory leak in nfcmrvl_usb_nci_send()
Message-ID: <aqBmoOA5A5lvWfps@user>
References: <20260830181136.165395-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830181136.165395-1-pavankumaryalagada@gmail.com>

Hi David,

Could you please review this patch when you get a chance?

Thanks,
Pavan
