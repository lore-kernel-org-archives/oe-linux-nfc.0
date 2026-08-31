Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E73AE185
	for <oe-linux-nfc@lists.linux.dev>; Mon, 31 Aug 2026 10:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788172894; cv=none; b=UH5pChGPpuQeifs6yc2cPhZasexmC1J68MfmT2aLqM4Nbf+tnXJ9Ayx6XF2hQlku68ddblWU4ME0P0+6NufHagvfmHQggQEUxKCBPq+Q6Ab2wzBXOoZjuyQ/RiJu++HdtW2xNftBGCMQH257sZ1Jw86zU1dubms0+he3cxHemSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788172894; c=relaxed/simple;
	bh=n8nAlPzLuNaNzoYNMqWar7mbTNAmC/pl3V6wSXOs3a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWFuoYArzR+/P3DkqaxFjIkPOy9+kkO4yI+73uRF3OpMcuPv+CXNFjbCPVuDhXl4QBcMab1EDEN2i/2HtFyLLWYNVFV/XWC4TZFcqG8BzzLHBn804bZrt0bgYCkbgrYwdqsfdiIAmpjsbu2xHHbMgl+FQtQQyuLG0A/9eqdHNZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebOwFnTQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebOwFnTQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c25344a8c6cso432654366b.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 31 Aug 2026 03:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788172891; x=1788777691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=469VJ7ggqMApdca55dQKF9LKYksJ6nYjofl8G6D7M+A=;
        b=ebOwFnTQwmEOLtHec8QfJW9E649Q186y+BBLkWK9SXCv7snCNqwjeFoQOh/HPcYYEm
         mege4r7XaRqmX7utln2zDVZMLjCz/Thv1Cww8agZZ/H0nsFgv0ZP0jI1Yq3wrGWQqT/v
         lsZQtKsBU58NsmSVOtlx0EifQ0lx8zzDYM+B+2lRvCjYoFudOt/9zc29XAoQdSdy+ygR
         z+HB5/AjXnXEVu16g+PAG2hvUarAfsRFtRgPI2CzR9gp3UzvjVp1f4rQT/jhIhlO6OLH
         2/Y/M2zcBuUMMzl8RpGcYoZWZmux6Jo1qvjzg/yLwOkZevz1v7TFutoJLhvUQoipCHsI
         g3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788172891; x=1788777691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=469VJ7ggqMApdca55dQKF9LKYksJ6nYjofl8G6D7M+A=;
        b=PIyxsTwnvqKHBF39ntj22kCnfFmhKwrZZDZY8i7h0t5WTzX4h8LQ71u3te87yMTKsm
         1kKnRm1w6XIFMizFNjwxVKIVDmVlDK/znfviKn73s6Zp2ZvQWsdD2PFDmgpoYusmAAzu
         Hcx1GFhN6MxJbETkOA540HZTMSw8+8R95bK79uzHShsxvdHpfn/GkBs1slIGocg1O+5N
         x4Bv208ANvRARBx2s0iT1oElRSktYzWdBkwY79swu2N2Ho+GREPbnwhpKIyotpf8hIQJ
         5Oh+lv7ZGqTe7xl5hhN8UlRJECEerbTrS9Cy6RpJYcCYdva0/bNp3aKJ53k3IbZtHBk3
         mrbg==
X-Gm-Message-State: AFuF++m/m8DTB6aTVCP7TX7EfdRxEc1PesZjHxh43U2DgPWbJyrJGuK8
	pAJlbSnPaKu5sv4uPmYpfHYPh/d6vs/ireMjHumAX41+gb5HAPZJbpDr
