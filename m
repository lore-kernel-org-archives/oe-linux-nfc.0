Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675167;
	b=pG1kMFknPL5hbSnwBw1QFc2l0hSScHyU+e9OoXPE7xTZb0MuREr5b3iJy0JghxMAyeXV
	 pyTU0b2s0yf3nUcG4LDswylEif3ZpTL23oz3HrkgEEy15lSue8m0sAi/C7guu2+X+CniI
	 gZYhkGWZ5gonOwi+yp681oZ6YwriSyZEnuN2OIoTT3RH0oo8qB9tTeQyqhG1MiaP990XL
	 oK4IoI42GSmBHRTfQczJ9WiiskeLAk/ZZ8AmYyoECEQy4Ze8xEkwpH8g5+WNbxOpV9vkE
	 Yeq2zOriMNssm5LFlPZQMMpIieXdG3I2DxuPUtitCjzYjr8+89K9zFXVDcUJYVvux3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gRPsfsi93ztSCs2QSFkYBVWIi6vXulM42YvoVjjVqpE=;
	b=EkT4Zi+7ukpCwjLe/ACxr8P9ljsWI9AsTxO4m+CC2pYHX+W/D3VjsGhXbnY/cG9udlHO
	 9ejDhFGhxPwsEkX3ih+GtCoDelFubSmCFWicl+gWCYYr3xGgT89NDhPetlnR9NWzoVP6p
	 jBGRgUbnD6WGEokUrn9H3e8qunB1sga47xUwtX696Jtl8OP1fYB/YNTnk87nR6xbbktsJ
	 2ODdGkUqHzLD9zHVVjyujY5xOMpuC9E+2WfwQDT9mOOjfo8r40iXxFrtTPqkXhgYGKVW5
	 bKy5f2BST078tRK/YbMwF88w7/IMpD4kAYQCKy1M7Zx0lKrE1krOVrs+xmShBVbP3xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=baHAM2aH;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24078606A327
	for <oe-linux-nfc@lists.linux.dev>; Thu, 26 Nov 2026 06:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24078606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=baHAM2aH
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4266891eec.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 25 Nov 2026 22:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675165; x=1796279965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRPsfsi93ztSCs2QSFkYBVWIi6vXulM42YvoVjjVqpE=;
        b=baHAM2aH4JcugGd8I/+gMV5Jkh8khQLv4842OVCfHmRSyzVZ8lHR49WRdQSGQ2DTwY
         v6XffmEjkhBnlH50VRzw1g/gpKqSECSgbL78Fj4u64/GJgXpn7ydEVQ9MLY7sgUykWNT
         ov6wzkNElFhaCqhafJfhxP9E+oZDZCJSck6fGu0KQ8dEE2XC/3v48QJiEuvDTsRaJxyQ
         FrdNUodGgKLZLL/+FxRZ5BEa4WYZGxEWYu0e8Ik1f6rSLbwuJ+02KyJSZPDZZ7rY3+nV
         nEb5BKffTUt1E91N1jTLmo0ab20muyWqHbqF6i3/HHMATtcoiDYAl8deIuURxsUSNmtf
         gB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675165; x=1796279965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRPsfsi93ztSCs2QSFkYBVWIi6vXulM42YvoVjjVqpE=;
        b=Mcmjlu3WuvamM+9f4Hm5sbefMXpIHPFDOIMOgh4gGQ+WWUm8LUeXrBRytQ0+/0cyzI
         JJaRv1MyPKxbGJS9sh0ahiCNfn64dz7MHA62XnUCPRiV6L9Er6Vh1xBsgb9rs03ahZh2
         3HZ52l/4DdSp7Km3P+IiK0ZY63uuNld4Hxho8+LspCNp3UU7RgaIq/kKVUz7mJjPg8jY
         Xts/4FDDTCjpU+4HP763Blwlh5WnBpDrCJOvHhSPO21AOVJftS8rYr3TXH6KgrXzaGFi
         Fn9XtJdq1+zkoiYye0IuH6yXd977IpieitLFLZCoYkLR4oo6ddbP3Fzc9xjknXivf5ic
         +0GQ==
