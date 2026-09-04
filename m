Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3A46C4CD
	for <oe-linux-nfc@lists.linux.dev>; Fri,  4 Sep 2026 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522399; cv=none; b=JRWgaBghGeMtcikagC6UWJ4f7XcqzU7XNy8RPj6FNjCUV4kH7QGoVOYeNsiuyvfwqXZNZLr79G3uQcwffbTYznwANyCp90capfciFEghcG0nYrAULz/lAGbX1fn6kTsyqwF/kBBhbKIblST3GI/qKb+tDt3APnaG0pwB1rFXpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522399; c=relaxed/simple;
	bh=q/EHG82b1n2sCjSHe/6Qi0YTt1OahLioR6F3Jco6HXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lf+CqQ3MmhK8rk4/zZUXAYKYxT0Q6n6iK+SMQQ3KETz9ubIg/c9/kXomW68MK4nJ+RZ4gDsjtjFyYuWewbsoiEKp8R3CehY0vYgj9itO3BlLuEMewmxFapWUBtduMWSDLTC+0QZYlcJOIiW3VANe7TyIDj+KaBxHgza/ICPSyTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaM4gltW; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaM4gltW"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b1afdf5196so363611eaf.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 04 Sep 2026 04:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522396; x=1789127196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5/ycngy5ku8gnwGq8mTTya2wxi5X2DaQH5UuYeTu+I=;
        b=FaM4gltW9YOsmDn9mCjBQdx4cyPvjHmDku3d9ne/JKCjyxV+oTsW0o/Xvkhqxbf0oP
         6QSDBHtVH72dnInOhAEvwjCfUz/RTd/1lG3KRdz70qPkAO+qvojRK+5U1oiSAK1oiGNV
         0+HbQYi0ZENCvTGxLdXN8HtwqJJ+iZrokJSuTbnqGYWPrZrbn/UENkYxGpPRSSFwAire
         ZD8hg5ZfIoiNmMAdQHDEMGwtZyyMOVh6qlAL0o5MlXQ84dEHOTPfa8/DjDEC6oJ56doI
         6vj6dPobCQr49cu0+9hSgplwqDIcw9YOWbtsylRU/dBlmF8Fyi7VCq4LiaC8dWjXduu5
         4EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522396; x=1789127196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5/ycngy5ku8gnwGq8mTTya2wxi5X2DaQH5UuYeTu+I=;
        b=cTyMpz1k1KPjYv9u+grTcz2Y6N0kQq6NyOFVXwj9qcTObptgFQmZ/wag6Skc7+VNc1
         KOc0CzsyIdAGRieCw5les9FvVyX6BttTCv1yFcMoQ3Qi0PkCdeBA2SEr3cHiKJQh62SS
         zXmmeK28ckr7qb+HwXLt49oUXYQI+pyDpOs7ZTiRnWpjdevU9dRIe3mkijkEB1Ga8Khi
         H3bJi2LtTTjiKpSwFwkSOOLzE1qBqNeUvQ6uBeRtswDLnEdLk2hNxm6OhC0Rgi87RgL+
         apeITUB5JrQLikMflkLHH3nBOn6dTtG3ftsyXEqiIjZ24jJ9I5c7hNaa475oEvWeuczk
         gFAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfIkY/kXGN218tyGBaI+gnjaVhIJPU6BXHvCQrWisl4O3keXUY57pudfhPmknk4ktnLLwE9dOBSmYg4bM=@lists.linux.dev
X-Gm-Message-State: AFuF++n4Cyqvyn0lYJdtJYlj9lvMT0p+7nGGz01hQcik2IVV3kBhkCwT
	6BIceA9WatBX/mzVEQ1jaxjZz8WrTLOmsuJ7b0qqkd2jMTIIFBdhMTgT
X-Gm-Gg: AYBFou03mZwqmRI2phRcEpEOMU5AHRV+ZQwjNPbxlZJv3Y5lCwIO9rSqJvmVk94jfpU
	+Rg3kjY3DkUbIGRth5lKy9/TusWzsfMKk6XOQuEw6/2jvHST5r/2PfHpCxoUdowY46PuQ7b5Pui
	ccEi+NVG3pPPTDxOFXiF5KaOzw1CVfBLLRLRY7qcwV6ATW9nCcJrJa3Mab00IRrSmUJIKvBZKSh
	9Mjeftmk4QflTsKZHmyc6f/BD4xJYNTra0LPMcFP2UAH/+frUal38uM6JYkyzuJL4EVTfedROsd
	z6DVSBqWU8n/YEd1lXnQ+V6h3wJH6O0MW8N1oIHL0vGpilEP8lM5cBN6pQsZTvoUT9hT6DtA78u
	zB/35tNzyqAQ8XVmQyBjIAgggeIa6FyirSYfDZtSYD2CrPZAHRLmbn99PLAqHQvi5chL0W0LbP2
	fOBBK6PeFqraGsCmBgYroWiwyHiJj6cWdPRvFv47RJZ9s61vte5miKWxxaqvJjAKMfypS+BNERd
	3CSZYValSIPVDF/HRV04w8PMKk=
X-Received: by 2002:a05:6820:179b:b0:6b1:42ab:d040 with SMTP id 006d021491bc7-6b6fd3c83cbmr3514126eaf.28.1788522396581;
        Fri, 04 Sep 2026 04:46:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534152sm6071545eec.10.2026.09.04.04.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:46:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev
Subject: [PATCH] nfc: fix typo "occured" in comments
Date: Fri,  4 Sep 2026 17:16:30 +0530
Message-ID: <20260904114632.31336-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "occured" to "occurred", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/nfc/microread/i2c.c | 2 +-
 drivers/nfc/pn544/i2c.c     | 2 +-
 drivers/nfc/st21nfca/i2c.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index f45e883b8730..03dd11271027 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -39,7 +39,7 @@ struct microread_i2c_phy {
 	struct nfc_hci_dev *hdev;
 
 	int hard_fault;		/*
-				 * < 0 if hardware error occured (e.g. i2c err)
+				 * < 0 if hardware error occurred (e.g. i2c err)
 				 * and prevents normal operation.
 				 */
 };
diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
index 7fde3aefae70..edafa1709f95 100644
--- a/drivers/nfc/pn544/i2c.c
+++ b/drivers/nfc/pn544/i2c.c
@@ -169,7 +169,7 @@ struct pn544_i2c_phy {
 	int run_mode;
 
 	int hard_fault;		/*
-				 * < 0 if hardware error occured (e.g. i2c err)
+				 * < 0 if hardware error occurred (e.g. i2c err)
 				 * and prevents normal operation.
 				 */
 };
diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index a4c93ff7c5b0..e760d1813edf 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -66,7 +66,7 @@ struct st21nfca_i2c_phy {
 	int run_mode;
 
 	/*
-	 * < 0 if hardware error occured (e.g. i2c err)
+	 * < 0 if hardware error occurred (e.g. i2c err)
 	 * and prevents normal operation.
 	 */
 	int hard_fault;
-- 
2.48.1

