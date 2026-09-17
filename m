Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A2A5172E1
	for <oe-linux-nfc@lists.linux.dev>; Thu, 17 Sep 2026 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663124; cv=none; b=MrB1XEzNIKXZqJLWipz/s7hfInt6Y48RG24/tfbW97mOUZXd3G7q4/jL10nZpsqyYP9N2ILiZCZn7fDcH0FkxYxEAhWmclG90QGDEARxnFF0uLWJM6JHMb/l5wl//eb/Z6sSUu5dyZEZiopU8jyjLIEDazU9UOOuR7colmEFSck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663124; c=relaxed/simple;
	bh=fr/IkdQohotmR5vD72R1lIjCkrdugKGtA9TVKxwfkSA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I/akGLM50tRJz+7/X0PKu7SOsKaoIcT4vsAsvn7XrvUUCYrLsd497MTx5kC3rsyvSEMAF8EFhFktheohNiLXgCQZEDC7It3QnIkM6C1uyhS2yLSQqYAIV5ASiAPzUqPN7qVJNTvhGZq851T5AvSGkFiJ+KnuiNJOGOnahMupAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACnEDuMF6xq4KKECA--.624S2;
	Fri, 18 Sep 2026 00:38:36 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: davem@davemloft.net
Cc: david+nfc@ixit.cz,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	linma@zju.edu.cn,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	pabeni@redhat.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] nfc: llcp: Fix local use-after-free in nfc_llcp_general_bytes()
Date: Thu, 17 Sep 2026 16:38:36 +0000
Message-Id: <20260917163836.2162706-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACnEDuMF6xq4KKECA--.624S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWUAr4DAFyDur4xur17Wrg_yoW8GFW8pF
	13Gw15CryjqFWxAr42yr48uasIk342kr4IkayUA3WIkrnxXwn3CFy09ryvvr15KrWkZFyx
	AFW3Kr1UGw15ArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB01xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
	vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x02
	62kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr
	1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU5byZUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgANA2qr889V6gAAsK

nfc_llcp_general_bytes() drops the reference on the llcp local structure
with nfc_llcp_local_put() and then still reads local->gb for the return
value. If that was the last reference, the local structure is freed and
the read happens on freed memory.

Capture the pointer to the general bytes before dropping the reference
so the local structure is no longer used after the put.

Fixes: 6709d4b7bc2e ("net: nfc: Fix use-after-free caused by nfc_llcp_find_local")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 net/nfc/llcp_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index db5bc6a878dd..d0f17fbacfee 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -638,6 +638,7 @@ static int nfc_llcp_build_gb(struct nfc_llcp_local *local)
 u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, size_t *general_bytes_len)
 {
 	struct nfc_llcp_local *local;
+	u8 *gb;
 
 	local = nfc_llcp_find_local(dev);
 	if (local == NULL) {
@@ -648,10 +649,11 @@ u8 *nfc_llcp_general_bytes(struct nfc_dev *dev, size_t *general_bytes_len)
 	nfc_llcp_build_gb(local);
 
 	*general_bytes_len = local->gb_len;
+	gb = local->gb;
 
 	nfc_llcp_local_put(local);
 
-	return local->gb;
+	return gb;
 }
 
 int nfc_llcp_set_remote_gb(struct nfc_dev *dev, const u8 *gb, u8 gb_len)
-- 
2.34.1

