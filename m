Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CDA43990C
	for <oe-linux-nfc@lists.linux.dev>; Tue, 15 Sep 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476965; cv=pass; b=C4uQrxOvfcn27II0+vCYZ7G8HqwcSoXyU3il5LgCv4X/FlcnpUGMcNp3KPmysjrAb7eUXz/dfiKzenxyRU+cs4T0D6/OIoQS7rMJcIdWYNJhT1kOtckn46CXwRg7eFNGODA8UIYekZbWd8UMLlseuNzmC76cdHap+ZRAixlzxjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476965; c=relaxed/simple;
	bh=zy3iWwmrbCSpNiD1SOUACSNwfEXQHMy05KF69BG6K40=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=jbyqe1bqGaH6iEY/YY2smMCq9EaQS3Joi6XnaH2TH9gqRGyx41i8ApteKIy278PFSciQDiNXgSV7zrlnYDMekCtoEfm6O1xjyeFmLOue8SopFJorYSGpNZLVyq/Q+N4kbR+L5tsH5MDPceJ/l+BydZrKWoaXNjWuFM13ysk2Fbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7/2cFI3; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7/2cFI3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dc83so2283635f8f.1
        for <oe-linux-nfc@lists.linux.dev>; Tue, 15 Sep 2026 05:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789476961; cv=none;
        d=google.com; s=arc-20260327;
        b=dodAtMBvCo5jMkuR4NBwmVHDECbClp8SekPODicc5rKEiomHE/u0chOYBG3CkVfQ14
         H/vUCnBfEeZraPMKNjgIJyUW5pGg3oMoYGy5nTzfx6xXoM7YZfPOdGOKJ6MwlKVNxnM2
         5Nlhyt0KAascTS9RC/kWGJpGffn+uzHJzAADb7S5ZOaJgLjO9iugW40J1zkNz+yauOxc
         fQ9weUiQoWhUMMYHSuqM1oTRgIedk1BxubO/Ta7iE2vzVLptxudkPV80abhgUWG76NFY
         Kt2gpm3tijpVsCkZ/NwpHu9J0mBT/leJ6A84g6d31xT8530NenrvLp3uGAZB9RFwkr0F
         EYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=WXTV4FyY9anqTAYSFYoxXYdK7lnjO3FhMIC3LHbJUSU=;
        fh=kQkK0Bn1gDlgx4sWQJDMNHCmvRhU4/Fs/UyZuc3cYXI=;
        b=n35W2ELk22NfFJEnDNKIOEqL07Teu3MdlDqc1+dbb52DHAB6/pRXdcFiQbVLtrmLGf
         4khCEXETNUtgFscp1/3q9S10fep5S0yEY34+gFLrIjQ6ly7biqLLtzt5FvPKeOSR6c/d
         MDa2lfQuBKxC5UFt60OhyTPuDO1NcWEvM/Wxtbj6KLshNbjrZKn89dmEPaLuKW7CF1bF
         A5f4v4hyLHkeY/kWnLF6r3utAJrx8y9O6QgdYFAtZN5/VM2ru5MekThwT+WZWyo05ux5
         2HYm2T8PiQ5XuJQXsVPy0ZoqQgmZwB8R1j7AXVo9B+rRXps+oe1VO43y9bTP6etqx4Hu
         o2Cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476961; x=1790081761; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WXTV4FyY9anqTAYSFYoxXYdK7lnjO3FhMIC3LHbJUSU=;
        b=M7/2cFI3VBiiMMpWbdEDLUl0EE/uv8Q6BUYdzUGonQlY0MAHaWSAVc51qczbB3wEQP
         M5a18Uam67FWol8OloS7vwu+8UXjkCg+PRh4NfIwtDBjh+FHkXv6q77TSsKIHnz0bcnM
         k4mxvxAk0AnWTNYvd0HtGXgbi9QKfI7QijVstbiXDDmrpJZpRh7QOa9HPIiHdYRVI0t/
         3zrtad+RtNv49F/V5S6sZaRAtXG3VTr6kGs6z0QfAdyTFfqkSur2rZ8NiVIOXfLgssPH
         OzyhVhKWzA5NCBXiF0YPAdF6ZlUtX17TWjMlfFW+xaE9xH8h5WNKUPtT4fsMrCLdUeHD
         30xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476961; x=1790081761;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WXTV4FyY9anqTAYSFYoxXYdK7lnjO3FhMIC3LHbJUSU=;
        b=TOLgwW41rJx9wgKmMchpytnXNoYcdxda+x4hys5GbQRkmLU0En+8udqHPE5o9D+Dq9
         ZKsgd5pteAX6FSm1nNQ1Nqq00PqjTNyLHcQKV01nW9Y0486/baw7/tNFqjgssUfrmd9k
         LGIGoRSsFEl66FyUd8krRNKzWwkw/hZOlkQwaJdQSiUcEtVSWE8HzUBAT8bWZziZ9Wjr
         63vHAucyRjua3mybzbUEoexi1JNOu6MwNxYcc1mT7HqeXN0GuIH3m1g9PozVMiHnMjv0
         ChFeFgKkjVlMXo3onxTv4RhdU6jnYf4ismr9EmFn6RR/vEQoCZjLMt1sbhZtSJdtsO1w
         DDUw==
X-Gm-Message-State: AFuF++nFXeB2AG8Occwsc47kSFM2+uG5V4yV++tL7P7AL4umlqL4XJs4
	wxgOTc2id5GI5XYVgDH7DkNHk0PR/mGOjM3jks/+PvGHFO2wEcrIrM1uLjU7Ap+Js1vGMxUZbVR
	hh7pejn5juGJ79G/72x+OfALnITX4IrSPgHOcgR68AWlW
X-Gm-Gg: AYBFou1YjV8V0Z5n2ge0ybVvxbF6T9BNe5REof8Cqkvgh54EHrC3aTDUJZl4izQkKR3
	KbFfXkCb/CR2AlCf/KT9nbMpiIryrXE5/ZGeJfhljUz6HtVJtYQ0fHJ8RDN8KZe6QndKIvmlQpe
	XQfnMGOxhnCWc9iagzlWD5zw183n/bW7QBGyEeZvFE79tsVNboCM7R81c902yJx4+mmf9JbJiBi
	5+EQlNS2uEU7gXbQu5QhWqz89m1Kb7AcwdYSyt+kuBxJqdafsuczFCr0Wq6yIDyBQkMmCaoSdlI
	APwiXdIBa0CdrA9h8dMyX8m+bWmv5rj7kVpwr5g3bm81btIqauhh8A==
X-Received: by 2002:a05:6000:2309:b0:487:a3d:1a93 with SMTP id
 ffacd0b85a97d-4870a3d1aecmr1352224f8f.51.1789476961413; Tue, 15 Sep 2026
 05:56:01 -0700 (PDT)
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:55:59 -0700
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:55:59 -0700
From: Ruslan Vagner <rusya92266@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 05:55:59 -0700
X-Gm-Features: AcwNN1VQrcYHZ2JBxpdYbCmSv8_f-ycEOmO4PeWfzBdrvEWivfDyQY_L5M1i0jU
Message-ID: <CAF9RqJ40NjhTk7JzFJ=zQyCGofx4xgEwCX73G_+VYSiga2in-Q@mail.gmail.com>
Subject: [PATCH] NFC: fix comment typo in i2c drivers
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz, Ruslan Vagner <rusya92266@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix the spelling in comments. No functional change.

Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
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
2.54.0.windows.1
