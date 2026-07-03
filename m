Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20C2F1FE3
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093678; cv=none; b=bFJK1u2iso3DGonY34hV9OyQN1of/ZaoCQq4CN9uh8rx33TqoVBO2+6Fb6lLCwBhXqUzFfXDGP76gVq8dsAUhDwr/6uekY/B7q/quJNm3P6S67irTUwJc3EorCM5m98KPom+IEmx1y15gBNA/lLZN11zk8FB5Cdj6fXpN2YtY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093678; c=relaxed/simple;
	bh=MIkgH6lX47nyqTknYQhqBa2iytl/ui0FuNwSduCYong=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKg/rSDrEDQIRfUEFe0xbMRWVMUD+swNSVC3KJXxSGjduQs7j4m8iUrXgHrfYMNs+Awh9J9w/KlU3sZu3GxbJ/prL82qJJNxegfaN4d6GjlZRFp+Nml5yMZEPXOZqHfnTeAxGALAvPoEhxqkNnxSbU3g6J15fx+p4+sHYbwNOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ijs3GVkx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ijs3GVkx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-473dc4cf238so447959f8f.3
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093675; x=1783698475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wb/lL516Ke2gEZnreH8GoFJIYSB13pgGSEfeFyYzmZ0=;
        b=Ijs3GVkxV4iBBUfV61MMNdcQ4WfXFWyCWWjHtIogxP/DruL7GJS0lFPvgPgpwpOFaK
         pqPJk9reJtAGAOK2EZ9f5CjpCezQ/wYga+cRtOOhQ36D0rNKCf3q+fusUIjqjxCKQIQk
         llXklzRxp86D5xqkQKc+wq4adCLRziulvzVruKwKtB8ZqBzibQnEY3nezjDJFsln2kiu
         6fCz7XXGvYLN+ASET1P8lH3GBdCz0c07hY5N+AZNZ363jgDPniSRIxSxnmA2WFJJq/3y
         uTJC10FVQfqDSqZnRcqF18a7f/0i9fjluKRK8UvgKpL+cKeRfT5gBA6kfTnRWS2kjMjM
         HAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093675; x=1783698475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wb/lL516Ke2gEZnreH8GoFJIYSB13pgGSEfeFyYzmZ0=;
        b=bKhoqB4KCJy+uEvXbBR1gC/i4dVgMjZvBs4vBlEMUppXIR0rC7TP1yk8v0UN5k88YK
         Lq/dQv1k8+Ql7PQ7rEaJ3NgJ/cJta7CSqS0hDe0Q+Dq1n1+QJoOGe99rOyLlZsM/pgoA
         uM1TnSB5eFb5ajp+tONe0PQDYMUFt7bzdIw+w+e36fBXNTex+ObPlOGyZ3ZF7t8QEqPm
         NvwQN1L9FSLvgoIxCBzI5js7dxpE41RLkgxu9i4qt1fYaSyTzjUsP/WBVXb1bu4fjH0A
         gLuymB21O/5G5eHUdFe66PeH8LRRcmvAQNXozJaUPEVy0lfvzxxATbyrbPEPhvxi0ipD
         ObdQ==
X-Gm-Message-State: AOJu0YyguK71Bktcid2HGva8LYize2sZzCmdR47IqWwkTmkIW3Uya9LD
	1BhgJrJqVqzp7qJWMB3u0ZVJ62KedBWH0MxuVXovg09HqOQUpIwys9WgFWYgn/iiCUc=
