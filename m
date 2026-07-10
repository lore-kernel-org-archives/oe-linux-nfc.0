Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206EF3AFCEF
	for <oe-linux-nfc@lists.linux.dev>; Fri, 10 Jul 2026 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783663991; cv=none; b=HsNgD6Fb4CPx9UxLy278KyMiPu6F/qzxXopf68NCBMjXV0E6UOh/OPbEWqaB2rXOCgzV+knfs4Csy6YFeYrlg0HlUIFMNoKUNkh8vrWcYMWqaTaLjwp58wzN1UCuFgucXLRqRHNpNqHyY+Q3dtsJRLYVK0b4CuNwJuV5shNzQpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783663991; c=relaxed/simple;
	bh=s4noOQ8Cks+3eRUB2ylzGQ8oWydfQD5cPB3Yhp8RbMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M2wjFK4EMLYJZsjiBXgbxRl4szYVYTxq4bT6CUA6pubf8aTncdd8Uxw4nV9KPUITIJvv0lRZ6UORacIRrZIL/SrWmUuv2NsDJ9/RH+E5u0x5Qpn0um8FlArrv3hOJ19/Z85yP+C/fSIiDXraNjIA1TUrD9XZrpjzQH9Fh98jkko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 662a2f3c7c2611f1aa26b74ffac11d73-20260710
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c25ac138-073c-4421-bd7d-630fb60023c1,IP:0,U
	RL:25,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:50
X-CID-META: VersionHash:e7bac3a,CLOUDID:fdb9896a82871974584b439cf41aae64,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|82|11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 662a2f3c7c2611f1aa26b74ffac11d73-20260710
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 779862429; Fri, 10 Jul 2026 14:12:58 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: David Heidelberg <david@ixit.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH net-next] nfc: digital: Do not dump a NULL response in command completion
Date: Fri, 10 Jul 2026 14:12:54 +0800
Message-Id: <20260710061254.80975-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

digital_wq_cmd_complete() dumps the response data whenever cmd->resp is
not an error pointer.  However, a driver can legitimately complete a
command with no response skb at all.

digital_tg_send_psl_res() is the only caller that passes timeout=0,
meaning no response is expected once the command has been transmitted.
On that path trf7970a completes the command with

	trf->rx_skb = ERR_PTR(0);

which evaluates to NULL.  IS_ERR(NULL) is false, so the NULL response
passes the !IS_ERR() check and cmd->resp->data and cmd->resp->len are
dereferenced whenever the debug print site is enabled.  The driver
guards its own dump with "trf->rx_skb && !IS_ERR(trf->rx_skb)"; the
digital layer is missing the NULL half of that test.

Use IS_ERR_OR_NULL() so that NULL responses are skipped as well.  The
callback on that path, digital_tg_send_psl_res_complete(), never
dereferences resp and dev_kfree_skb() accepts NULL, so only the debug
dump needs fixing.

Fixes: 59ee2361c924 ("NFC Digital: Implement driver commands mechanism")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
A separate cleanup patch, "nfc: trf7970a: Use NULL when no response is
expected", replaces that ERR_PTR(0) with a plain NULL.  It does not
change behaviour (ERR_PTR(0) is NULL), so this fix is needed either way;
if that patch lands first, read "trf->rx_skb = NULL;" above.

Link: https://patch.msgid.link/20260706075743.564658-1-lilinmao@kylinos.cn

 net/nfc/digital_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
index 7cb1e6aaae90..18236221d898 100644
--- a/net/nfc/digital_core.c
+++ b/net/nfc/digital_core.c
@@ -127,7 +127,7 @@ static void digital_wq_cmd_complete(struct work_struct *work)
 
 	mutex_unlock(&ddev->cmd_lock);
 
-	if (!IS_ERR(cmd->resp))
+	if (!IS_ERR_OR_NULL(cmd->resp))
 		print_hex_dump_debug("DIGITAL RX: ", DUMP_PREFIX_NONE, 16, 1,
 				     cmd->resp->data, cmd->resp->len, false);
 
-- 
2.25.1

