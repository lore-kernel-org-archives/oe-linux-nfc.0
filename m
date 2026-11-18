Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794990240;
	b=PgSomdZpzjDXYPz8jo5T7kdKk5sex8DdRoYbT/raXJLyb6ErHenWUtP0CNfICEbm7nRI
	 gKdR9jeZSNA5Oqn6PmhwAHJ7d/OaVsQLNYg+mHls1iIQsyoTsOsQxdDxUUVhFtQ8VeYk5
	 IpR6eJUk1KFxPobuEjY1J9aTiv4ViL2eMuOtEmAy5/jNBLrZtKV0IrNfxNu85LyzZh9hB
	 1rvdqd+uTSK/JwSriw78080dKaeA032JASGuroPjWl8oeIj5bmo1YTw02Gc3Q+AVclevQ
	 /vrMUqelyGmpoX3NxabIxaugmjNy9ZJXqxPu43BW4hXF2PG2CiYoh9tCGG09IqhrHQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
	b=GwWu9cx0sliziqLfOxu8sRinQqlbatvViMSlI5UQW8elAsBOWy1FmiNPv40BhOYyk/YI
	 vFsJlJvrqez6LlpRPb4vRhl1M5W7NqhzTjRA409ZkWrVOAvkPqa2wp/0UkYgH8QBdwriN
	 xnjnSMBI3c6jrTlLT+xyJux7cLBobSbOy9GSk/NUGNOY108rwcWukxe4gDEWBRRzjUqrD
	 5ZTlQuruB0fhtehzF9avqVCMJQlih6cQOVU7DT6fxAcHhACli+NawlrlFAXIzcSKZATKl
	 S+Khgc375JV4upa9OUbEfe/BwkLKn08EfEu4wq1PVLacKtXDaQvLx0aFj17tZavADHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1NsAkwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20675606A331
	for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 08:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20675606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1NsAkwT
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso6768261fa.3
        for <oe-linux-nfc@lists.linux.dev>; Wed, 18 Nov 2026 00:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794990238; cv=none;
        d=google.com; s=arc-20260327;
        b=nSRzQxqpYAhq75vGYJK6fPzi0PGmvX6UE7H9VYdmrjKAGqpeSVVkjGg3c6kme4zCmw
         NrUhtG3eTswTUlVOSQiPltvKkwXsLx34mUT4o6GN/IUJqRjFoBLenSEhddDmTXjO7vLf
         ZB6DM5YVRhXqzSixekv6eki13tTuE3ucmY4MOubTQe7l30TJ/DLiQBl+7KyNHnhGXP+l
         hQZaSQyoJ2zOGvq61qi7WUw/a5B2X8AgZ90RyXpjASUWObVP0xYssIGEFOeE80s37nAM
         rpM4rPah6U4HSOtPpq2zzg5oTL/1G0kjWZkf8WqXg6IYSfGMYuZoiGIFJtv5q/YzP0IP
         o+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
        fh=GcvTHtL77Oklb7ReZs1yGkgb34v09UkaOeSU6c2GvzA=;
        b=lyaiFSTbKlPwNSl5+MuNNJdEsNRrSLrOipfroesQmAwVpsoXEyJZlw3eoOv4TNncP3
         bNYWlfdR84q7/fhls3eosB960URb2Cv9yOiHHPqcLQnhuW/eTFjNRBCmOIIBGbGkaT+g
         6q29eD5pQpokY9tkpZnTdMEXgaxKmHhGxQG+n3jFqyS6fVOfenLRJkVXRGyvuC4nAQ8p
         yX4YkR3MJvF3bLgEYhEJESSjpFLmRs1OvoWJkTOonr1qH0j77Ni7uvuKvwbugR7mX/TG
         /9zQDHheLdG7ytuh/C3+7CUyzWh6Yr2kleuH60berUD+L1v/NGSBUXKpWws0I6egqsXq
         Xgfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794990238; x=1795595038; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
        b=m1NsAkwTYjxJKXnVAiLEIus/LgQzQ1lda2W/bqN6CVNd8n1YGuCVvsUrJQGv1M1ovv
         ygDhoCgszoIfQaYxmD6m/ovk717WJ5+JHl9H+tBnIR3+uzr6QMebx4mrp4+V65A/HAwf
         qKMa+J8pPabQEv+vS4nLW0Fm6WH4XfHxbfWGNO4iv+MM4cwtKGqN2By7f44PpGzR8pNL
         vIvqIwjDAKYDPNqmah9Yexu3p2G7UFGVswuvlsQTn7R2VVXNfgLcRMg5GpciQIBzI4pO
         K3lN7GMQmFC8Zz61d8q3cBwoRYCe3Tb1eba4FL1SMiFrdc4/13KC0yyRatbk20J2KajM
         37rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990238; x=1795595038;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/6/kh5W30HhpdBPfGGAYex3HyQBO9GYAQyqbkb72JOY=;
        b=QpDWB8N6WY13z+AY29lNqy+zefcD8UXVAdaqCvmxSHCVSHIpLI7zOCptJlB+jsEfH1
         xDzhleb1+CZuTbhZ7z3sZ8dBVHqcgPzM9a5Ey4DbDucfRhiE2hxuTTNiu+Vv/FLn4NnF
         wh2HVhwQQrwijHebdqCmxJII6UfEhmftoiGuHIzjmznrzi11e2FoolKtd/t+atXQIOpi
         5Utoe+jMR2EYiEDNQdTTQjkwa/scDUWon3ITmr5Ij8muf3LGuAekIWOAfmLIpZep0QQy
         5Sz+n5aRPVwO1Oh/L3OmBuHVs0jsXuAOQBO6u5B5VvWzBcca24iVIU0dZ5tAl+6Hj5Vw
         NkiA==
