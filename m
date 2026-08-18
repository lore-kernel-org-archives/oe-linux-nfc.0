Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B002735C692
	for <oe-linux-nfc@lists.linux.dev>; Tue, 18 Aug 2026 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086815; cv=none; b=Z3JZUhimNcIT5LLnqo9phwtNTDafZIqPHPe2OoKGuvQRjKQmHXrXAhICBjBLwUUV3jQs0NDnWttio/kQ451frj9P9mCyIrcM5ikA00sZcZRCpfyDKSF6VhHhVNUePvow0ZfJdYThhIChi02bB17T7IJ5gO8b1j80+RWLXK2L5VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086815; c=relaxed/simple;
	bh=VJnu7u37spB8e+zfjTXmYSJRBJP/t7Vh607zCIifbFs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LWZpkOrlUCRhCfy/rUD5CcLWLsRDnm1ikuJ+GoVjak8mDHlW8aP5Hh5X53/KTUMAiIYSwldeT6HCvta/Yen5znMSWYDxVw6grRQr+W9tBI0J7Srs/0w+H+lrWWWYbqjIuFZcGFiTqJrxaFHSBF0CSkvlccqCLLCQbZhb2SJ9mfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nOnBSp/H; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nOnBSp/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787086801; x=1787346001;
	bh=DpEjlW787XdXes7IaSTvHTmZK1mnLdCOW+bbMhX8dPA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nOnBSp/HJ7lalwLBD0WrpTNYwzWxEmbWX4N0a6JMHtFSXP+BQ+Hs22ngtT9jGgobB
	 9j4YkaAb315NnBFYP21WVTrvnybxMrtFGKc+D6q7mpYEJU8v1XWuMXQ/+31/3rim1k
	 vVN4e+B9RGFc6l5Z9fZ5CjstitIV4sj9ObJBAlGqR92f5Bzb4LwXuiPts0C+BqSIyG
	 dAJYfGOCqVOpiHXr5O3rAGAFQFGhFAsGnIVjSnR1JFZ6mJ4qVSFw8+UiPvaA15SbF+
	 4/b+oXVndRH0InMXgd30X+2oABT8RUpub38arZuAcUm4B9X4UFguMW7pTI6MDLuqgQ
	 Fjsbf+8jtSLFA==
Date: Tue, 18 Aug 2026 20:59:59 +0000
To: oe-linux-nfc@lists.linux.dev
From: Kristian Brox <isyourbrainfoss@proton.me>
Cc: david+nfc@ixit.cz, krzysztof.kozlowski@linaro.org, luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org, Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 2/3] nfc: st-nci: add raw NCI path for ST21NFCD
Message-ID: <20260818205940.1973944-3-isyourbrainfoss@proton.me>
In-Reply-To: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
Feedback-ID: 203906395:user:proton
X-Pm-Message-ID: 8c96359f82b3f59dae7385c378841bad305b1967
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------1b4d86eeab80e8491994fadbdb2947deed662dccd3ab234ca6c39a3e20556b0d"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------1b4d86eeab80e8491994fadbdb2947deed662dccd3ab234ca6c39a3e20556b0d
Content-Type: multipart/mixed;
 boundary=82651a7b18f6abb6ae2ca69ca65dc4cb66dcb052336566bf985a11ee56c0
From: Kristian Brox <isyourbrainfoss@proton.me>
To: oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz,
	krzysztof.kozlowski@linaro.org,
	luca.weiss@fairphone.com,
	linux-arm-msm@vger.kernel.org,
	Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 2/3] nfc: st-nci: add raw NCI path for ST21NFCD
Date: Tue, 18 Aug 2026 22:59:39 +0200
Message-ID: <20260818205940.1973944-3-isyourbrainfoss@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
MIME-Version: 1.0

--82651a7b18f6abb6ae2ca69ca65dc4cb66dcb052336566bf985a11ee56c0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ST21NFCD does not use NDLC. When the compatible is st,st21nfcd-i2c,
talk raw NCI:

- do not add or strip an NDLC PCB
- do not run the T1/T2 ACK timers
- I2C reads are a 3-byte NCI header plus payload
- skip proprietary SET_NFC_MODE and HCI SE discovery

st,st21nfcb-i2c and st,st21nfcc-i2c are unchanged.

