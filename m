Content-Type: multipart/mixed; boundary="===============3561736336137940975=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 4/7] nfc: st-nci: drop unneeded debug prints
Date: Mon, 11 Oct 2021 15:38:32 +0200
Message-ID: <20211011133835.236347-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3561736336137940975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st-nci/i2c.c  | 4 ----
 drivers/nfc/st-nci/ndlc.c | 4 ----
 drivers/nfc/st-nci/se.c   | 6 ------
 drivers/nfc/st-nci/spi.c  | 4 ----
 4 files changed, 18 deletions(-)

diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
index ccf6152ebb9f..cbd968f013c7 100644
--- a/drivers/nfc/st-nci/i2c.c
+++ b/drivers/nfc/st-nci/i2c.c
@@ -157,7 +157,6 @@ static int st_nci_i2c_read(struct st_nci_i2c_phy *phy,
 static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
 {
 	struct st_nci_i2c_phy *phy =3D phy_id;
-	struct i2c_client *client;
 	struct sk_buff *skb =3D NULL;
 	int r;
 =

@@ -166,9 +165,6 @@ static irqreturn_t st_nci_irq_thread_fn(int irq, void *=
phy_id)
 		return IRQ_NONE;
 	}
 =

-	client =3D phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
-
 	if (phy->ndlc->hard_fault)
 		return IRQ_HANDLED;
 =

diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
index e9dc313b333e..755460a73c0d 100644
--- a/drivers/nfc/st-nci/ndlc.c
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -239,8 +239,6 @@ static void ndlc_t1_timeout(struct timer_list *t)
 {
 	struct llt_ndlc *ndlc =3D from_timer(ndlc, t, t1_timer);
 =

-	pr_debug("\n");
-
 	schedule_work(&ndlc->sm_work);
 }
 =

@@ -248,8 +246,6 @@ static void ndlc_t2_timeout(struct timer_list *t)
 {
 	struct llt_ndlc *ndlc =3D from_timer(ndlc, t, t2_timer);
 =

-	pr_debug("\n");
-
 	schedule_work(&ndlc->sm_work);
 }
 =

diff --git a/drivers/nfc/st-nci/se.c b/drivers/nfc/st-nci/se.c
index 5fd89f72969d..7764b1a4c3cf 100644
--- a/drivers/nfc/st-nci/se.c
+++ b/drivers/nfc/st-nci/se.c
@@ -638,8 +638,6 @@ int st_nci_se_io(struct nci_dev *ndev, u32 se_idx,
 {
 	struct st_nci_info *info =3D nci_get_drvdata(ndev);
 =

-	pr_debug("\n");
-
 	switch (se_idx) {
 	case ST_NCI_ESE_HOST_ID:
 		info->se_info.cb =3D cb;
@@ -671,8 +669,6 @@ static void st_nci_se_wt_timeout(struct timer_list *t)
 	u8 param =3D 0x01;
 	struct st_nci_info *info =3D from_timer(info, t, se_info.bwi_timer);
 =

-	pr_debug("\n");
-
 	info->se_info.bwi_active =3D false;
 =

 	if (!info->se_info.xch_error) {
@@ -692,8 +688,6 @@ static void st_nci_se_activation_timeout(struct timer_l=
ist *t)
 	struct st_nci_info *info =3D from_timer(info, t,
 					      se_info.se_active_timer);
 =

-	pr_debug("\n");
-
 	info->se_info.se_active =3D false;
 =

 	complete(&info->se_info.req_completion);
diff --git a/drivers/nfc/st-nci/spi.c b/drivers/nfc/st-nci/spi.c
index 0875b773fb41..4e723992e74c 100644
--- a/drivers/nfc/st-nci/spi.c
+++ b/drivers/nfc/st-nci/spi.c
@@ -169,7 +169,6 @@ static int st_nci_spi_read(struct st_nci_spi_phy *phy,
 static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
 {
 	struct st_nci_spi_phy *phy =3D phy_id;
-	struct spi_device *dev;
 	struct sk_buff *skb =3D NULL;
 	int r;
 =

@@ -178,9 +177,6 @@ static irqreturn_t st_nci_irq_thread_fn(int irq, void *=
phy_id)
 		return IRQ_NONE;
 	}
 =

-	dev =3D phy->spi_dev;
-	dev_dbg(&dev->dev, "IRQ\n");
-
 	if (phy->ndlc->hard_fault)
 		return IRQ_HANDLED;
 =

-- =

2.30.2

--===============3561736336137940975==--