X-Gm-Gg: AR+sD11eNaBKV3SRhB7W4GED6F4ekz6NyCnjfEyMq2DNP4Ze2WsaNFIoaVlgWMvH3Bx
	S8RICpyUJ3sCjKAoH8qgwWo/dHNlC+V6GdBlH9P35ItTGsdvIg8NtDbLyI6wTpGsRv/i7eUIJdh
	NbV8I0TfNhAfJELu+5yUnwtoWpucs29oicKwunScwHXLX2yvRUiD/ytVAeiN65S38PS1w7mh86j
	/igzedYUsNQ7uiq10LJtenjXo80bIJ4JqRkYq5ybj59YQ3FZyD+c3yJiPgKdJ3KUK6/ytBWwe7T
	SbDZaTbNa5xCGH+50aTnwpEFzVxlNtsjuPjEXC8c5fUvmfqEEMAshwglrEwO2g6w6z13Js6kGX7
	gboADPJZ0uLxoJCiuXHI5dxhP9Z2Vugx+3yTBemRGKebONtLeuDPl0+R9YoQy14EHDotMcjZi1Y
	5pL9NgwhfuSZnRP37Pl7hsQNsujHnubfEI4G/H1nDwQ2bE/IJzwezOm4fDctiY+iTiS4BpkcBcm
	huBtzaQ2ZWoAk65GPCITFxv4qf9AniXP6ynbmDdjambWbgfAZJOgI96hrAyoNr4E3UWoUymrCPF
	JeqOIjJHcADIN2+vCSPGKLj/XQDYaqpog9uFmK0pxQE+qpFIivl6p+V1YqEqiEXFdEHJlhSaMu1
	gsImP+SCC1rB9vWn41deSxxyx0IobICIx6a+Ngbf06IlbacdpQ3gwD1+eBJ+y4dvAz4f7Dmxq3Y
	TTPSEtd0J8r9pTK7u9FJOfILZnxzYR4v+ng3Ws4yC/gBp8KmS0MHqPc0rwU9SWkxBY6mrrf8VPS
	xs78bCmM+DAEA==
X-Received: by 2002:a17:907:980e:b0:c20:f529:2d6a with SMTP id a640c23a62f3a-c255721317amr1543011366b.22.1788172890441;
        Mon, 31 Aug 2026 03:41:30 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.i2f7e30109524dc12-tp.internal (230.182.6.34.bc.googleusercontent.com. [34.6.182.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1facbcsm407675466b.44.2026.08.31.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:41:30 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Subject: [PATCH] nfc: nfcmrvl: fix null pointer dereference in nfcmrvl_bulk_complete
Date: Mon, 31 Aug 2026 10:41:10 +0000
Message-ID: <20260831104110.1307-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A race condition in the current implementation can cause a null pointer
dereference. When nfcmrvl_nci_register_dev() calls nci_register_device(),
the NCI device is immediately exposed to userspace. If userspace brings
up the device before probe() finishes assigning drv_data->priv,
submitted bulk URBs can complete while priv is still NULL.

Additionally, nfcmrvl_bulk_complete() incorrectly checked
NFCMRVL_NCI_RUNNING on drv_data->flags instead of drv_data->priv->flags.

Fix this by adding a NULL check and testing NFCMRVL_NCI_RUNNING on
drv_data->priv->flags before processing the completed URB.

Fixes: f26e30cc6b50 ("NFC: nfcmrvl: Initial commit for Marvell NFC driver")
Reported-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=59d5e6a8ed04e6a000c8
Tested-by: syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/nfc/nfcmrvl/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c7f2afe00b93..c22d783718fe 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -61,7 +61,7 @@ static void nfcmrvl_bulk_complete(struct urb *urb)
 	dev_dbg(&drv_data->udev->dev, "urb %p status %d count %d\n",
 		urb, urb->status, urb->actual_length);
 
-	if (!test_bit(NFCMRVL_NCI_RUNNING, &drv_data->flags))
+	if (!drv_data->priv || !test_bit(NFCMRVL_NCI_RUNNING, &drv_data->priv->flags))
 		return;
 
 	if (!urb->status) {
-- 
2.47.3

