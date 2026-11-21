Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795260075;
	b=cqbDhE4R5XxlAfPYwqxaB2iPY1eNQXiKIErzM9KpW0IaO8/u9pMVmSxhmIm8hsm50Htu
	 m7T70bqs8vIvKHZg6lu7TISSix1AoPXb3SyTEYyDAUbxaQ9urFy7RVieMkGv36QYyfiDY
	 BgyWejixmVK/0QcD5awupxLQIkQ1xcUgIlGcNK8lWetOfVLaQ2R8aUnsJ97tN5UzZCO90
	 7f5MDqp+ORGhYUOgLWMmMr3uSu0JUqQpCdq1AzYPSpvPFINgoAerPnpjJY8uIYMvDLRAO
	 Z9BBxV0uw/sL/QrTL0CaX9IJA/Ozvc76hQILKLLL6c43JquFPEBabIyJwKEy5psNiag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260075;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=v89Ma1+8vB78QEhTByPdmvA0HsIyOPhOwYN2oIuTnQ8=;
	b=sW/u0NlG4BB1Urr/Zkt1MAjCbwGPD3dfJgJ7XfMCjBhMZ10OwdbI4B/PGkGIsU1gIpk2
	 7mgNFNPLoxUFojCJW1aoiXhocMoiwVPZHovKQLC6ewZZw1658qtBwF731RSlc9yRQva1K
	 VPmbP7ZwY6xwBUvdbv5/oUtc8SMeZTGuuqhGQMaKtMkzsYQTcq21aASp6W7Rffx56u6C9
	 k7ahn+UjgtJiy4skaVyfJ7/rlXLqTnLXYhCmemTGsrhrynnO1sUmGAy1ooFmpILpJcqyv
	 R4Jlq9/olAw7zHxjCnHnkiIhlKKv7b619lqvfcmssYJjtuWvMiiS05pfKu8XDBsmeLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBXpkRjL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C8606A325;
	Sat, 21 Nov 2026 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBXpkRjL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795260075;
	b=tt5ZkQcohIxHc6r9947MVvF/N1zEcUl6l2fkJ6zVEVf8l2SciCTUXo5XQKpbXYdaGWa0
	 xmnmNFWgqkdYxEeI6ZU+zkoLcJmrwR860RUrimxrJWrw0FmjIg2qeallGiSruLegQNPGB
	 wGoonHkQ4LslpzAyQE0/7dNLS/yYA5yaYMa0XwsDRaAp7vEHKWXxXKj3JAEaqKPnpWAL0
	 dV465XKbzQHur1V8uXBnmsMGLhRqL0dt2Gl4RTNDXMsWXBvw+1o0DZPx6m34HLWPAQ8LN
	 RS2ahD4rtrzL2XlaP1ULrLmQjyQxglmKayHN+Yl6HoGM1nU52EvI9t9RZG1nadbBZ/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795260075;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=v89Ma1+8vB78QEhTByPdmvA0HsIyOPhOwYN2oIuTnQ8=;
	b=DbLsbgYgNuTPDe+VPfqTNcrqc3p1n/4/89v3ZXPEGG7wlBRwn8cRaBFDOUfLe6b080Nn
	 4cv2XG64Oe04Cm1zQeM41d9KobDK6iCK94jLf8X7PXTeJ9O5WwR+7LsjnupSSN7rC83/i
	 +hnXYEPATbAvndlK0q2Mkitv9FBaKeVcCocZoxyyvCC0lSL5GkfPS2abxgK0nITXrDJJF
	 FoAFNwt20E6aHntkMXRL7b6hGjXlK94+OKAkxPaYl+R2x03z1fXHrq7ijwK9ruL0QgXsy
	 dXuQxVIkGymer+w0+vYZlxOPDUspD/bnY/AsJaC9SCs4FNinIgzB3fRPfZNkeFwbD5w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC7351F000C0;
	Sat, 21 Nov 2026 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795260075;
	bh=v89Ma1+8vB78QEhTByPdmvA0HsIyOPhOwYN2oIuTnQ8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DBXpkRjLQHMQAZrtkrtjmFEMrQMP8zl6HtVpPk+pntGOeuk72p67b/v0zFz3LxJCY
	 IemDI0xugsDSTSeWakkK78qibW129yDVmqYjuK/UFVI/ejj+aQs9eZSKEO0dTZ7sAE
	 JpLwnwm5NEo9tkswP6Gd/KTl5QZpz2si6dAm+qVLo/lpGydheYC4xUTJUYQiw1b8fE
	 7ENDrOaz5OHEyPvrT5sBeSKTzXfucag0X+E5AgN9iw7RBjiUSOE9MoWbbpvzcz+UZ2
	 cGKVTlV/+QAIDnMuggzO/lUECnHkXlvEiQ5t5is01Sxe2S/mDgop5xzfDV6ylwBx//
	 cnZjp/JjZn6sg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2D4C74BC00;
	Sat, 21 Nov 2026 11:21:14 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 11:21:13 +0000
