Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194317;
	b=yqajouDAzpHdpfzvHLxUavN6LyOoGWNaSXq/MAVBfvdmAX00fLRQslBxtY+Eg/j8/q48
	 QSantv9fvX1WGHpKE58IUJ25/qjDgfSEDLUtIy71I04DT/3aRYfeK//vNMWzTqz1ALKBZ
	 oVnC884lJylE8cDLMaew0zmvQzhyVI9QzFc7MJudExU+aq4ogemPyC00u0ZikBEC5DD9L
	 DBVO/U/oIUILiz28WjdE5E+w7qddgdXISwBW/mMTF0NwOFUvD3fAhWSlO8XVfCGjJyg/X
	 sb1UbyoBWs/u9jJOWg2eIwjMFfkV3CPcdLCJoKEvZ6VvSm1M+f/vqyjV1SOItQvSLtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194317;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=B2/G4e6cQEPEp/1S6diOduUyv1Y7Tt120AqNMXCf9rs=;
	b=bQ6Sxbe4gXxLleeDX490qAPnGsmFovRaWvAzsKRHYjBLUFu4RBKSFWEm9pMmegmmWBKu
	 mXEF/GtO6gzLYpbrjxwUuYektzgknTfw9jBya9etSI+GlYFD8IVfsl+1ImSyasdvEcmrA
	 GsByEkZi/e6iRkBN00Jb3MjPbtDYZw7lxZeNcn/hmqqWFWbPMamP2ettta6TJTkxndBtG
	 xN231Ug8fiQxw2MHZsdndtIKbuhXVTqSEhkLIqHYhU6JNUyeDCobba8QUmOtKwn8oRbeb
	 FieMj7i2X1SDmKyppwRB61e3+1IhN9P5gu+WeCpmRdIRWa6E1KiA3xcC6gFJKBsC8hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oLQsMsQf;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A43606A320
	for <oe-linux-nfc@lists.linux.dev>; Mon,  9 Nov 2026 03:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A43606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oLQsMsQf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=oLQsMsQfTmQ9ALgXqG41DbOBy1tORDEqNQu6msD4mTQsp1zV3MBrs4w5wtnyMLNJRuGaedyTbG/zU
	 rHjfBTOUgg4CzkvcwWB8CIaDvbqAbrNCiGx33E1FwpR/V+8epErZEaHaC1YKuy77UYi9iKW3WT72Ya
	 ToVdiwOf/fUARHsw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af13b88b12-8c226;
	Mon, 09 Nov 2026 11:18:34 +0800 (CST)
X-RM-TRANSID:2ee36af13b88b12-8c226
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.73] (unknown[223.108.79.102])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af13b884a9-7f23d;
	Mon, 09 Nov 2026 11:18:33 +0800 (CST)
X-RM-TRANSID:2ee56af13b884a9-7f23d
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev@vger.kernel.org,
    oe-linux-nfc@lists.linux.dev
Cc: David Heidelberg <david@ixit.cz>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Thierry Escande <thierry.escande@linux.intel.com>,
    Samuel Ortiz <sameo@linux.intel.com>,
    Samuel Ortiz <sameo@rivosinc.com>,
    linux-kernel@vger.kernel.org,
    yana06070@163.com
Subject: [PATCH net-next] NFC: digital: fix target leak after Type 1 Tag discovery
Date: Mon, 09 Nov 2026 03:18:32 +0000
Message-ID: <20261109031832.37642-1-yanxia@cmss.chinamobile.com>
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
Content-Transfer-Encoding: 7bit

digital_in_recv_sens_res() allocates a target for an NFC-A response.
For a Type 1 Tag, it calls digital_target_found() synchronously.
nfc_targets_found() copies the target into dev->targets.

On success, rc is zero and the callback skips kfree(target).
The original allocation is lost when the callback returns.
Each completed Type 1 Tag discovery leaks one struct nfc_target.

Free the target after digital_target_found() returns. Clear the pointer
to avoid freeing it again on the error path. Keep the target for other
tag types, whose discovery continues asynchronously.

Found during a code review of NFC-A target ownership.

Fixes: 2c66daecc409 ("NFC Digital: Add NFC-A technology support")
Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
 net/nfc/digital_technology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/nfc/digital_technology.c b/net/nfc/digital_technology.c
index ae6487c10a25..2d52e390cc67 100644
--- a/net/nfc/digital_technology.c
+++ b/net/nfc/digital_technology.c
@@ -510,10 +510,13 @@ static void digital_in_recv_sens_res(struct nfc_digital_dev *ddev, void *arg,
 		goto exit;
 	}
 
-	if (DIGITAL_SENS_RES_IS_T1T(target->sens_res))
+	if (DIGITAL_SENS_RES_IS_T1T(target->sens_res)) {
 		rc = digital_target_found(ddev, target, NFC_PROTO_JEWEL);
-	else
+		kfree(target);
+		target = NULL;
+	} else {
 		rc = digital_in_send_sdd_req(ddev, target);
+	}
 
 exit:
 	dev_kfree_skb(resp);


