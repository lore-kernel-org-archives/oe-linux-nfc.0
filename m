Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792857500;
	b=TnoZw0kkUfMJjEhxtEpokqkawspSpGi26rJ87NkcOFX3gi9JrNTrS3fqRDQ4Wdn6wIf9
	 oxwUXfktyfGpTLPlVmntMaRhhb+W0vVv/id0jbT/1IhEwy7Q+WEoxKnE6lYkP6XvcEho7
	 fI0MPU98I121QoZnTpJugVDnYroZ4fjln10Sfibhr8RaD5yO+iL4BM01dvfV1+flcL6N/
	 HpRbOHO6vDWxvilwhjj2F5jfN1qzblElZldpIufezJQJSSQzEmYIEM5BCU1Irbxd0iEOX
	 uXST0GHh9vy1IsWr0TQHrzviFzDiij8oBZJrJ5YxCTgySMrkkrkRtHw1yz5Y7JibWyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792857500;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=0XCAGx2bOriDMKFK6WECtFhwum72Skqwv36T60Mx0gk=;
	b=K3eyqL6kxawMbOYutVklX+oiVwlbtF44mrh5kkiiWWSwLEqO+EhjgAP9Cc9QzJo73V34
	 qlNfNa+Q3gLA4ha8LXqTPwmskFYOJ5nTBSiilBtWswEsW/eZBPLzvytpaslnbGQyDDtCR
	 Vnj6szVACP38ysaLRzlqHYOvwghweLhlX5YPI0VXlZOWSDEK2Ds8QTafLB/aM0ZKHurX8
	 a1t+3BFRENTt8EIZCopjvj9/Rdh+E1RNQZEXXr8il/ZWfYRtPmOjq2SurjVQTC5/1GaFL
	 5WQPiUhT+pIvLhDi3bnTEF87P86R7NVn+tEAY73A7Dl7j4uUo+4ospcnl0qnp1bWb4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=LSNXuIjM;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1E606A31B
	for <oe-linux-nfc@lists.linux.dev>; Sat, 24 Oct 2026 15:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2A1E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=LSNXuIjM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792857488; bh=0XCAGx2bOriDMKFK6WECtFhwum72Skqwv36T60Mx0gk=;
	h=From:To:Cc:Subject:Date;
	b=LSNXuIjMhPowfMjNkjBAjVhjvS9ZhiMf0LznNdG0UW7DluRJiddz+0hb3xDvbdsZ0
	 u0vfdcVoyQv/L85TuEjtWdfeZkqH5Fg3XzuRDRRNpIels9RZGCJQi/INDxY4LwIL33
	 34A0qbqvfu4xx1X326tY9pKNWUvpyHTQTgub9tXk=
Received: from [172.18.4.77] ([111.31.227.58])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id E853664D; Sat, 24 Oct 2026 23:58:05 +0800
X-QQ-mid: xmsmtpt1792857485trpohvm9g
Message-ID: <tencent_634C55A23C7CCCA3985283BFED46A69C9E09@qq.com>
X-QQ-XMAILINFO: NAuAIaytDrXpfqeAdLB9n2hUhmH5B/9HqduOKjQk+sum2Wqd3rwHYYe2bwY0uD
	 tjjWgZu474s1QaDQV1AiM4gq/cge6F+XAnezTOm7F5mmsKO+vZ81XIeDrIU9w0hrO0MNwO3jryK1
	 8/WEoafeFsaWP9rAa0bC7n5Td1jjxauZw2uK0OvZET1fOt5TuTEdGHb/a12UCfc+iP8W+QQHJWdi
	 QETtN8AXJr1hl1fzl/mtDaG6ibn03jsWYAVAKPagiCUzZawEHsKZhXlT0loAz0wTCZ9P3cmG5twP
	 FBX6e0nttwJu7WCOBMSxMdaxbBOYMd/8io/QTJMk0IYkeLlL/K6c4rOWE4WEZSTLjMPNHiEu7WqJ
	 gzAcNCyM2nH+7BsF8WtLhG6bWVCxYhIRgja0qlNCQzpXmjID6xRfL7FLsABDbRl2rYEaRrNXiiPh
	 jStIdBec/8UvnDcUmIH8wOF1fFh+BWxdv7yhN7O3pcsOCbfsmwMCa1iPe7i/iuu0oQQvIfzxQoYr
	 la9+3BuH9vpqVHYddTQ4igHhRdJ8WmvhnrHH/j7IVLoHM2hsNG1Prvewy7+yDJr3eptDsh/3yPH6
	 6+cn6sSyS1wPfgDhhQGmkvc5rRt5d7sxnOWVd9AJnF52603SMbtX8rd9FI+5PH/2I5RavdFB22Vt
	 eYH2FxTGLzsfHdL/dLSAlZRSG8+za5+yrFU0ExT4JP3C11gpHzAlr8F13zt2mTU4ywIgJkFKFTMA
	 jByS1ZNqV0elhg74IceCAOyGSUVLrkCaxKRBva24JHyldBQhvi6U2OLmiA0MX/m7u5jJHL1sP2ms
	 ClLAXo+Z74sx8xJKtI30xGq5ND9VQPaZHvcvDNutY5OyVPVGkVUtO2FSYahX8+69LCzS5Ttq17Gb
	 Mt1UBDB37rF6pqkH0xRyiDl5KyXidf0TnqWjc1CqdI5v6bBaC9qXCuKEMmMbhhXWzQIY4V1z80jr
	 l11kGlI22aPhvUuizZhKNuNHrsumJ4mAwT9fFnzKiL2DU6TtA0ACjxIBu0Et+iYjMmybNO/cUJwK
	 75htEr4uxmz3u4rIzvHtI0jSAFw0dKI1J3V0J19jwrWvISyIcm0lC96oMyBEI=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Guikun Yang <yangguikun19@qq.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] nfc: llcp: u16 size truncation in nfc_llcp_allocate_snl() leads
 to skb_over_panic
