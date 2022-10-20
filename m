Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700735C96
	for <oe-linux-nfc@lists.linux.dev>; Thu, 20 Oct 2022 17:09:55 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a10so35688616wrm.12
        for <oe-linux-nfc@lists.linux.dev>; Thu, 20 Oct 2022 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tkjLCXexkro7kac+wveMy9C3DAW0jXLRseqX2PXLAEM=;
        b=TzGh+QrODF3r+MIE4I+YoBBCLiaErXByAQlSJTAgnLPet9vl+lKkG0zAq6WQPzNdhC
         YRAyQOzoGJE6c8YIPvyygU6MM3npkTIFWOQPb7P6czJ4pt02rtsVwNMJU2k/w+M57dEf
         18e/l3EWwtIW6qjYA5xJBlG5Jecj6Tl48uOXAUP4ozANSHI8luSNXxSXf1j6cFnDCAY/
         OEza7ve3SqXfTrEqv3p9cws9uEMRBSbTI87BjPMcJ82QkR4e5EfdtW/DFm8BAjKVifU7
         4i+OP77zfQITFYu6AsoBCa8Lang9YiQjGWb2ivNEA6CZ9RwreIoGwPJjPCC1EUmdJVuI
         +s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkjLCXexkro7kac+wveMy9C3DAW0jXLRseqX2PXLAEM=;
        b=dz8G3HJGjwLcjmQbrnXOvyPw+A21Oyy6JpoO8hR4CjDy8zErenX1XHRziik+OoAoTb
         0KkWXOnvbJlNNFFh8f3LowCNsdzq49lPiCxnubQVVXNilZVzthow15R6ML0lXkoupfre
         8WGXJ9WOginxrd+Gx5qReiVOZ0QFfskiA4qSUeOUr+YVHNQUaz4XDK7Zt75vYjCRdj7a
         U37VQJm2RHc/Url3Rk8gFymgw9tK62vkhr2Ag1ahPM6Dn6qi5ShPIT2vxrOW5qoJbnm3
         afEqQJV5phgRgQ7Lzuowny7n0qJnANvvznRSr7+GJy+XgeMngk9TY0pa5na6K5uv/A/2
         08Lw==
X-Gm-Message-State: ACrzQf2JuRBzHgUdWGzz1rZRBJGpFSK6W1R7IzuvTZjgw5Sq8hnYMz7j
	0uh3S0e3UpBgGjcysu72AHv/5Ybxmm4yBx4CHCXlWfVPDmVbGQ==
X-Google-Smtp-Source: AMsMyM4NLVXBiwctyt6UaFyBbFbg4doi5nvvB79pNqp6n4XS9wxhXgJDh8wMDcJClD7JQR7XMD4PfgmTwZEFGa03S+E=
X-Received: by 2002:a5d:63d1:0:b0:235:9aeb:e365 with SMTP id
 c17-20020a5d63d1000000b002359aebe365mr3422672wrw.77.1666285793509; Thu, 20
 Oct 2022 10:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Thu, 20 Oct 2022 22:39:42 +0530
Message-ID: <CAH=dH9_=ix4F8v9NUekggnAtY9yXf-4J-eY6HvwQ5K+KoO+EqQ@mail.gmail.com>
Subject: Test Mail
To: oe-linux-nfc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello

Test Mail

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
