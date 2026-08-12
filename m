Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1AB412BF8
	for <oe-linux-nfc@lists.linux.dev>; Wed, 12 Aug 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527785; cv=pass; b=StAPFqZlwOZUH9rQP8IrSRdsG1e6/bTTPGe8wZ7mzda6zLTbLEw0fPOvNcPr+8SRhHCFTcKrEdPPfoSzWh54uAQMl1UVQP4rfw6LeszlQ7T1J6aBuBFs3G2z2/PqnRCI8QJh0f1Vwku01hZIDHX7BxVSY10i3FBMFAbvA4nkQ3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527785; c=relaxed/simple;
	bh=ve7aPJXVQM2J1syEL+rOQPP0Q7Xevv01p4RL8g43uNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCsE+ekyWMa9GtGwYXF3xQNbohxjx/TwVAS54EWbUyRWW7rEzQ3oeCF3ssogpQF3t5tdoKBNpywYV3T9csmWgUSJlbZvEeFhRtruYA6rLXna0PLGdBufL3/6rWMfViDbTbkLZaJfimtiBHNkOgke3F9TSvWOcGAqCwMB0iCht98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOgerRHo; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOgerRHo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1600d040e4so122174366b.1
        for <oe-linux-nfc@lists.linux.dev>; Wed, 12 Aug 2026 02:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786527781; cv=none;
        d=google.com; s=arc-20260327;
        b=oUCUbwBeTLSzVoTy22iSq9yuGCAvsfg83eR+kC1QrLamztyf0lvNR2MRXon7AuSuZ8
         hAZ6fSLPN1TA2qIrsOOYRAaVvaOqRPSV+NWx+SNNrRxM9MXgCByQ8XCRpdGKMS87ruwy
         Eb3zG/06Xxbs1il77Y7fsRQj9pSemHJy0oZdm6bzjZ5EifhWbtciRO6D5cj4hp4wDvqj
         7nE06HiJXaXnvAHWgT2DlRulAXMvvvPY5Jw0NQSuynGqSnq8Z13D0el34t4ugw2LUbFI
         TMwXXr8anlIXZcU5wWWAwo6qqrQaqtFFvo8A1m3rRkVnt2WS977MPtYHYnqTBnjojJjj
         4xfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zEhZ73/l3LW0qrfWxddjxawqzrlD2pI0x8CKLdSZgZM=;
        fh=fOtbvWQwpl7le8FxIjrO8h8a1loqKE8y1+3Yu1GaHvw=;
        b=AJbhazsaxhT6J7RkIiDgpCBf2N44Zz1d5V/P/sy+SuHFwgkPdCKoO3pomVObSr86tJ
         yrF+qZ12X57Y/cqNVncqEGzV2kZd40tteetAd/Av3aHWcyrdT67j377pmtrjl+Qneivn
         DvvfvzEljQ5MIs9XZ7yEhDvl5TKBEkR1aGuvtJDZqxkH28gEyzMfFN+Fk6jOUmrpKJ2n
         jr2Zss0pc9FRT0nqtfoMRK1G0aGtGo7YFZPxxbAPSpJgH8yXdIC0EP6Otd8VXJNUfUio
         N3mG9S7jvWxd88CLcYnfequ5L5ty+NGmVWCaV74gix/5bzlL2BY8oI6UxUzt3gp2UQmo
         PvyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786527781; x=1787132581; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zEhZ73/l3LW0qrfWxddjxawqzrlD2pI0x8CKLdSZgZM=;
        b=UOgerRHoYYqkWwvqDoKl7vrtDOVRj2MPst8l5UXmr4EzcNSxt1emXg/+huAq0uBmJT
         Rh9w++KKwx/pX14R7/uVgezTtWBn6YyihQqu7YkunjhNbCWHzx9qCSpiJY0OVcsQyHfI
         xn4C1UBMVkbOhSS3QU4eovJ39g5hBeDq1vmP4EpBIfMRXpZngqpTVtyghss3LAUvrnbL
         LQ/Y8uMX/vT46QYHVKJAY0QeX1A0pWVZ8zejGDAIkl6tSEIAXpNOpFZxt+Q/TddWmoN2
         3DTSz5i2O0y+nEbpUXIebsClhpwn/rkAkyrcpsjMf4KS63WlWfRfnupMn+3ERckzt3KN
         goPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786527781; x=1787132581;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zEhZ73/l3LW0qrfWxddjxawqzrlD2pI0x8CKLdSZgZM=;
        b=MDuxbycvxh6KcjkmOvDFbgisYfQpjvrUlS7so8c+/cMxe4rcBMaMZn5fsj8B3RuJH7
         fGeShf6O17/Uanlh4KIDuUiIUJ2iAh+I7BssWY1HucYPVYgGnLZFFNZvgIdwzInL+uDc
         dFENtfOApLs3w4K63oQ2zAj8uZ67gmrrx9DKbLO8tCQ6zncTrwCql29oX3IRvmP07LJO
         nOcSCbZRS8mDNY1vrk41hEjse3S/mEFJUJgkBUB6xGi9XVjjxHPeU8pPcfM3YQhGEKMt
         8OTgfFfeUf4bb0tFLpJzQutUxTWo0jAkUX75hcCw05tQdeCSX3DmSWSTtmreOrcAxFEw
         No9g==
