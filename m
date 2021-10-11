Content-Type: multipart/mixed; boundary="===============7702816286132259633=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 5/7] nfc: st21nfca: drop unneeded debug prints
Date: Mon, 11 Oct 2021 15:38:33 +0200
Message-ID: <20211011133835.236347-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211011133835.236347-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7702816286132259633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st21nfca/i2c.c | 4 ----
 drivers/nfc/st21nfca/se.c  | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
index 279d88128b2e..f126ce96a7df 100644
--- a/drivers/nfc/st21nfca/i2c.c
+++ b/drivers/nfc/st21nfca/i2c.c
@@ -421,7 +421,6 @@ static int st21nfca_hci_i2c_read(struct st21nfca_i2c_ph=
y *phy,
 static irqreturn_t st21nfca_hci_irq_thread_fn(int irq, void *phy_id)
 {
 	struct st21nfca_i2c_phy *phy =3D phy_id;
-	struct i2c_client *client;
 =

 	int r;
 =

@@ -430,9 +429,6 @@ static irqreturn_t st21nfca_hci_irq_thread_fn(int irq, =
void *phy_id)
 		return IRQ_NONE;
 	}
 =

-	client =3D phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
-
 	if (phy->hard_fault !=3D 0)
 		return IRQ_HANDLED;
 =

diff --git a/drivers/nfc/st21nfca/se.c b/drivers/nfc/st21nfca/se.c
index c8bdf078d111..a43fc4117fa5 100644
--- a/drivers/nfc/st21nfca/se.c
+++ b/drivers/nfc/st21nfca/se.c
@@ -257,8 +257,6 @@ static void st21nfca_se_wt_timeout(struct timer_list *t)
 	struct st21nfca_hci_info *info =3D from_timer(info, t,
 						    se_info.bwi_timer);
 =

-	pr_debug("\n");
-
 	info->se_info.bwi_active =3D false;
 =

 	if (!info->se_info.xch_error) {
@@ -278,8 +276,6 @@ static void st21nfca_se_activation_timeout(struct timer=
_list *t)
 	struct st21nfca_hci_info *info =3D from_timer(info, t,
 						    se_info.se_active_timer);
 =

-	pr_debug("\n");
-
 	info->se_info.se_active =3D false;
 =

 	complete(&info->se_info.req_completion);
-- =

2.30.2

--===============7702816286132259633==--