X-Gm-Gg: AfdE7cmEwvFbq3VWYvC+JA3OEhu6xUkGMZf6Y2ioF0bHWtouK1ThG56RncCoTeRGHUl
	d5NW+KLYwGhhPpXe5Qi8yHc67km89C3P0FqtnOcvgLTaSz7+f7LVct6sXijBovBWYaYLMLtpUEE
	DchwHD9vsHXitt4JgDU006SyBvDON0U6QWPjZjvOeD8xsj/QonYMomKnV2LLRR23Y4DY6ECFOTk
	S24+jbw1B2X73pQynGwArnP5cs6od5DRQGLUCmhUl0iDfmmboEoosX8z9SUL0FHhEB2APaNtXKS
	u6ee5Qk/rXoCrJt0+GVRpy5hb8iHcYZjix2oGeAhUkosCHsMFaxVoq3Mq6L7dgxmujgFQoQ9Ecf
	lBNwMCtJ+jWpFSzqoaZsCQvpRprdstCG9WmdBeNy8vBeNapkEiODXv1tzPbsWXaLMl79yXE9P2E
	CYQRpkIjx0M6TbCOg1FmCHAxLrZFByGBCVmwLXnc79H6WU363YW9cfXhMJIowrP8Z8Of67PQIPN
	eCM
X-Received: by 2002:a05:6000:468a:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-47757f4cfc0mr11220218f8f.4.1783093674748;
        Fri, 03 Jul 2026 08:47:54 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039b0cesm211178f8f.22.2026.07.03.08.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Jialu Xu <xujialu@vimux.org>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/12] nfc: Unify style of usb_device_id arrays
Date: Fri,  3 Jul 2026 17:46:26 +0200
Message-ID:  <8a186cb0376deb3d4f4264e6ed351562b79bb53d.1783091699.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
References: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=MIkgH6lX47nyqTknYQhqBa2iytl/ui0FuNwSduCYong=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9lwFRYLKo/qTC8lhsavgsYOwQWXLMYDZg3t3 O8cTgWRnHyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZcAAKCRCPgPtYfRL+ TvEACACVT3/H7V9ILy03CetWjNUbaM6uRDPGgCeCiE+atFQbtwiCN+vpkjPpu46tzu01fU+mjtz YyhXRfm+oXMNarG9j1/JQ5GCbCT4FicuMZlNHZZFbrp1a7C/2W9U6aTGc2gnZPig9cLP0C54DoZ hNWTqEZTVXPqmfmoIP4Fkf7F2V47SOzNvWY3b9xX2EmJ2X2/TPsb99IHVIRvL/mHVoOiK8gjssu FizMq3Af1QYhOx5u32PvHiBKnSniXaY3n8WePj8dYsg/nUdi8TBLUNmX8U1AcleV2f7lpS+8R5F zbX7oy1k/jpAP2h/VKcOwX7tjkV9KvGTe+NTe3uJtsR8Shjz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The usual coding style is to skip the comma after a initializer iff the
closing } is on the same line. Also there is usually no empty line
between the array and the MODULE_DEVICE_TABLE() macro.

Adapt two drivers accordingly to match this common style.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/nfc/nfcmrvl/usb.c | 1 -
 drivers/nfc/port100.c     | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index 4babde8e4249..c7f2afe00b93 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -17,7 +17,6 @@ static struct usb_device_id nfcmrvl_table[] = {
 					USB_CLASS_VENDOR_SPEC, 4, 1) },
 	{ }	/* Terminating entry */
 };
-
 MODULE_DEVICE_TABLE(usb, nfcmrvl_table);
 
 #define NFCMRVL_USB_BULK_RUNNING	1
diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 5ae61d7ebcfe..b613f5e2fd57 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1480,8 +1480,8 @@ static const struct nfc_digital_ops port100_digital_ops = {
 };
 
 static const struct usb_device_id port100_table[] = {
-	{ USB_DEVICE(SONY_VENDOR_ID, RCS380S_PRODUCT_ID), },
-	{ USB_DEVICE(SONY_VENDOR_ID, RCS380P_PRODUCT_ID), },
+	{ USB_DEVICE(SONY_VENDOR_ID, RCS380S_PRODUCT_ID) },
+	{ USB_DEVICE(SONY_VENDOR_ID, RCS380P_PRODUCT_ID) },
 	{ }
 };
 MODULE_DEVICE_TABLE(usb, port100_table);
-- 
2.55.0.11.g153666a7d9bb

