Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759288;
	b=LeLJv1aNrrFGY85Wo1ojpth2vLTC/fcYwCcUIkbb4sP+msFvgiTyrs10CAG3zyDHVtan
	 JE743ziKGW4yJbcBpBL0d94gru2BCNvBpMTUkKZUrvyszi/2qpIyAhCsnALtSCRI6+dR6
	 NnogYbVnQrq/DRgWmQjm9Vv7JsJypHz/hx/1h08Y3pkll3aCBBFQwAdAlGaWhO0KqVElG
	 oYgibb+tQjQgy979Rz56xdbGOzx5++wMWwifZOYpqTrreaDQgRFtOqto5Ok2qqeqitys2
	 WaAbogRrH+e5/w1dsoOiXMiISR3UopfJLrcBtQ7yiwJ3uvecvP8cZRl6RxwWOuabRjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759288;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=OHOyST0K68BpqYUM7L2Y2DAO0AOJ5NknSjGQWburvEI=;
	b=m4S0J804FZNljTYGg+GEQNN3auYdFT0Dhf6zwPTuTqHo8mCNyZSRAztafUg0yS4govAb
	 +xi2LDRS8lSV6b99iWd1E1Z9UHVov2zwvZexRqRpYLiccPbuVATTrkNf+yEid1ABi1ae+
	 ICZ2SJImG702hVjR1tzf9cjA0M3OXxbFqWPmaz3SSN6Qch8d+A13aftqxCEZ446OZEfeY
	 LX+LZqyjvDmaOobNrN0og18Ll4lLmuO4BkMJvk7Iph5va9Z9L3fr6itBVsMy5JECGnhZD
	 88eIHA8zrpaWt5cVuysSmUL7CLJdr6is46nYvh/armERro2VJA6Qo4xOr0Jya/Jug9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF59D606A32D
	for <oe-linux-nfc@lists.linux.dev>; Wed,  4 Nov 2026 02:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF59D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAA3YPoymOpqtZs+AA--.30158S2;
	Wed, 04 Nov 2026 10:28:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: David Heidelberg <david@ixit.cz>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH] nfc: llcp: put the socket reference on a refused connection
Date: Wed,  4 Nov 2026 02:28:11 +0000
Message-Id: <20261104022811.1484216-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowAA3YPoymOpqtZs+AA--.30158S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar47CF1fGw1rtw1DKw1xZrb_yoW8Gryxpw
	nxt3W2k342qF17Ar13tF47Ja4DCanxArWxCFWUA3WIv395Wr4fG3WIq390qr1qyFZaqa47
	Ar9xKr1UW3s8A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26F1j6w1UMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07b7pBhUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMBA2rqY-nHVgAAsT

nfc_llcp_recv_connect() finds the listening socket with
nfc_llcp_sock_get(), which takes a socket reference.  A socket that has
been bound but not yet put into listen state is also linked into
local->sockets with dsap set to LLCP_SAP_SDP, so the lookup can return
it.  In that case the state check fails and the function jumps to fail,
which only sends a DM; the reference taken by the lookup is never
dropped.

Put the reference before jumping to fail on that path.

Fixes: a69f32af86e3 ("NFC: Socket linked list")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 net/nfc/llcp_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index 74bf817007cf..92fd7e29ec8a 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -949,10 +949,15 @@ static void nfc_llcp_recv_connect(struct nfc_llcp_local *local,
 
 	if (dsap != LLCP_SAP_SDP) {
 		sock = nfc_llcp_sock_get(local, dsap, LLCP_SAP_SDP);
-		if (sock == NULL || sock->sk.sk_state != LLCP_LISTEN) {
+		if (sock == NULL) {
 			reason = LLCP_DM_NOBOUND;
 			goto fail;
 		}
+		if (sock->sk.sk_state != LLCP_LISTEN) {
+			reason = LLCP_DM_NOBOUND;
+			sock_put(&sock->sk);
+			goto fail;
+		}
 	} else {
 		const u8 *sn;
 		size_t sn_len;
-- 
2.34.1