X-Gm-Message-State: APuU4Z8kltjvKhWbL7Q6PTupHPEH9DLDIXa+nUg1hIoEhq9Z9n+prAtM
	wJFRc05Dzn3CxA9q1eWJk3/ulYLN0sp/+iGqj+vpX8JRKAc+d3Jd2+g5dpS8BPPvMibWrfBncKP
	lwXybkXjlVFXa8rAQJbRI6dDVeJ/nFfk=
X-Gm-Gg: AYBFou0bxZl7k8Cg3Sw1ljQI4WhVfisiozQ+4XTEYPNwwWbImNKEHVSkp+jcWl8tGDm
	eDdacr07Xa/fg6M1KEuyVYr9uelvslJvqjtz8zUAVwmVPRFab9+PNtlCDC1FCL+7r+ZiKnqCoL4
	moJqAaNpb/YddYppzYHMAZUBxyXSxIBwoGF/d1YXknXCVmVnU3nMo238KGxx7/6dSga6vnW14VU
	w7wus9qiq2iOeCP4tJgjFn7Yz9natEa+jnLjRQ9gQjtTnbNvrpKM363hTtjL29Wta+34TgvDn21
	OU6e/m/jRAO9k/Zp9SH6uYqSpT7VE0rhi788Rbb7iAIwcWnUgUfrInpatFaFrZd4kxqxFCQFFg3
	35GOmQT+hvdNI3qPulIP2f2QKwN5rcZMieXvTB3ATv6RTrw0Jw4EbtgYIMo6725sw1wLRlB4QOK
	cncdnh0fGf7lFc2oereashNvM1N01MiuKdqSdRPIC3/qd0JpLOOw1v+yTx3hDuqA==
X-Received: by 2002:a05:651c:a165:b0:3ac:d178:4fab with SMTP id
 38308e7fff4ca-3ae670bf950mr5692991fa.15.1794990237903; Wed, 18 Nov 2026
 00:23:57 -0800 (PST)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118081530.32-1-luob87709@gmail.com> <179498993525.3291.5601341761915431183@kernel.org>
In-Reply-To: <179498993525.3291.5601341761915431183@kernel.org>
From: bin luo <luob87709@gmail.com>
Date: Wed, 18 Nov 2026 16:23:45 +0800
X-Gm-Features: AclHuK8tzrXAnBEEnV7izSR1ok85RQGJJb1sS75npmL1o0nlxOXbqqrnO8hfmRg
Message-ID: <CALa7h7Ges-aY7SrJcODTESgq8q04Ak5a_3ksT1FTjQe8RYzwWg@mail.gmail.com>
Subject: Re: [PATCH v2] net/nfc: fix skb ownership on data exchange errors
To: netdev-bot+sinfo@kernel.org
Cc: oe-linux-nfc@lists.linux.dev, johan@kernel.org, david+nfc@ixit.cz, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

The issue was first identified through manual code inspection during
our NFC callback-ownership audit. I traced the NCI data-exchange
completion path into rawsock and found that a non-NULL skb could
bypass cleanup on the error path. I then reproduced the behavior with
a QEMU NFC_VIRTUAL_NCI test.

Best regards,
Bin Luo
