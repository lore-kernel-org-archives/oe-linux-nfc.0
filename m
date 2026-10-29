Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315895;
	b=5dGud3sxY4u9TP4a73bOv2ograPKUUA2Aa6nASpl7Y88aXZebZ/YjhQGcbf5tzGdlQFu
	 KkmdWuNVoZMpmLaRcYKgtZGy3XN5evHLueC2XfAfY0gRafIrvfXXCi9Nj+alE0zH+TcYL
	 yb2+sZC3x5SqmoZm+Ntqq5HgekJwZtBiB3ZJWbwhvZj+fx2t+YKMZ7toEn/vCrGVoY+n7
	 KRe0h+69LE3GVv7XNn4XP3vWZJlJS2JtiSXcTYBhjM6hvdsWUYJpIWcayBd6K+FtMNFc2
	 k8j92E633nrWOP9NJ+hFrg1dH3t/qTqJLWGxw5cL2pRpFTYj2nizReXsBfmRX/WFhDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=lM+aGMHQoGHm+tWBHiCUU2JkCdwvd5cdpFbqD9BSPP4=;
	b=OSpP86NN1F9+dTEYaTtORML744p03AG3h0EFnMfsNMfMSOyvzVF7L417lZcxL2VY8P47
	 4z4G4pt/N+9dPJPrWgUBokCeuCm+xPDwtJA4A6zPesgCGsJCMXfR+ssQ5vPsjPwgagRBz
	 RkN+8m0Kl94mA65mP5KoJIcTISD4S7DaymlwOHAt6vkXNCwbv3VVlr5+vVFNNBgWexATP
	 RYPFtRf+bLfYFeh+Xh22rH0TjjUZdBsOHLaR6uxOAmoxUHLeqHyrkwG4COaepFVPAn6fV
	 nlJzS7wi+DmIsJS5Nj//R5+wQ6ZZFlRrIUoJdDbxYXsjk2vssnLu13hdtA4uQs8MSDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOh3GeB8;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D24606A31F
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 23:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90D24606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOh3GeB8
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-988bb309c2bso79714241.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315894; x=1793920694; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lM+aGMHQoGHm+tWBHiCUU2JkCdwvd5cdpFbqD9BSPP4=;
        b=uOh3GeB8xUUWlUPzhJmiSQNBKMFrrImZXSuEK3dbtiwNiLbTsMGzR3EEBToQE/2kcS
         5LQozF/zLMDPSK0AgxpSB8w8ymRL011jok83qZrvcMIGRXl9wRpvkQD6tLCXAXto4E10
         jQKixuU3lqLEyMy7ujZVPjj9nMu3CbGJo7p9dovTAfhyf9GvdukCYBJ9jmMoXrpPEQU9
         wiW11vOCWF/YHCCO9kgxQ3dvmtcN3S+eIrFtb9AeHUEnm8K2U7/BDdIP0FBI1o32j8ZJ
         f6JTlImbN2cs9g091s9f+SL2sqYUHNBlfprTEQs7ZHuQEyx553U9pZEzmu7627NS/bIx
         9DTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315894; x=1793920694;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lM+aGMHQoGHm+tWBHiCUU2JkCdwvd5cdpFbqD9BSPP4=;
        b=hwfYP3KXf69OPiZSy4db1qq9Ci896chaaW9g/N5FdElJKiMq33cgT3HE29dp/Mf4Jd
         CUFhYAI9rgUwXH8Dcth6MBf3MV6oMjaMtlzGJvM+qABXpV5X9H0LZMwnPcDBbqbOvyst
         lcikSE3L9AdtqupD6UaNzNVBvOonO6Z3J+AwFdIg9cktJWD/H38GvApnwRCAUSm5QfX7
         n4TfBGCAQU7FIWzZRMPLguKAXeCAUp1UANU1B/K3/EFdklLyHDcTNT41AtsMnMbwtUav
         bBDSTYeU2b8B6H1foT7RiF+PsZwnigeyoyQhDdoER2d/ZU5gqcJ7SUJzmkRA5per0+QW
         Ubyw==
X-Forwarded-Encrypted: i=1; AKwUvBzXMIxXIkx7Em7MHzyFWH3+QD7bSRGZ9g+dHEvPevtAz+JpF3+1BV1Fn8pO2UorDIAJgVEK4QT23OG9q5I=@lists.linux.dev
X-Gm-Message-State: AFq9FYJuNrj9aGCxHE6VYdoo1zqGlVF/1CzIu0MwYOmurxnaXm7EEMH4
	f8//3ghPnV3aUH7EZoHaRDHn5W609sNyAuwa85uKAVu7u+eSharsMGRh