Date: Sat, 24 Oct 2026 23:58:04 +0800
X-OQ-MSGID: <20261024224500.73652-nfc-llcp-yangguikun19@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi David,

nfc_llcp_allocate_snl() computes the SNL skb size in a u16 while taking
the TLV payload length as size_t:

	static struct sk_buff *nfc_llcp_allocate_snl(struct nfc_llcp_local *local,
						     size_t tlv_length)
	{
		struct sk_buff *skb;
		struct nfc_dev *dev;
		u16 size = 0;
		...
		size += LLCP_HEADER_SIZE;
		size += dev->tx_headroom + dev->tx_tailroom + NFC_HEADER_SIZE;
		size += tlv_length;

		skb = alloc_skb(size, GFP_KERNEL);

The addition silently wraps when tlv_length + the constant part exceeds
65535.  The caller then writes the full tlv_length bytes into the
undersized skb:

	hlist_for_each_entry_safe(sdreq, n, tlv_list, node) {
		skb_put_data(skb, sdreq->tlv, sdreq->tlv_len);
		...
	}

skb_put() detects the overrun and calls skb_over_panic(), i.e. BUG().

tlv_length originates from a control-plane request and is not bounded
anywhere on this path:

nfc_genl_llc_sdreq() walks every NFC_SDP_ATTR_URI sub-attribute of the
NFC_ATTR_LLC_SDP nest, builds one TLV per URI and accumulates its length:

		uri_len = nla_len(sdp_attrs[NFC_SDP_ATTR_URI]);
		...
		sdreq = nfc_llcp_build_sdreq_tlv(tid, uri, uri_len);
		...
		tlvs_len += sdreq->tlv_len;

	tlvs_len is a size_t, so the accumulation itself is fine; only the
conversion to u16 in nfc_llcp_allocate_snl() truncates.

Reachability: nfc_llcp_build_sdreq_tlv() caps a single TLV at 254 bytes
(uri_len <= U8_MAX - 4 = 251, plus 3 bytes of TLV header).  The only
limit on the number of TLVs is the netlink message size, which
netlink_sendmsg() bounds by sk_sndbuf - 32 (212992 - 32 by default), so
a message of roughly 66 KB is accepted.  With N SDP attributes carrying
251-byte URIs (256 bytes each on the wire), N = 259 yields

	tlvs_len = 259 * 254 = 65786
	size = 12 + 65786 = 65798, which truncates to 294

alloc_skb(294) succeeds, and the second skb_put_data() already walks past
skb->end.

NFC_CMD_LLC_SDREQ is GENL_ADMIN_PERM, so this needs CAP_NET_ADMIN in the
netns where the request is issued, plus an NFC device with an activated
LLCP link (dev->dep_link_up must be set).  nfcsim provides such a device
from software, with tx_headroom = DIGITAL_MAX_HEADER_LEN (7) and
tx_tailroom = DIGITAL_CRC_LEN (2), which is exactly the constant part
used above.

Suggested fix: declare the accumulator as size_t (or unsigned int) and
let alloc_skb() fail cleanly for absurd sizes, e.g.

	-	u16 size = 0;
	+	size_t size = 0;

The same u16 pattern exists in nfc_llcp_send_symm() and
nfc_llcp_send_dm(), but there the payload is a fixed 0 or 1 bytes, so
only nfc_llcp_allocate_snl() is affected by a large tlv_length.

Checked against 7.3.0-rc7 and linux-next (2026-10-24); both are
unchanged.  syzbot has no matching report (its NFC coverage shows no
llcp entries), and I found no prior report of this particular overflow
on lore/marc.  The earlier SNL TLV work (27256cdb290e, and the follow-up
"bound the remaining LLCP TLV parsers to their buffers") addresses
out-of-bounds reads while parsing received TLV lists and does not touch
the size computation here.

Best,
Guikun Yang