Subject: [PATCH net] nfc: only send the SE_IO response to privileged
 listeners
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-nfc-se-io-filter-v1-1-a28b383a6300@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKh+AWsC/yWMwQ6CMBAFf4W8M5vQopXwK8SD1K0uIYV0qzEh/
 LtFjzPJzAblJKzoqw2J36KyxAKmruCft/hgknth2MY6Y6yhGDxpsQsFmTMnak+2u7TO+WY8o2R
 r4iCf33JA5IzrX+prnNjnY4Z9/wLFCu53eQAAAA==
X-Change-ID: 20261121-nfc-se-io-filter-34287366c0b5
To: david@ixit.cz, kuba@kernel.org, edumazet@kernel.org, pabeni@redhat.com, 
 davem@davemloft.net
Cc: oe-linux-nfc@lists.linux.dev, horms@kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795260073; l=3495;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=4d8GuF8Ba+/1/ZMaY9xY4YhAq9qRQO0d6gqeD0lMyaA=;
 b=vkTC0F29g8hXjYrSjCLZgj7pbBGIXgpOYAbITdoHdXu6dorCWCCzSy5Gn+PVloXt0hZFJ+7Dz
 5XjXVYnDubNDiwi8tqI1BKFfpI+N+eFulezEa/3aeJ0mHSYwlsVR1oZ
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

NFC_CMD_SE_IO sends an APDU to a secure element and needs CAP_NET_ADMIN
(GENL_ADMIN_PERM). The response from the secure element is not sent
back to the requester, though: se_io_cb() multicasts it with
NFC_ATTR_SE_APDU on the "events" group, and generic netlink lets any
user join that group. So an unprivileged user can read every response
APDU that a privileged process exchanges with the secure element.

The response has to stay on the multicast group, because that is where
userspace reads it: neard's seeld sends NFC_CMD_SE_IO on one socket and
handles the response on the socket it has subscribed to "events".
Requiring CAP_NET_ADMIN for the whole group would also hide the device
and target events from unprivileged listeners.

So keep the multicast, but filter the receivers: deliver the SE_IO
response only to sockets that were opened with CAP_NET_ADMIN in the
initial user namespace, the capability that NFC_CMD_SE_IO itself needs.
The check uses the credentials of the socket's opener, as
do_one_broadcast() does, because se_io_cb() runs in the driver's
context; a socket opened by a privileged process still gets the
response after the process drops the capability or passes the socket
on. Kernel sockets have no file and are skipped. Other events on the
group are not affected.

Found with a static analysis tool and checked by hand.

Fixes: 5ce3f32b5264 ("NFC: netlink: SE API implementation")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Tested in QEMU (x86_64, KASAN) with a test-only NFC driver whose se_io
answers from a work item. Four listeners subscribe to "events": root;
a socket opened by root that then drops CAP_NET_ADMIN; and two sockets
opened without the capability (root without CAP_NET_ADMIN, nobody).
Root then does DEV_UP (which adds the secure element), ENABLE_SE and
SE_IO.

Before: all four get SE_ADDED and the SE_IO response with the APDU.
After:  root and the socket opened by root get both; the two sockets
        opened without the capability get SE_ADDED only.

Not tested on hardware (st21nfca and st-nci implement se_io).
---
 net/nfc/netlink.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 224bdfa2dd0d..ebacbdd7193b 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1472,6 +1472,19 @@ struct se_io_ctx {
 	u32 se_idx;
 };
 
+/*
+ * Only listeners whose socket was opened with the capability that
+ * NFC_CMD_SE_IO requires get the response APDU. Check the opener of the
+ * socket, as do_one_broadcast() does, since this runs in the driver's
+ * context. Kernel sockets have no file and get nothing.
+ */
+static int se_io_filter(struct sock *dsk, struct sk_buff *skb, void *data)
+{
+	struct file *file = dsk->sk_socket->file;
+
+	return !file || !file_ns_capable(file, &init_user_ns, CAP_NET_ADMIN);
+}
+
 static void se_io_cb(void *context, u8 *apdu, size_t apdu_len, int err)
 {
 	struct se_io_ctx *ctx = context;
@@ -1496,7 +1509,8 @@ static void se_io_cb(void *context, u8 *apdu, size_t apdu_len, int err)
 
 	genlmsg_end(msg, hdr);
 
-	genlmsg_multicast(&nfc_genl_family, msg, 0, 0, GFP_KERNEL);
+	genlmsg_multicast_netns_filtered(&nfc_genl_family, &init_net, msg, 0, 0,
+					 GFP_KERNEL, se_io_filter, NULL);
 
 	kfree(ctx);
 