X-Gm-Message-State: APuU4Z+EpUiewb1k5g9VMLPO8D8ExeyoJP4QxjDAYoyrtavIMffRqQX6
	9y3tKkVQ5B/F8Q2pexJgFxAyHolHnYrM2zgC89aAAV9AmQJ4zkOEqgpZS0+kEYS0Ntx/tGZPLII
	=
X-Gm-Gg: AZFdTZffrhioeofrX+mDJZe6S79RV1PzxrTTMzmg7WdrRM0XoWQijiIZlpXeTvbVBp3
	i6aZQqTwGCHy2QmSjlct7p9nwwLzfDDwOfrDgYpWf1e8ZAI9lTJ3K1UwqVOw6+T+o3N6roiqKVO
	zMN3isHrMvBlnmalpkgM6mcqwxF9Gp2Fj03Xd9ep/BLsy8yJG76rzPZnp08460WiPaYUBnjrw1S
	tGJww4xkTfhxZ8GeWdruI6d3rkpRwvicP8tI45VIWp8KSMXpwLQyQWzItk/TCxOeRg+LW7RwyVj
	ohV4W8qEVYrmVeK8HCD+ykSmDUVMFMITrDGdBj008KVeD675pLeGpGeqtvy0b+iEXWDOewqWU2Z
	fsA3TFYeCdry3egGr/TiruhKRaiX6VHybabulaveyWtCfZFin5LVbGPlkaEr1LtYf2Hf/C6x911
	niH3jTyCb6YuK+ZTL6B8Ws2+K1Z/Oef1VeJel7UVbS/bjOvZI4R4MZYfdwLwWfhwoIQhtXeqg7u
	uKQwbCkpNHhyksToBLmJis4pHIwba64g5KGJLBvLhxJQsQi1yVe7d7BuxJ0FfIHjmKIFQBbWrlV
	zotQrj2XyeQDeLZn4cPIplHn2232Cz/1Cv0DPDuvzMRPEiukGFtvkbit/rLK/pXg4kYwP5fBnpd
	kYdC7iXAtXA0g24hW5WoqJTbC3d+ZX/5DmfB14EMHF7E1RkEWZxzzc4Sgyh3E0srj+rVdTykssE
	aZsarxt+x4UIJpVG00o0U6VhXhx42XzuJO1VjIu2Wk
X-Received: by 2002:a05:693c:41cb:10b0:386:cef4:1ffc with SMTP id 5a478bee46e88-386cef43e87mr4363755eec.12.1795675165132;
        Wed, 25 Nov 2026 22:39:25 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm55404015eec.13.2026.11.25.22.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:24 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 2/2] nfc: preserve NCI data status error codes
Date: Thu, 26 Nov 2026 14:39:11 +0800
Message-ID: <20261126063911.353-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261126063911.353-1-luob87709@gmail.com>
References: <20261126063911.353-1-luob87709@gmail.com>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nci_to_errno() returns negative errno values for nonzero data-status
bytes. Passing that value to nci_add_rx_data_frag() through a __u8
parameter truncates the signed errno into an unrelated positive value
before the completion callback receives it.

For userspace AF_NFC raw sockets, this corrupts the reported error: for
example, an NCI status error mapped to -EBUSY (-16) is truncated to
240 and negated to SO_ERROR=-240 instead of reporting EBUSY (16).

Keep the error parameter as int so the original errno reaches the
completion path and userspace unchanged.

Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 net/nfc/nci/data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 3bbebb9..4a2326a 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -213,13 +213,11 @@ EXPORT_SYMBOL(nci_send_data);
 
 static void nci_add_rx_data_frag(struct nci_dev *ndev,
 				 struct sk_buff *skb,
-				 __u8 pbf, __u8 conn_id, __u8 status)
+				 __u8 pbf, __u8 conn_id, int err)
 {
 	int reassembly_len;
-	int err = 0;
 
-	if (status) {
-		err = status;
+	if (err) {
 		kfree_skb(ndev->rx_data_reassembly);
 		ndev->rx_data_reassembly = NULL;
 		goto exit;
-- 
2.43.0

