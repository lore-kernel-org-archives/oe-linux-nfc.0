Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792967266;
	b=Ey3Q4A6En2HATv1xITeDB9NPd2uKjoJs/jAzXQhb5S/S1aNDjCHG4GgbWXxRMwasS/oK
	 SgkwDECCJj7tYQhQNv8RW3khfrj2J1YwbrgZNRsQJL4k2Ww2IUk+9QNr8WiNsV/FM99Tb
	 eJv8HQ/ywWfkLEXKWGOxLdfAA3xHxv8SYWoP037Q7AXJcpjW1E2Cm6XEzoRlAeNSxrt2Z
	 YVyT9OP+hhW4Tta4vj/4oe2fKzivePDe5ntBuWprCvY8mHY798NrU7aFRcnx2ZolOBEWU
	 r+iI+qpvoFUvzQFb95jBz4UAutiFkdTTJMyab3+I3zx+0c31C56hpQAe1Q7nSes/XoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8L/Gu1pYNU3sPwhJxM4LxaVvBFBaLA26Mp5J8JHh3DQ=;
	b=wgPjW/r6237kyrV9XoHy5MhmGQzyu8/zP8i9cfLqOuyeQWjuDzKw6wqMn2i7cLMgYeuu
	 ZG5Jq1XdClmMFXYS6Pv3LwtyX1RBp36sF5o/YEd17/raw64GwIQxnGablyzzHXRJ+FJ/K
	 5qk9ALmL2wmce1Rs0wIERarEYKdkwX7A07Q752mUzZrB3rJOuODt5Bl1XUiazGiXfD4iu
	 0AbGgkY2heI5VShPhv7i7TI53+Cy7kPXWcuXY1pqed21OWBDqWiX870qnw3KjIKeg6Q8G
	 uIFMI+CBCLD+Wfl/ht59QJZqDiOo8tv53suUa5K4eqRIQqwgxBmU57cabdOQXMMLK3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIW5Sztl;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A023606A31D
	for <oe-linux-nfc@lists.linux.dev>; Sun, 25 Oct 2026 22:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A023606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIW5Sztl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so13805055e9.0
        for <oe-linux-nfc@lists.linux.dev>; Sun, 25 Oct 2026 15:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792967265; x=1793572065; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8L/Gu1pYNU3sPwhJxM4LxaVvBFBaLA26Mp5J8JHh3DQ=;
        b=WIW5SztldBhKZXGQIy2wSRiESy0LHo1TBsq7/OPeDM4rSfsdUVixdIJ53ZvJE0LK9+
         gKjRXSH4H6iIngz2NqGGHS4cwkw5S6udQLM8cG7adQqMpMxcnmEdq4Cj/KXXvtnu1a0P
         sVqmFpHdbtfsv8uPvQpbJBZ2GjSr2+LyLVe4ZpSLGtfzUhjIYIOnUtbIVlWwDOUkDtYD
         McxtMYDKqz2MhsOiieWAZDI2EOMeGP79qYw14sXKNmoim0czbH0HTB6rrv+n1tmPM71f
         Z54YzoXkVIvjELEIo5FFxV+kPGqupjMDOckDXqWNRGU5Im8VDxW4B/LS3fAr1PQuccZb
         uczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792967265; x=1793572065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L/Gu1pYNU3sPwhJxM4LxaVvBFBaLA26Mp5J8JHh3DQ=;
        b=BepfymSoe1ql5bg5VUwCJirq9hTdKZtHxHCHDCZif6dATJzI47NFGjmsNelCt90CJz
         3VINwpQgWqA6pifA7esAI+5UREV2xIiVRzruILWLADuL7q31ZRCBzlyNP6UPLobMoDXv
         EGVHsEhY+MHq20p1Mz6toZp8nps36IlvO0Gs4h1f5bBHUtpo6uB3UWNmomEgMYIl2GA1
         wKnCIYe/M0Ed9z8ZjhLpjR3uxDtS1J6vLlCXJdEMSYL7DDRqdNPgX7Iuhvjy8fDD/vG6
         ITOubKUBoR3CdyiDP7UnTnpsT+wOo1OyTNF4IPK53MbH8IIz60DCsjhoVWGqXJkLpjJv
         PLwA==
X-Forwarded-Encrypted: i=1; AKwUvBwsK+65ppXpm4OCUMEhzgH89j0OIIRnwbrlZFO7PqCda49SrePiLRpyDtgBphuR1dl5N7Q1ss5gQT4fk6o=@lists.linux.dev
X-Gm-Message-State: AFq9FYL2KduNRopPZwk6OKbROcAktxwv9xOIg1zgj3H3qNy339XDSxki
	34s3jNWSYcNm3fpzle9gp6t5PlwpYVqnmgO7ih6BKoKN/c2gzqQrJSA=
X-Gm-Gg: AYBFou0fyRcatwG3WHxBUTBOn8cuEG/aPUdee0IU3aJZcGtp85ySb78RM7wrKQu9CGG
	Nw8VTY+rLRQ+SV/Yri+Z0hseAHs4vINEkn1XwSoT8157DwCxK5suDAhNB3guSySLjHO4dhfw3rF
	Jv11pXOLf1SsfnZzE8nN9YFUVqDW0V0VYayAD8IdlCKnB65sbE0QdTnchNwZCHU8Teig92nVbYd
	zgcKvsbSV9S3ZT+zQ1IWt8nf2b5U0nuZFFh8zddKqiDEU9Rpyv7V4mh9sAz2GWQG9+gq2m4KCUd
	1pzlYJIDFyiNYGvIgtIG/IPP1Qw/2Jx66PNzMwqiHek/8yM7Jrn66+YoN/fNSnBlqd41Rx9MdX9
	HVed9nSpF7+KNrkbyfQWIrp6K/zSh9hIba2NOwo1cEDPL+KUa1JCRB31/9QVFdLQw1ETXGyXwhL
	jCTcLlIFVMLBn2iJV1kIkCYGEbVd6JiBOtrPA+I6e5GXKEwu8fw/wZ5LorbLxCtDuANCHvNDMP8
	JhB1+M5X7RDCy3G1PRpLqUIWu3XX0vh4YT4tQ==
X-Received: by 2002:a05:600c:a45:b0:4a1:e11f:b2e1 with SMTP id 5b1f17b1804b1-4a35aca4bbbmr98354425e9.15.1792967264894;
        Sun, 25 Oct 2026 15:27:44 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm401391845e9.1.2026.10.25.15.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 15:27:44 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: netdev-bot+sinfo@kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linville@tuxdriver.com,
	sameo@linux.intel.com,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net] nfc: llcp: use timer_shutdown_sync to prevent timer rearm
Date: Sun, 25 Oct 2026 22:27:43 +0000
Message-ID: <20261025222743.1092003-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179278531637.3327.11947058101101849130@kernel.org>
References: <179278531637.3327.11947058101101849130@kernel.org>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found by manual code inspection while auditing timer lifecycle
patterns in the NFC LLCP subsystem.  The issue is theoretical --
found by reading the source, not triggered in production.