X-Gm-Gg: AYBFou2T42vDgEItJHcxRpIsMbTpms9uW/zrAcn+16JQ2SFezlFxfiLilvi2i/f1wG1
	dDzg7npWTkFdOEpBqen5KCsW5xSt4c5SfmWLIHHcBxPsX2KiIYMdDOPLgr5fTmyS4OIb9/HMATY
	YQUu2IZURtZ5WMbPNeQvxJ0EPm7rAk2ALA3Pm/KcfJlVP9dI/FEp3/ClIme4cG4Wt/P4cGfg9dO
	hkNfNhVJH6Hl7Fig57rRxGryXKt0JZZIxiWUMPiQKejjwWn+NhyyhjMgPOfEvJGFJKhaB5zMuJz
	W6IJUABHVwAsdMl70kXvC/AuDreZ/or9HcjOJrjPBrGfg1zKZw3XY4jtsRBNuU9x5VsnN8TPjqV
	Acv2UoN34FmNRrQWa4MjE70Q/r8mjESm7GLiRrlvOK7G0diyZQdj5+3yNj0xVCJlU7fSqGi7V03
	cuDSCg6VKmMGsyH1zZ7y5ERSTTdY0ReD0YLdC6Auwm9r459A/xpmUkSKWEh9X/tUii4kaM8AdzE
	joI3y6AkVM/7gDehxtuhjwyIZiBPwVfnRMMKMfzoR/iWqYAU5xrRXWyXb645i66Pn6YEkL/ZXQU
	ZwRNrQlyDBgSsVgX+gi0ePcSiNt2Y1bv6GqTHEcrp3ZRoJTQn0gMkJolEZ5ZivQ2E/A+g+/kba7
	75/0kBZ0ryIwm
X-Received: by 2002:a05:6102:3e85:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d072bc74fcmr439527137.13.1793315894465;
        Thu, 29 Oct 2026 16:18:14 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:18:13 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 4/5] nfc: st21nfca: validate pipe ids in
 st21nfca_hci_load_session()
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.2945646231359516234@gmail.com>
In-Reply-To: <179331585573.30322.4049957541187612575@gmail.com>
References: <179331585573.30322.4049957541187612575@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

st21nfca_hci_load_session() gets the list of open pipes from the
controller and, for each pipe id in it, asks for the pipe information
and records it in hdev->pipes[].  The pipe id is a byte from the
controller and is used as an index into hdev->pipes[], which has
NFC_HCI_MAX_PIPES (128) entries, without any check.  For a pipe id of
128 or more that the controller reports as open on one of the known
gates, the gate id and the controller supplied host id are written past
the end of the array, over the rest of struct nfc_hci_dev (including
the async_cb function pointer) and, for larger ids, past the end of the
object.

The pipe information response is not length checked either, so a
short response is read past its end.

Skip pipe ids that do not fit in hdev->pipes[] and responses that are
shorter than struct st21nfca_pipe_info.

This was pointed out as a pre-existing issue by the sashiko review of an
nfc_hci_create_pipe() fix.

Link: https://lore.kernel.org/all/178952042575.22033.9676833200303972344@kernel.org/
Fixes: 2130fb97fecf ("NFC: st21nfca: Adding support for secure element")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 drivers/nfc/st21nfca/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index b5c1ca3ac..88856c26c 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -147,12 +147,20 @@ static int st21nfca_hci_load_session(struct nfc_hci_dev *hdev)
 	/* Complete the existing gate_pipe table */
 	for (i = 0; i < skb_pipe_list->len; i++) {
 		pipe_info[2] = skb_pipe_list->data[i];
+		if (pipe_info[2] >= NFC_HCI_MAX_PIPES)
+			continue;
+
 		r = nfc_hci_send_cmd(hdev, ST21NFCA_DEVICE_MGNT_GATE,
 					ST21NFCA_DM_GETINFO, pipe_info,
 					sizeof(pipe_info), &skb_pipe_info);
 		if (r)
 			continue;
 
+		if (skb_pipe_info->len < sizeof(*info)) {
+			kfree_skb(skb_pipe_info);
+			continue;
+		}
+
 		/*
 		 * Match pipe ID and gate ID
 		 * Output format from ST21NFC_DM_GETINFO is:
-- 
2.43.0

