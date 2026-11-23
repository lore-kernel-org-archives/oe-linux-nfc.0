Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415608;
	b=gRjAjTtsEqvp+SQXj2HDIUwKjOACx5HgYANGTfmaKH61Ml4a++jvY/Oo060m4a7zV9C4
	 m1Ih0Wpv+iPI8g5FzuHw+F+OzDUoicXLwNlRnXIymYf8wHsiIY1pDY5lJBYNN2f+ltybf
	 tT0Zh2H9ugHQOkAy8lKK9cgRTtmgeW0RulAX7JK4CF/WfyNL+qvDsXFNyWD6RFX+W6HPC
	 4+7ZPtbpZ8F6B1lH4qwT9tNMwSwqHN/sl9+y66sbg/2zjddwCP4Dj+ghd2vyGvGc650vt
	 FYI/J2d+W1m2N/j8YVVlXwyAVCKxVGqPsAeY31fJcSImtN/otbjOIGKu7e4Gz5Grw8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6mnZfOSkxDepY2i0f378cTykfqpzL6KhJuIK0Wt6zEk=;
	b=MBTYSwLMbA8+TJhZttl3mlxIlATgDbvBKMDjgSvQezzKnze36eNrnAsg47E8LZKkyp2D
	 P0InQFLT4gkICf2rkEyQCrMV7+anJ1/nkgalo6WCXzUnPwswU2T+z0VQO7e9oaiW0yL2M
	 DwNGA9tIqxTIvn2DOnU2SQx1Egp3PwLHQmnPF0HgEbpkvykFgFiZjFxYq2CjZK/nZ7lqz
	 cEzmGDrR9MCunCiWjJVRl1EkhCZmNRg42wePJTvq88h2gxcVLxsvC0Z/1ajkcndb/tr1B
	 0/BOH9Sj1TJBhdsOnuuj905zjVs3KXi7cWBdGbScIl9GImRK+RPV5ckcPGJysmZ0tDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKVNnWD+;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F0B606A31A
	for <oe-linux-nfc@lists.linux.dev>; Mon, 23 Nov 2026 06:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKVNnWD+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869f03af6aso1985445eec.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 22 Nov 2026 22:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415607; x=1796020407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mnZfOSkxDepY2i0f378cTykfqpzL6KhJuIK0Wt6zEk=;
        b=nKVNnWD+exYg9krQ2p+EZAXREAxjFB2Ts4pjjfxBd11WZX8TDaTCMjoiRsYhjhfr8C
         GX3K/REuW0u16pG2/RE+70AZApEnST1HkzG4Vs3PUvpWMJQ1jYKOPsE4LEey8YEsXqoE
         0qKV8kTzKTiEf7nHXIZTT46PXMxL9sElBkFA2LFyKOR1wuCkncHaqCMlNs7WxgAw8Z6J
         r5ZEyan9cb22J2MEu+bdapXRH8M9uemCxFL1hCUPoVBWO3+SLfQPV4KdTsXT9xho363p
         CROZUgLwwprBDB3A+quUalB6mwJjksNZUPxOnkWKbZhUh5W5/jXwpUvpBC01WD+i62wB
         sSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415607; x=1796020407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mnZfOSkxDepY2i0f378cTykfqpzL6KhJuIK0Wt6zEk=;
        b=LY3butKbMDNk+XQoRuY3jJuMy4KbKWee3H05RgcFu20klAQNP01lQtxVgcUB6iWQG9
         VvU5NhZER0r56hyy67gDEgzHQmR/s6njEMOJBuMM1l0qk6AGuzni4oIsU/RIDEx4LMGH
         dtWtKOBa0rhyYUMIQFV5ck/0cJycZKAyL/+dh/HdijI57S8sxCK5G8UqcYiTSTYLhBhG
         NB+OkOm+2gYhK13x0redlGXhHT3UEhpHvpdrZEGwMMou28tsqwSpiV/54J7Lgx1WMIb7
         Y2zrIAPAyfNNWoreAXmD9ErGyEWokCbypGvIjdeug+YfIIMN3ZOWxRR14IbuqNJDuBE9
         lkoA==
X-Gm-Message-State: APuU4Z8uK9cw79M8vUMvvKdBDnOOwwyPf00rzLWL9jpEAbaN+wym8COy
	wHPwDy2fndyttS+nOgNeqMED1+jnwSjJi5GQ/TFFkIDxHw6IqBSbWpfnyNVkEuxOd5Q/nPLv
X-Gm-Gg: AZFdTZcdlDYBoGl+Zr0tppjfpKtkT4JMFXHdlX0PBYudNOZxTmxYvQNNYAUOEYd+rqS
	NRKVPiJtgYDk8s3zPQQ7Xm+iw9pSFZv8n7487TxnwrvveVUMTDGndnr9gxGYAPFUiSZbDKgdh/n
	ydiO168gcGb90Ukoy4s3dSIV1/72KuObm14+ZEvZhIob1UIXyk+J+QirGQQ0x61EUTf0hbvJCbT
	c+cBHgL7ItYFWEWwOfTaywEf/cfCjZ+Rtt6rLqzWMCfwTCrvOF0BrkgMxJC3QirmLnRojI7dmUN
	y1NNg38KlgBC03g7bOr7fVp8U5CfQbNQMpCfaJupT/V/6bGLXdMofjgDYfwBH4vG2TVYauWzh33
	j+gwE/czXdHzUUzAdzef6Yk4M88RZkcVKSV7YWW0OlW1vALOAtobILKTARTL7RlKPee9UtKEFQY
	gtEyJXgMtqruEcvYfDXXDCqFQgtQMToDmcawSNSampUszHGTu6eGzD3WFlyPJF5eFX2M1robtzp
	lZ7Oq3+f76uC3tz1PnGpVvfv/6mXtC39qOxwWBj0uCCnyq/6vazfa12zT1v3K7pJralL6p4u1Wr
	tIByp9U5I4vRJV50/u4Lhf5FKNshKGDQJsVyN3Iv7ZQGTz8MwilKPx7rm7czQqlJIMLWjTo/2xK
	lubghmVosIhtXdmMTyIUFee3v+pEo5L0K/dQFQUo/AI6er4yV8YRujL4HeuTZtq4qMwd024CUUk
	GilYWJdCg1S3ozdIook851rSziDcOyw67J+46Mg8bbVdcac00viTLfFwA/DXtpL7DD
X-Received: by 2002:a05:693c:68dc:b0:384:244b:12ed with SMTP id 5a478bee46e88-384b11ec95amr13052915eec.3.1795415606797;
        Sun, 22 Nov 2026 22:33:26 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-47-129-70-252.ap-southeast-1.compute.amazonaws.com. [47.129.70.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm35452817eec.24.2026.11.22.22.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:33:26 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	"Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] nfc: preserve NCI data status error codes
Date: Mon, 23 Nov 2026 14:33:10 +0800
Message-ID: <20261123063310.1267-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261123063310.1267-1-luob87709@gmail.com>
References: <20261123063310.1267-1-luob87709@gmail.com>
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
parameter truncates the errno and changes it to an unrelated positive
value before the completion callback receives it.

Keep the error parameter as int so the original errno reaches the
completion path unchanged.

Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")

Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
v3:
- Split the signed NCI status errno correction into a separate patch.

 net/nfc/nci/data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 3bbebb950..4a2326a33 100644
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