Tested on Fairphone 5: adapter powers up and reads an NTAG 215.

Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
---
diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index a367136d4..2356f16b8 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -18,8 +18,13 @@
 
 static int st_nci_init(struct nci_dev *ndev)
 {
+	struct st_nci_info *info = nci_get_drvdata(ndev);
 	struct nci_mode_set_cmd cmd;
 
+	/* ST21NFCD has no NDLC proprietary SET_NFC_MODE */
+	if (info->ndlc->raw_nci)
+		return 0;
+
 	cmd.cmd_type = ST_NCI_SET_NFC_MODE;
 	cmd.mode = 1;
 
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c

index 416770adb..456238b58 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/nfc.h>
 #include <linux/of.h>
+#include <linux/property.h>
 
 #include "st-nci.h"
 
@@ -22,10 +23,17 @@
 /* ndlc header */
 #define ST_NCI_FRAME_HEADROOM 1
 #define ST_NCI_FRAME_TAILROOM 0
+#define ST_NCI_RAW_FRAME_HEADROOM 0
 
 #define ST_NCI_I2C_MIN_SIZE 4   /* PCB(1) + NCI Packet header(3) */
+#define ST_NCI_NCI_HDR_SIZE 3   /* raw NCI: MT/PBF/GID + OID + len */
 #define ST_NCI_I2C_MAX_SIZE 250 /* req 4.2.1 */
 
+enum st_nci_i2c_proto {
+	ST_NCI_I2C_PROTO_NDLC = 0,
+	ST_NCI_I2C_PROTO_RAW_NCI,
+};
+
 #define ST_NCI_DRIVER_NAME "st_nci"
 #define ST_NCI_I2C_DRIVER_NAME "st_nci_i2c"
 
@@ -34,6 +42,7 @@ struct st_nci_i2c_phy {
 	struct llt_ndlc *ndlc;
 
 	bool irq_active;
+	bool raw_nci;
 
 	struct gpio_desc *gpiod_reset;
 
@@ -111,6 +120,42 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *p
hy,
 	u8 buf[ST_NCI_I2C_MAX_SIZE];
 	struct i2c_client *client = phy->i2c_dev;
 
+	if (phy->raw_nci) {
+		r = i2c_master_recv(client, buf, ST_NCI_NCI_HDR_SIZE);
+		if (r < 0) {
+			usleep_range(1000, 4000);
+			r = i2c_master_recv(client, buf, ST_NCI_NCI_HDR_SIZE);
+		}
+		if (r != ST_NCI_NCI_HDR_SIZE)
+			return -EREMOTEIO;
+
+		len = buf[2];
+		if (len > ST_NCI_I2C_MAX_SIZE) {
+			nfc_err(&client->dev, "invalid frame len\n");
+			return -EBADMSG;
+		}
+
+		*skb = alloc_skb(ST_NCI_NCI_HDR_SIZE + len, GFP_KERNEL);
+		if (!*skb)
+			return -ENOMEM;
+
+		skb_put(*skb, ST_NCI_NCI_HDR_SIZE);
+		memcpy((*skb)->data, buf, ST_NCI_NCI_HDR_SIZE);
+
+		if (!len)
+			return 0;
+
+		r = i2c_master_recv(client, buf, len);
+		if (r != len) {
+			kfree_skb(*skb);
+			return -EREMOTEIO;
+		}
+
+		skb_put(*skb, len);
+		memcpy((*skb)->data + ST_NCI_NCI_HDR_SIZE, buf, len);
+		return 0;
+	}
+
 	r = i2c_master_recv(client, buf, ST_NCI_I2C_MIN_SIZE);
 	if (r < 0) {
  /* Retry, chip was in standby */
 		usleep_range(1000, 4000);
@@ -211,6 +256,8 @@ static int st_nci_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	phy->i2c_dev = client;
+	phy->raw_nci = (uintptr_t)device_get_match_data(dev) ==
+			ST_NCI_I2C_PROTO_RAW_NCI;
 
 	i2c_set_clientdata(client, phy);
 
@@ -231,13 +278,17 @@ static int st_nci_i2c_probe(struct i2c_client *client)
 				device_property_read_bool(dev, "uicc-present");
 
 	r = ndlc_probe(phy, &i2c_phy_ops, &client->dev,
-			ST_NCI_FRAME_HEADROOM, ST_NCI_FRAME_TAILROOM,
+			phy->raw_nci ? ST_NCI_RAW_FRAME_HEADROOM :
+				       ST_NCI_FRAME_HEADROOM,
+			ST_NCI_FRAME_TAILROOM,
 			&phy->ndlc, &phy->se_status);
 	if (r < 0) {
 		nfc_err(&client->dev, "Unable to register ndlc layer\n");
 		return r;
 	}
 
+	phy->ndlc->raw_nci = phy->raw_nci;
+
 	phy->irq_active = true;
 	r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
 				st_nci_irq_thread_fn,
@@ -273,6 +324,8 @@ static cons
t struct of_device_id of_st_nci_i2c_match[] __maybe_unused = {
 	{ .compatible = "st,st21nfcb-i2c", },
 	{ .compatible = "st,st21nfcb_i2c", },
 	{ .compatible = "st,st21nfcc-i2c", },
+	{ .compatible = "st,st21nfcd-i2c",
+	  .data = (void *)ST_NCI_I2C_PROTO_RAW_NCI },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_st_nci_i2c_match);
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index be4808859..b3192460c 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -62,8 +62,9 @@ void ndlc_close(struct llt_ndlc *ndlc)
 	/* toggle reset pin */
 	ndlc->ops->enable(ndlc->phy_id);
 
-	nci_prop_cmd(ndlc->ndev, ST_NCI_CORE_PROP,
-		     sizeof(struct nci_mode_set_cmd), (__u8 *)&cmd);
+	if (!ndlc->raw_nci)
+		nci_prop_cmd(ndlc->ndev, ST_NCI_CORE_PROP,
+			     sizeof(struct nci_mode_set_cmd), (__u8 *)&cmd);
 
 	ndlc->powered = 0;
 	ndlc->ops->disable(ndlc->phy_id);
@@ -72,11 +73,13 @@ EXPORT_SYMBOL(ndlc_close);
 
 int ndlc_send(struct llt_ndlc 
*ndlc, struct sk_buff *skb)
 {
-	/* add ndlc header */
-	u8 pcb = PCB_TYPE_DATAFRAME | PCB_DATAFRAME_RETRANSMIT_NO |
-		PCB_FRAME_CRC_INFO_NOTPRESENT;
+	if (!ndlc->raw_nci) {
+		/* add ndlc header */
+		u8 pcb = PCB_TYPE_DATAFRAME | PCB_DATAFRAME_RETRANSMIT_NO |
+			PCB_FRAME_CRC_INFO_NOTPRESENT;
 
-	*(u8 *)skb_push(skb, 1) = pcb;
+		*(u8 *)skb_push(skb, 1) = pcb;
+	}
 	skb_queue_tail(&ndlc->send_q, skb);
 
 	schedule_work(&ndlc->sm_work);
@@ -103,6 +106,10 @@ static void llt_ndlc_send_queue(struct llt_ndlc *ndlc)
 			ndlc->hard_fault = r;
 			break;
 		}
+		if (ndlc->raw_nci) {
+			kfree_skb(skb);
+			continue;
+		}
 		time_sent = jiffies;
 		*(unsigned long *)skb->cb = time_sent;
 
@@ -154,6 +161,10 @@ static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
 		pr_debug("rcvQlen=%d\n", ndlc->rcv_q.qlen);
 
 	while ((skb = skb_dequeue(&ndlc->rcv_q)) != NULL) {
+		if (ndlc->raw_nci) {
+			nci_recv_frame(ndlc->ndev, skb);
+			continue;
+		}
 		pcb = skb->
data[0];
 		skb_pull(skb, 1);
 		if ((pcb & PCB_TYPE_MASK) == PCB_TYPE_SUPERVISOR) {
diff --git a/drivers/nfc/st-nci/ndlc.h b/drivers/nfc/st-nci/ndlc.h
index c24ce9b0d..5c1f8baf0 100644
--- a/drivers/nfc/st-nci/ndlc.h
+++ b/drivers/nfc/st-nci/ndlc.h
@@ -39,6 +39,8 @@ struct llt_ndlc {
 	 */
 	int hard_fault;
 	int powered;
+	/* ST21NFCD: raw NCI on the wire, no NDLC PCB / ACK timers */
+	bool raw_nci;
 };
 
 int ndlc_open(struct llt_ndlc *ndlc);
diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 607ec768e..44cc102bc 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -621,6 +621,9 @@ int st_nci_discover_se(struct nci_dev *ndev)
 	int se_count = 0;
 	struct st_nci_info *info = nci_get_drvdata(ndev);
 
+	if (info->ndlc->raw_nci)
+		return 0;
+
 	r = st_nci_hci_network_init(ndev);
 	if (r != 0)
 		return r;

--82651a7b18f6abb6ae2ca69ca65dc4cb66dcb052336566bf985a11ee56c0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"
Content-Type: application/pgp-keys; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFqR1U0UllKS3dZQkJBSGFS
dzhCQVFkQVJkaFRsODdNUnJZNlJsOC9FeUhRdmJjVWtqWXBEcmptcmZBRwoxNzV5djR2Tk5XbHpl
VzkxY21KeVlXbHVabTl6YzBCd2NtOTBiMjR1YldVZ1BHbHplVzkxY21KeVlXbHVabTl6CmMwQndj
bTkwYjI0dWJXVSt3c0FSQkJNV0NnQ0RCWUpxTVpUaEF3c0pCd2tRcVFlNkNIM2p3cWhGRkFBQUFB
QUEKSEFBZ2MyRnNkRUJ1YjNSaGRHbHZibk11YjNCbGJuQm5jR3B6TG05eVo2bTkwZmNOZ2Q0cVp6
NWFnV05OTmorbwpyTjkrOHc2TUVRZ0J4MElqR0NPcUF4VUtDQVFXQUFJQkFoa0JBcHNEQWg0QkZp
RUVtU0lrWU5Najl2RWxSS0JyCnFRZTZDSDNqd3FnQUFCcHVBUUNiUmgxb3VRMUVhQmlHWGtYeVhS
bjZkWTNaVjUzdXkrWHRRWGhtOWtpSFJBRDkKRkxROWtzdGJyVmx3WGlrUkl5OVpINUQ0R1VXS292
ZXJIdlpWbzd5RFpnM09PQVJxTVpUaEVnb3JCZ0VFQVpkVgpBUVVCQVFkQUdHZDhVMnJyaldxMVBa
YmhsQUFPUE1KanJEeTVkSjdMbnQ3ZHE1Q21VUWdEQVFnSHdyNEVHQllLCkFIQUZnbW94bE9FSkVL
a0h1Z2g5NDhLb1JSUUFBQUFBQUJ3QUlITmhiSFJBYm05MFlYUnBiMjV6TG05d1pXNXcKWjNCcWN5
NXZjbWNVbzFQNFhTZExyNEpzRlRBaThTcUVDSERDa2thdTBtTmthSk5aaWFjU2p3S2JEQlloQkpr
aQpKR0RUSS9ieEpVU2dhNmtIdWdoOTQ4S29BQUQrZndEK0lLcStqbUFKZytYbmVXT09YNHA4eTFX
K0dYN3FTQzFCCnE4aUFYUWJpa2VNQkFLdHc0aStPZ2VHTWMyOUxHSnNIellXbVJhRU9nS0JvOEcr
UklhK0ZUa29GCj1rbmFrCi0tLS0tRU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0=
--82651a7b18f6abb6ae2ca69ca65dc4cb66dcb052336566bf985a11ee56c0--

--------1b4d86eeab80e8491994fadbdb2947deed662dccd3ab234ca6c39a3e20556b0d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmqEx84JEKkHugh948KoNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfXhhb/YRGTK6+mXr1fij4RFiEEmSIkYNMj9vEl
RKBrqQe6CH3jwqgAAEqRAQDJIKuX1mrbXDOqumz1Z0FFeE6ZgExwwVv1WGn3
b7vrlgD8Cve0RBao0uFHdzzm72atUhj9f31CxErgOydUX8BD1gs=
=z2G3
-----END PGP SIGNATURE-----


--------1b4d86eeab80e8491994fadbdb2947deed662dccd3ab234ca6c39a3e20556b0d--

