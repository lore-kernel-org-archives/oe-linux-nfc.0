Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7214718CD
	for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808331; cv=none; b=j7BqsLkm2PrDKTBZ/Ca+Yw15Qez06OprHPMDK0zDn1tpjciJUuo8Bdn2+UmnOXvHsVF/Tslk7MJqqP381+JQwlJ5xFru366ckaFTnSwM6+r6GPwmcowJy90vh/1jOH/J9yZdAE0ZaKgWPQad4rQ9siExU1QCLa4BvexF5vyqBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808331; c=relaxed/simple;
	bh=XHYH9goJLfB4hT72FSpUpw7jM4IyFmcp0Zh+k55Cx84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iu40rXdDcDqqbCZl87yAndLZu8Txdd+CHgyqos2ckLb2eG97JtgFefs5mf2mFpErwaqbFxVSSOB48Qrb9UeJ9qWOlpPGOdLvFPSUPTRFP7z4y+LRYVmrpHZorYQXkf52y4DNHPVkaT+nrTQwAw86ZE/nm0t5uTbIszTfz4UMMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFwTXKgm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFwTXKgm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso44963485e9.2
        for <oe-linux-nfc@lists.linux.dev>; Wed, 30 Sep 2026 15:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790808328; x=1791413128; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw5hqKS3ct7o0O9F9EDtZ/MEdTAhkcvo8rO194jpxu0=;
        b=ZFwTXKgmeMBnNYMcUKLiYKN8nGB3JNgJuDcz+UNTihTu2YGN51jYcjuQt1DAo8Y9dh
         xFNZirJyYtJkNyOY4wcVh/YGn9lZBt7YrOH8MODi525JoqRpnlcpxUyVySz0bgCPvsaG
         axNWrvE5lGXL6SFOMeh29j6KviyCBLrK+imqUPjRmTVCD3cFlw/wVJjN3FJNq4goWJht
         GJPqzk21Rv/CE6Gji6NJfLoRRKDB/CNOdnMqTVsv5JWOCNuGJKEydMNDfJqdy722Sb7f
         093TGpTYsnoFYnIPqBNxL2Th0nVBjqLr9gLQVhKS4Dcu1xyu4ChKc2DCD3cHkvIPH9iS
         KTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808328; x=1791413128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mw5hqKS3ct7o0O9F9EDtZ/MEdTAhkcvo8rO194jpxu0=;
        b=O4yX4FuSLHcBRe4PdT45zpzHgm1MHlO1kGJoJ14VQheDq0cSo6f3cH9dEmafK0WH9K
         oBJ789sJyzvlKXEJ7ROWNke6dWyV8mGy4dUEM9LHwcdJciQH9ofhQhX6iG3LtVrI1p+A
         ALH0LWjaa5FG7ExfyDxUpe6M8UfjpSf7XnZGgjnRqr+JFFQjcZ6W0ywsqoY74cZ2aAtC
         06950DxYjhjx4Opvu/trVDhUfUVxY/O9XbMvfy3XEXUXZh3tYecOyJTERe+oMf9QEhVw
         DwWd9fT1C9v3f0UwYHtGccjxnw1tNbdNI06OZqe2ZbOIN3Bu1QjKMT6ZKAHZt53QZ6pI
         rPsQ==
X-Gm-Message-State: AFuF++naFaaPNdEA6TaWV0m2q2cu6j0LN0oSznRG3XhVrWU02jCYbf+W
	iZdlO00ZRXoxbbz5oJQs8f3449IseGx74u6NAdNk4kQVGWM8BgKGiLXT
X-Gm-Gg: AYBFou3OQdfYjmJp6XkXrYfjVEFnPyKDCrMfr0wO/cCnS8Tc9ORmB9wrpbgCtS4MWUU
	JhSHZb3B+1XJ5f0ZFrP2j99n20CVTIEIsuJ8mka7MqI2ejw4N5mwcgKwIyDzbLx6FSHuIfPRB6I
	kNgCvXcCvPhz/n5SwVhuD8KfFVsKP8h1/o2ehheGgfXJCVHeEzkESQYH56lpXRhB6qPEmbeGgK+
	iZpFEZ/l3cWN836DJ5AdVCGdl1pOfcWnLuhSbqiOx+zJjsB/VJp/1ir/AkBe5PIY7ZIEiznjF1C
	gxpn2PzUEnSkfV86aGDEnAjd13a30NLQW9WIEVFCUmj3MkLdPqEBa6/FzkVm6BHrgLF+1yzoNPQ
	X/eSJaZ+NUxoWD3XuPAyJDTlFjK+dt2qNsz84Z41Xz/ob/HFka5vpUvLvJrh5WdYNT+p23CM0II
	AlSsUD+vzfgTLBkJy3djBVVBqg/VGI4KItgn1eQXx3AxvE9HSsxMbcYk+jto2xpDAVkYjIOmoPL
	i4wZgb2
X-Received: by 2002:a05:600c:a43:b0:4a0:561:d0fa with SMTP id 5b1f17b1804b1-4a01b00c51amr47011655e9.18.1790808327880;
        Wed, 30 Sep 2026 15:45:27 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0692ae3fsm1982106f8f.26.2026.09.30.15.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 15:45:26 -0700 (PDT)
Message-ID: <970dac30-6739-44f2-81c6-e79813295f23@gmail.com>
Date: Thu, 1 Oct 2026 01:45:25 +0300
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] nfc: digital: fix read of resp->data[0] before length
 check in sens_req
To: netdev-bot+sinfo@kernel.org
Cc: oe-linux-nfc@lists.linux.dev, david@ixit.cz, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930220857.721985-1-omermetekaya0@gmail.com>
 <179080647916.31693.5412797645123910488@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <179080647916.31693.5412797645123910488@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/26 01:14, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Manual code inspection.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
It was obvious, I didnt triggered.
