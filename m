Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1DA423783
	for <oe-linux-nfc@lists.linux.dev>; Mon, 20 Jul 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553700; cv=none; b=lYafu/pBPWEW2x9cRe2CZg++qkLSqJ3n8vH6VOOdLGtBEMfnuhby0nvZY5Z7tvYaIkX6c+DZuWSDTFi1T3sj+UQpQotmmE2c33OLZW61x/pFHaj8xXuPJ4xe1digNnoNUuOCVZ30veGblvfCw9F6c3sPXXr7GLTuxsIspjNeK+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553700; c=relaxed/simple;
	bh=q/i+h1xLBAMF009p2KMCeNBKzps8J4NXn33rD07ylA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usaahENV8W9oXqz4IphSh+AITqjCjQPIzavJuLLRO8Y2/Ifb+iaJ6QPaF1NT4pFe01B1enza4GmeHj5vXZm4njFKEoXgwK5QLyafP+QEla/AlXlKhHJCXV37APtGg5+0jweH/5kQceu3lRSU6PlwINfGw/lnJJAdV2/F0BjT0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=MTNElB+2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="MTNElB+2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495590dde14so14687995e9.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 20 Jul 2026 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784553697; x=1785158497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/i+h1xLBAMF009p2KMCeNBKzps8J4NXn33rD07ylA0=;
        b=MTNElB+2+6lVH8V5V5xQZwuDfb1/mMkKS7nDlzTQXlqpuUwT3VfKhRUL8DMXE83ttL
         1yRffBNBScd5HrICt0l24C4FmXJpWXLVsjlHIg6vLS8HHGZTNszw8iazTb1or3jYQ6H3
         sGRL43a0YZodNye1e1WF3cNvaHkuPHCZduLOSFZS0BzEu+8MuM4vO1wfm5u2VCbzkbYq
         rWEXGkJtk3PHXlJvpLdO71krqzIdtvrI7Opd8KSQXp3W9py7IUm1b3shjjHdA+jG9HpT
         SFRhId6lgU0T6zPbNychRhHuXVUNWTvOYj1UeLx8QxG0jGoXPUVas+N4d39s1NpTjPXw
         r5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784553697; x=1785158497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/i+h1xLBAMF009p2KMCeNBKzps8J4NXn33rD07ylA0=;
        b=CLXqeqzVojntYs/zACA4IgPg06usyQHmcs04jJ7emVtG9b1hM+bx5hXZB2IJcp0bBL
         Aj7q5+BNlBAJUONc1GH0F9hD70iSWbKbwTzPClFIAhXnvWI9lNr1vuSwYJzAqkBGDLdr
         KZ8Wa2/QdQ6lFrBPD51yr6fZpAaaAMenGfN+AnBhVh1RRnJaPg9zhcsGyLj46pJF47Yx
         rg8yWZrcFUoSGYjxsu+kilUV5J/FsDwdu1/yP8UpW2cnGZzhv7T3X2n2WCDqnTC+av8f
         oMwDlyb9Yu70nU3zmWfiyzUVuFQy68PpiJE0q3NYcbex2AzMnJqm4XFNEDW6STEB/jps
         gJ0Q==
X-Gm-Message-State: AOJu0YwGKEKhsRvUTqiXk3375//nJ2wKoHig8GfPtHJk3W6rrS+P/QzD
	D0EwYE67cNXOyVSEgMOtxDzIg+eFy+qajB5yzYDsDcYSzmxuGyflX2UJFcJRyPHe4ySd
X-Gm-Gg: AfdE7cmi1pEcQXIXDpIgVtFrFMf0xxMPViJIRmN0Q6YIwztAIuqNn7ucx0R1WX3ieX9
	5NKEKrLsvJoeWAZgA2Sn3+NraNhKReP9rfF+hewrn6W83Ocg9twCQldhEnYUhy31heXj/PBpfev
	79F/K7X7bbqbG0EMwUskK2BAjq3KZIHS6kMhFXYRxsTnYZj2FE+E4zI++z1Lz+FHLGYFvBbZ449
	ohhv+iEj7GO+d6AuaFidUm3t8hDaxQNGbfqN4Ez5vFP9a4sNa5qZXKTDrM/Icf33Ei+MGhnuYwN
	ay+abIkTl0/71VHhCXHcDXEI+Y2sNPEl9NqyN5AMBs421c2BmEqfNOOde6Yc333xPnqqRa5COXm
	pqzW790lf9X72wUOooaqqv/PgGlxaLjHTlCrbBrwfjRsAmYgWpjrxzWA1YYG7/2S0sZrsqgrdDR
	j3qSo7fvxF2xftd3ornyQETLTITrB2i841/LB+ZGk11BmgiKnqxsLJCKxM1NOitjSwHJopPu6Cs
	QIHzxaOMgPIqI9DOvCDT+Xm
X-Received: by 2002:a05:600c:198a:b0:495:6478:2dbc with SMTP id 5b1f17b1804b1-49564782e0fmr3937485e9.6.1784553696132;
        Mon, 20 Jul 2026 06:21:36 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.222.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm509642335e9.7.2026.07.20.06.21.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jul 2026 06:21:35 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: david@ixit.cz,
	horms@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	hexlabsecurity@proton.me,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] nfc: fdp: bound the device-supplied read size in fdp_nci_i2c_read()
Date: Mon, 20 Jul 2026 15:21:33 +0200
Message-ID: <20260720132133.69635-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <879ab436-043a-450d-87c0-70e7c6f4ff8f@ixit.cz>
References: 
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 20/07/2026, David Heidelberg wrote:
> I agree, I was looking at this patch yesterday and the current format
> feels unfavorable. Please send next revision with Simon suggestion :)

Will do. One heads-up before I resend: Bryam Vargas posted a v2 for the
same bug back in June [1] that is more complete than mine. It also
rejects len < FDP_NCI_I2C_MIN_PAYLOAD (the lower bound Simon flagged,
reachable via the u16 truncation) and fixes an skb leak in the same
loop, with a KASAN reproducer, and it carries Simon's Suggested-by. It
looks like it just stalled.

If you would rather pick that one up, it covers more than mine does.
Happy to send my (narrower) v2 with Simon's suggestion if you prefer it
instead, just let me know.

-Doruk

[1] https://lore.kernel.org/all/20260616-b4-disp-b1f8ab4c-v2-1-2d1fe5955325@proton.me/
