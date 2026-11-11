Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391187;
	b=txU6MY3a8UdqPAEBm5a6qI0JFtdZuV+6S9qgkEfShtn2pyDwR/fTBzLTgqRxc9RWKpSx
	 GrqOr3A3pQVD9qT4tse5Kp4du+2wzgf64kURgzKaq1gL1ZAbXECBxSPHhP+uhNpvEVDwa
	 5qlnRTK91vaXwuI0xCY91LeYszzmNAvGWTXRdtwtGvq8cuhbpkmgbMa6dpC08H0IqfI17
	 QT2H8gQLKMyt+wJucCu5mEbyvaDUcmGDwymkYHjP/WzgUVI6GA6z6gpnttQ/1Kha8FD/V
	 pyNOUV1lggzWknGbjnRF3xhp4/56dGIFeCeQI6taUQwRdC32pKf06h+yqKI5gup0lcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391187;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=59wVNw1zJzlvwp3L7uQ2Ik+N71jZ01U5OCjzBS7fR5E=;
	b=QbvAyhlsTAPRBREwLxcVTxmFVvMLYpFHvoMqDOW7l4VgE7qNKsT2HaNzDFm1HfkUMJy5
	 9qTzfwCcVnKhfTao/XJ8og1WMXpsFHIi4h6dFLsAQetLjsIrPXh+qkC28fLGJn+PHovdE
	 M9VkNEt5vbXRUmh/xvcZlAQiQwVaItYAuHMFg+WmohQCJB/OjPoIUBt8x/rp6XDRTkhHf
	 mfEXYLfh6NAjKaMHG5VbR796MfG/bg5/AImDUYGBiTkZNe7KXClCyfGcZNX1pdfa+jXtR
	 YXw7mUSCZoChoB4wX9WfIED4m1rXlyoQasvM/ki9PpOJaSEsUFu8eJNvie9AgRh4q1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b="bkn/ZI3d";
	arc=none smtp.remote-ip=117.135.210.6
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C42B606A324
	for <oe-linux-nfc@lists.linux.dev>; Wed, 11 Nov 2026 09:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C42B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=bkn/ZI3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=59
	wVNw1zJzlvwp3L7uQ2Ik+N71jZ01U5OCjzBS7fR5E=; b=bkn/ZI3dblTpkgy3P6
	9jS9l/FQc4vU68kcVkgnZpqa2Q/qqz+dibQhfSO9ayedxmn0CRoJUyDH7kgIqnQE
	V3gYK0yuXubWgi4ipyTnrNva1pvd6IKsZ+febHUhUKdQTahgxapKlG+WOJbXr1+0
	m/XXxk59zVxCwUffDcyumicW0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDH9+1sPPRq4RJQDQ--.51384S2;
	Wed, 11 Nov 2026 17:59:09 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: david@ixit.cz,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>,
	Guikun Yang <yangguikun19@qq.com>,
	stable@vger.kernel.org
Subject: [PATCH net] nfc: llcp: fix SNL PDU size truncation in nfc_llcp_allocate_snl()
Date: Wed, 11 Nov 2026 17:59:07 +0800
Message-Id: <20261111095907.3366028-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PikvCgDH9+1sPPRq4RJQDQ--.51384S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyfCr43Xw1UKF18AF1UJrb_yoW8Zr1rpF
	W7K34Dtr90qF18Crn2krW0va4Yk39rAFWakF1jyFy2yF98X3Z7WFW09rWF934qvr4kJF1a
	yF9avw1UCw1UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlhFsUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqQ0C2Gr0PG0aRAAA3v

From: Linkui Xiao <xiaolinkui@kylinos.cn>

nfc_llcp_allocate_snl() sums the requested TLV payload length into a u16
variable before passing it to alloc_skb(), but its tlv_length argument
is a size_t and callers pass a length bounded only by the size of the
netlink message that produced it.

nfc_genl_llc_sdreq() walks the nested NFC_ATTR_LLC_SDP attributes of a
GENL_ADMIN_PERM request, builds one SDREQ TLV per attribute and sums
their lengths into the size_t tlvs_len. Each URI is capped at
U8_MAX - 4 bytes by nfc_sdp_genl_policy, so every TLV fits in its u8
tlv_len, but nothing caps the number of attributes, so tlvs_len can
exceed U16_MAX.

When it does, the u16 accumulator wraps and alloc_skb() returns a
buffer that is far too small. nfc_llcp_send_snl_sdreq() then calls
skb_put_data() once per TLV and writes all tlvs_len bytes into it,
which trips skb_over_panic() and panics the machine.

Use size_t for the accumulated size so that it can no longer wrap
before the allocation. alloc_skb() takes an unsigned int, which is
still wide enough for any length a netlink message can carry.

Fixes: e0ae7bac06cc ("NFC: llcp: Service Name Lookup SDRES aggregation")
Reported-by: Guikun Yang <yangguikun19@qq.com>
Link: https://lore.kernel.org/netdev/tencent_634C55A23C7CCCA3985283BFED46A69C9E09@qq.com/
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 net/nfc/llcp_commands.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 80a00938c869..0a3d66e6cd59 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -542,7 +542,7 @@ static struct sk_buff *nfc_llcp_allocate_snl(struct nfc_llcp_local *local,
 {
 	struct sk_buff *skb;
 	struct nfc_dev *dev;
-	u16 size = 0;
+	size_t size = 0;
 
 	if (local == NULL)
 		return ERR_PTR(-ENODEV);
-- 
2.25.1

