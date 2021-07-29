Content-Type: multipart/mixed; boundary="===============4197587558386718665=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 10/12] nfc: microread: constify several pointers
Date: Thu, 29 Jul 2021 12:40:20 +0200
Message-ID: <20210729104022.47761-11-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4197587558386718665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Several functions do not modify pointed data so arguments and local
variables can be const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/microread/i2c.c       | 2 +-
 drivers/nfc/microread/microread.c | 4 ++--
 drivers/nfc/microread/microread.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
index f91760c78455..86f593c73ed6 100644
--- a/drivers/nfc/microread/i2c.c
+++ b/drivers/nfc/microread/i2c.c
@@ -73,7 +73,7 @@ static void microread_i2c_remove_len_crc(struct sk_buff *=
skb)
 	skb_trim(skb, MICROREAD_I2C_FRAME_TAILROOM);
 }
 =

-static int check_crc(struct sk_buff *skb)
+static int check_crc(const struct sk_buff *skb)
 {
 	int i;
 	u8 crc =3D 0;
diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/micr=
oread.c
index 8e847524937c..9d83ccebd434 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -358,7 +358,7 @@ static int microread_complete_target_discovered(struct =
nfc_hci_dev *hdev,
 static void microread_im_transceive_cb(void *context, struct sk_buff *skb,
 				       int err)
 {
-	struct microread_info *info =3D context;
+	const struct microread_info *info =3D context;
 =

 	switch (info->async_cb_type) {
 	case MICROREAD_CB_TYPE_READER_ALL:
@@ -642,7 +642,7 @@ static const struct nfc_hci_ops microread_hci_ops =3D {
 };
 =

 int microread_probe(void *phy_id, const struct nfc_phy_ops *phy_ops,
-		    char *llc_name, int phy_headroom, int phy_tailroom,
+		    const char *llc_name, int phy_headroom, int phy_tailroom,
 		    int phy_payload, struct nfc_hci_dev **hdev)
 {
 	struct microread_info *info;
diff --git a/drivers/nfc/microread/microread.h b/drivers/nfc/microread/micr=
oread.h
index 76152d7aa53c..2ee7ccfa22dd 100644
--- a/drivers/nfc/microread/microread.h
+++ b/drivers/nfc/microread/microread.h
@@ -11,7 +11,7 @@
 #define DRIVER_DESC "NFC driver for microread"
 =

 int microread_probe(void *phy_id, const struct nfc_phy_ops *phy_ops,
-		    char *llc_name, int phy_headroom, int phy_tailroom,
+		    const char *llc_name, int phy_headroom, int phy_tailroom,
 		    int phy_payload, struct nfc_hci_dev **hdev);
 =

 void microread_remove(struct nfc_hci_dev *hdev);
-- =

2.27.0

--===============4197587558386718665==--