X-Forwarded-Encrypted: i=1; AHgh+Rp775Smsfhard9zkt1tJmHympGYaQ1jc9zI89uSQGcanveUEQCvCbUKrXhACEyEOyq1zA07xLoJhNRnGIg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUBTv+pAdzeHZSv4o7DaNQLddQdT+kxrKO+C+YQi574BUF9cI0
	qxzdxL2cY9BjW6DzFxhNKuMkg4jzv1xuaS9I51cU0K06BlznbkjRGJAAJg5wPFesQGBrshd8tba
	uB7fGfruyOn/KbmrJ1bmQaiut9alxqgw=
X-Gm-Gg: AR+sD126ZzF8ZN7lja8gBH1LwB1ZmVMe2tpi292VrdfuOw92L+8YgyOpjqoLFEndmkM
	oobYbY86w/mzaGVB0efsU07+yr+puRsmYF/WEEcmcF3SblNP2R32udBX8B5q55vUSNMVMnZ1IrL
	JQRqsXtREQiFGl2CjNdZJkybiLw3VC4QzxSMpn1GpDiggL9Jmmoi/8uwaj3Yir2GBgpWvzkaPTC
	crH65XXjYhBXZLRpHfsOLAr7bWq0iAFdQSksvUC3vn4BS3dwypJ/R4C46FvQq8uAubgIFcbg78a
	9ZPkLNGexTWpLOn0yX43fTdrd26/MIWZTqVHlFWM3Q/UASyW57R+4xayH0qsV25Il+jWWKVfzEz
	KeZUd0SnKH9FtJfwJdSGjP3nXKxyt
X-Received: by 2002:a17:907:c510:b0:c15:f55d:f0d8 with SMTP id
 a640c23a62f3a-c20f5080248mr160120966b.4.1786527781423; Wed, 12 Aug 2026
 02:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728132836.41868-1-meatuni001@gmail.com> <28b1e429-39ad-4bc1-aea5-a17def952da3@ixit.cz>
In-Reply-To: <28b1e429-39ad-4bc1-aea5-a17def952da3@ixit.cz>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 12 Aug 2026 14:42:49 +0500
X-Gm-Features: AUfX_mw2IGBLs-IZzYD31HN-o5sEleYCRUJ5A0oB8oqNnldsCzCKU1VQwAdzs-o
Message-ID: <CADqcGBmqXjyb1PJH=bBZAtuMLM9+GMehtPCGbQ-PNLHZ6VEQ+g@mail.gmail.com>
Subject: Re: [PATCH net v3] nfc: nci: fix use of uninitialized memory in
 NFC-DEP general bytes
To: David Heidelberg <david@ixit.cz>
Cc: =?UTF-8?B?TGVrw6sgSGFww6dpdQ==?= <snowwlake@icloud.com>, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, oe-linux-nfc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David, Lek=C3=AB,

After analyzing the caller execution paths and commit history, here are
two technical details worth noting:

1. Fixes tags:
   - 767f19ae698e ("NFC: Implement NCI dep_link_up and dep_link_down")
     introduced the POLL-mode atr_res_len subtraction (2012).
   - a99903ec4566 ("NFC: NCI: Handle Target mode activation")
     refactored the code into nci_store_general_bytes_nfc_dep() and
     added the LISTEN-mode atr_req_len branch (2014).
   Since the fix addresses both branches, including both Fixes tags is
   necessary for proper stable backporting.

2. Return status:
   Returning NCI_STATUS_RF_PROTOCOL_ERROR (as proposed by Lek=C3=AB) is the
   correct behavior. In nci_rf_intf_activated_ntf_packet(), a non-OK
   return value properly skips nci_target_auto_activated(), propagates
   the error via nci_req_complete(), and prevents nfc_tm_activated()
   from firing. Falling through with NCI_STATUS_OK would incorrectly
   treat a malformed ATR as a successful activation.

I have submitted v4 [1], which incorporates the NCI_STATUS_RF_PROTOCOL_ERRO=
R
return value, includes both Fixes tags, and credits Lek=C3=AB with a
Suggested-by tag.

[1] https://lore.kernel.org/all/20260812092423.161497-1-meatuni001@gmail.co=
m/

Thanks,
Muhammad
