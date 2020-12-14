Content-Type: multipart/mixed; boundary="===============5980736717412290267=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next] nfc: s3fwrn5: Remove unused nci prop commands
Date: Mon, 14 Dec 2020 20:46:58 +0900
Message-ID: <20201214114658.27771-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5980736717412290267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

remove the unused nci prop commands that samsung driver doesn't use.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/nci.c | 25 -------------------------
 drivers/nfc/s3fwrn5/nci.h | 22 ----------------------
 2 files changed, 47 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
index 103bf5c92bdc..f042d3eaf8f6 100644
--- a/drivers/nfc/s3fwrn5/nci.c
+++ b/drivers/nfc/s3fwrn5/nci.c
@@ -21,31 +21,11 @@ static int s3fwrn5_nci_prop_rsp(struct nci_dev *ndev, s=
truct sk_buff *skb)
 }
 =

 static struct nci_driver_ops s3fwrn5_nci_prop_ops[] =3D {
-	{
-		.opcode =3D nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_AGAIN),
-		.rsp =3D s3fwrn5_nci_prop_rsp,
-	},
-	{
-		.opcode =3D nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_GET_RFREG),
-		.rsp =3D s3fwrn5_nci_prop_rsp,
-	},
 	{
 		.opcode =3D nci_opcode_pack(NCI_GID_PROPRIETARY,
 				NCI_PROP_SET_RFREG),
 		.rsp =3D s3fwrn5_nci_prop_rsp,
 	},
-	{
-		.opcode =3D nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_GET_RFREG_VER),
-		.rsp =3D s3fwrn5_nci_prop_rsp,
-	},
-	{
-		.opcode =3D nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_SET_RFREG_VER),
-		.rsp =3D s3fwrn5_nci_prop_rsp,
-	},
 	{
 		.opcode =3D nci_opcode_pack(NCI_GID_PROPRIETARY,
 				NCI_PROP_START_RFREG),
@@ -61,11 +41,6 @@ static struct nci_driver_ops s3fwrn5_nci_prop_ops[] =3D {
 				NCI_PROP_FW_CFG),
 		.rsp =3D s3fwrn5_nci_prop_rsp,
 	},
-	{
-		.opcode =3D nci_opcode_pack(NCI_GID_PROPRIETARY,
-				NCI_PROP_WR_RESET),
-		.rsp =3D s3fwrn5_nci_prop_rsp,
-	},
 };
 =

 void s3fwrn5_nci_get_prop_ops(struct nci_driver_ops **ops, size_t *n)
diff --git a/drivers/nfc/s3fwrn5/nci.h b/drivers/nfc/s3fwrn5/nci.h
index 23c0b28f247a..a80f0fb082a8 100644
--- a/drivers/nfc/s3fwrn5/nci.h
+++ b/drivers/nfc/s3fwrn5/nci.h
@@ -11,9 +11,6 @@
 =

 #include "s3fwrn5.h"
 =

-#define NCI_PROP_AGAIN		0x01
-
-#define NCI_PROP_GET_RFREG	0x21
 #define NCI_PROP_SET_RFREG	0x22
 =

 struct nci_prop_set_rfreg_cmd {
@@ -25,23 +22,6 @@ struct nci_prop_set_rfreg_rsp {
 	__u8 status;
 };
 =

-#define NCI_PROP_GET_RFREG_VER	0x24
-
-struct nci_prop_get_rfreg_ver_rsp {
-	__u8 status;
-	__u8 data[8];
-};
-
-#define NCI_PROP_SET_RFREG_VER	0x25
-
-struct nci_prop_set_rfreg_ver_cmd {
-	__u8 data[8];
-};
-
-struct nci_prop_set_rfreg_ver_rsp {
-	__u8 status;
-};
-
 #define NCI_PROP_START_RFREG	0x26
 =

 struct nci_prop_start_rfreg_rsp {
@@ -70,8 +50,6 @@ struct nci_prop_fw_cfg_rsp {
 	__u8 status;
 };
 =

-#define NCI_PROP_WR_RESET	0x2f
-
 void s3fwrn5_nci_get_prop_ops(struct nci_driver_ops **ops, size_t *n);
 int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_nam=
e);
 =

-- =

2.17.1

--===============5980736717412290267==--

