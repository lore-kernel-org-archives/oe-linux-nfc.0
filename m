Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A94825D9
	for <oe-linux-nfc@lists.linux.dev>; Mon,  5 Oct 2026 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206888; cv=none; b=dC9AVfouZce9zlBCQ87fdNgfqWhi1XDLejypyuoAXRDpz9do1x2BYSd4d2TIDyhKTClGC6yCqdMNKdVmwoSQ93PCG2l0+b96k529GWUIps4vogUYylr7bOAzkk8YBoqtnOG+pAIPr1GaWkT0x/V5T5zbEoWShgf6cnw3c3IfIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206888; c=relaxed/simple;
	bh=akgxDLCMRWnju1F8nlTi8ruGP54ydtpCtXeCGsNTtP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uMnuAJeszR5Uw8IKOjqDAkufYbi9jKXlOqzPj9r4QcPAAb6DpeK3eVTxMEeSJBBnJcquJQyC51cJxHi2ZQVp+qu4Q+Kztx7DqN91XYRxg9CuhkdM3knXiY0bsjAT1QMcW9cXjT0sxeld10mkTQx5DCQxMaahNhM5SV55Kkzna1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbsRUXM7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbsRUXM7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso16623195e9.1
        for <oe-linux-nfc@lists.linux.dev>; Mon, 05 Oct 2026 06:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206878; x=1791811678; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UiFZMjxaNVOcwpMoTNUMbszzfHwtYL0qU2Yy5cm+FU=;
        b=FbsRUXM7kZVTKb4XwT7a28rgf6SAsX6f7fkxqiYYOR40mci7LaEbSPRrodSPFRpYIH
         2yOVOaL8/jl3CAozbOy5jGycMvA40j3ExKrtbxRpYEw7T4U1Tn9KXi/MVpTBaztBZ33I
         2M6okhMSmOt6TkD31zljn2Q1fYbcyXC8eE71wQhRWNRSGeZCzMlYUL6LWnX4R1wxgPwG
         EitW+ciP0TEEWM0zrd7ZMva4NuzQUo8sZcIEnfwYFAeFlu+BkM9sb78sVm30pidve3QK
         zqjOiiyvsCx+FeQj2yJ6l5wZ04PCwsiMI+t2tnZPiRpAVwbNiLEGwVrv8VKKjUa+Y3l4
         H60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206878; x=1791811678;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2UiFZMjxaNVOcwpMoTNUMbszzfHwtYL0qU2Yy5cm+FU=;
        b=E1SToaIEHHgThtCoSwQfZhw+SeX9uNVXD4CJKIgrcRN5Am/7+sPEpAad5QM5E+vJ0m
         2Y3LVDnrjUWtuMpToMoKe9X0g6VKME6diJOlJeuzMrHj0d6We154hHuVCuXgtT415vLj
         3EwWAMVshN/rbwqGoOcivgbCUkg3TdXFmiIQuhWqFkS2lMhF3K+SbzOHw6DvTjBj+I4E
         oU7YzDSNeI8rcDmdqJzie1B7GgxEGsilrEYBBi7QuGWBl/E4/wkqi2POuuCZWxRWumMu
         onIXClzlrqNbnQNZUABM/GTev3ON7SWbAbP7uM3rI41XbmxIfUz5SXFimAn3Kc+WPAis
         8+8Q==
X-Gm-Message-State: AFuF++lV2iMaMtEea//0eIptqPhu3uTa10Y54JqyPc4IRYSJ7c1oMyvV
	TuxReBvbjBpjcHyYPD4lhhc21rRq1bqQmM6mvDdoLHUjaC5yTNx1YzaMBFiJHy0fwxs=
X-Gm-Gg: AYBFou3ErapoPACx/uxkWLMohf0CE67a3XbEuXnGFziUDqcEiMwErt65OwxIKEe9rFS
	uNVSAY+9sD8h2Yt0KZbX5nhakXoN0QxvES+2s/4KeNLJwy2XmnebfFbxkOjUUjvJfSNpvYBUzBT
	6aTDu8wSdQxvICiWLLcopu3q2g4QMKo85UuhuT6TPbcFvssGWNBgNffz2cfT5qAJdfJk3rS6RPB
	nJqrK3ah0PZ4XUQVFenqXZBmswMOBzku9uDG0IsNLqczethVPelQtkUowhvxkJTpXAIYL8GgYIG
	m0eUtrqjXxtw+OQ61UTBSoXkefbVdXKt5Ha2jb0kifYy7Kdgv2tm6hdwktQHstO1RqGT7zts+zw
	Pp8CiHptvdLl8OTGHejGl467c8MWhPFKtzv+vWF2GmLtQFfIEJvwb1a79kAtmDdaISaZEVKCSyC
	YPhkTErP/UK2hsjMP5J0Q3Ir+lYceeEU8rR7RH/uDub1rvR0KzwWUep+QzfmPHWEaqa3Iu
X-Received: by 2002:a05:600c:474e:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a02759b67emr197566455e9.22.1791206877810;
        Mon, 05 Oct 2026 06:27:57 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16d6295f9sm260315305e9.14.2026.10.05.06.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:27:57 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net v2] nfc: nci: fix out-of-bounds read in nci_core_reset_rsp_packet()
Date: Mon,  5 Oct 2026 16:26:28 +0300
Message-ID: <20261005132742.324374-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The skb->len != 1 guard admits a 2-byte payload where config_status
at offset 2 lies one byte past skb->len.

Fix by guarding the nci_ver and config_status accesses with an explicit
skb->len >= 3 check, and restoring the original skb->len != 1 condition
around nci_req_complete() so the NCI 2.x reset request stays pending
until CORE_RESET_NTF arrives.

Fixes: bcd684aace34 ("net/nfc/nci: Support NCI 2.x initial sequence")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Changes in v2:
  - Preserve the original skb->len != 1 condition around
    nci_req_complete() so the NCI 2.x reset request stays
    pending until CORE_RESET_NTF arrives (reported by sashiko).
  - Fix NCI version labels in comment (NCI 1.x = 3-byte RSP,
    NCI 2.x = 1-byte RSP + NTF).

 net/nfc/nci/rsp.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index e20df7fa0829..8226d09c99a5 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -32,22 +32,15 @@ static void nci_core_reset_rsp_packet(struct nci_dev *ndev,

 	pr_debug("status 0x%x\n", rsp->status);

-	/* NCI 2.x reset response carries nci_ver and config_status;
-	 * a 1-byte response is the NCI 1.x status-only form.
-	 * Require at least 3 bytes before reading those fields.
-	 */
-	if (skb->len == 1) {
-		nci_req_complete(ndev, rsp->status);
-		return;
-	}
-
+	/* NCI 1.x: 3-byte RSP; NCI 2.x: 1-byte RSP, request completed by NTF. */
 	if (skb->len >= 3 && rsp->status == NCI_STATUS_OK) {
 		ndev->nci_ver = rsp->nci_ver;
 		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
 			 rsp->nci_ver, rsp->config_status);
 	}

-	nci_req_complete(ndev, rsp->status);
+	if (skb->len != 1)
+		nci_req_complete(ndev, rsp->status);
 }

 static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev,
--
2.55.0

