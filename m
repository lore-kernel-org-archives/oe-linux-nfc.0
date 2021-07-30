Content-Type: multipart/mixed; boundary="===============7456903224403396963=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 8/8] nfc: hci: cleanup unneeded spaces
Date: Fri, 30 Jul 2021 08:56:25 +0200
Message-ID: <20210730065625.34010-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7456903224403396963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No need for multiple spaces in variable declaration (the code does not
use them in other places).  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/nci/core.c |  8 ++++----
 net/nfc/nci/hci.c  | 14 +++++++-------
 net/nfc/nci/ntf.c  |  4 ++--
 net/nfc/nci/rsp.c  |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index a17635612bcc..b814d92da7a5 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -405,7 +405,7 @@ static void nci_send_data_req(struct nci_dev *ndev, con=
st void *opt)
 static void nci_nfcc_loopback_cb(void *context, struct sk_buff *skb, int e=
rr)
 {
 	struct nci_dev *ndev =3D (struct nci_dev *)context;
-	struct nci_conn_info    *conn_info;
+	struct nci_conn_info *conn_info;
 =

 	conn_info =3D nci_get_conn_info_by_conn_id(ndev, ndev->cur_conn_id);
 	if (!conn_info) {
@@ -1002,7 +1002,7 @@ static int nci_transceive(struct nfc_dev *nfc_dev, st=
ruct nfc_target *target,
 {
 	struct nci_dev *ndev =3D nfc_get_drvdata(nfc_dev);
 	int rc;
-	struct nci_conn_info    *conn_info;
+	struct nci_conn_info *conn_info;
 =

 	conn_info =3D ndev->rf_conn_info;
 	if (!conn_info)
@@ -1267,7 +1267,7 @@ EXPORT_SYMBOL(nci_register_device);
  */
 void nci_unregister_device(struct nci_dev *ndev)
 {
-	struct nci_conn_info    *conn_info, *n;
+	struct nci_conn_info *conn_info, *n;
 =

 	nci_close_device(ndev);
 =

@@ -1439,7 +1439,7 @@ int nci_core_ntf_packet(struct nci_dev *ndev, __u16 o=
pcode,
 static void nci_tx_work(struct work_struct *work)
 {
 	struct nci_dev *ndev =3D container_of(work, struct nci_dev, tx_work);
-	struct nci_conn_info    *conn_info;
+	struct nci_conn_info *conn_info;
 	struct sk_buff *skb;
 =

 	conn_info =3D nci_get_conn_info_by_conn_id(ndev, ndev->cur_conn_id);
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index 163e5de7eda6..e199912ee1e5 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -16,11 +16,11 @@
 #include <linux/nfc.h>
 =

 struct nci_data {
-	u8              conn_id;
-	u8              pipe;
-	u8              cmd;
-	const u8        *data;
-	u32             data_len;
+	u8 conn_id;
+	u8 pipe;
+	u8 cmd;
+	const u8 *data;
+	u32 data_len;
 } __packed;
 =

 struct nci_hci_create_pipe_params {
@@ -363,7 +363,7 @@ static void nci_hci_cmd_received(struct nci_dev *ndev, =
u8 pipe,
 static void nci_hci_resp_received(struct nci_dev *ndev, u8 pipe,
 				  struct sk_buff *skb)
 {
-	struct nci_conn_info    *conn_info;
+	struct nci_conn_info *conn_info;
 =

 	conn_info =3D ndev->hci_dev->conn_info;
 	if (!conn_info)
@@ -712,7 +712,7 @@ static int nci_hci_dev_connect_gates(struct nci_dev *nd=
ev,
 =

 int nci_hci_dev_session_init(struct nci_dev *ndev)
 {
-	struct nci_conn_info    *conn_info;
+	struct nci_conn_info *conn_info;
 	struct sk_buff *skb;
 	int r;
 =

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 0a2ed25b9797..dde36e19f652 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -48,7 +48,7 @@ static void nci_core_conn_credits_ntf_packet(struct nci_d=
ev *ndev,
 					     struct sk_buff *skb)
 {
 	struct nci_core_conn_credit_ntf *ntf =3D (void *) skb->data;
-	struct nci_conn_info	*conn_info;
+	struct nci_conn_info *conn_info;
 	int i;
 =

 	pr_debug("num_entries %d\n", ntf->num_entries);
@@ -528,7 +528,7 @@ static int nci_store_general_bytes_nfc_dep(struct nci_d=
ev *ndev,
 static void nci_rf_intf_activated_ntf_packet(struct nci_dev *ndev,
 					     const struct sk_buff *skb)
 {
-	struct nci_conn_info    *conn_info;
+	struct nci_conn_info *conn_info;
 	struct nci_rf_intf_activated_ntf ntf;
 	const __u8 *data =3D skb->data;
 	int err =3D NCI_STATUS_OK;
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index ebed2a7a0071..8539a39a8e1d 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -185,7 +185,7 @@ static void nci_rf_disc_map_rsp_packet(struct nci_dev *=
ndev,
 static void nci_rf_disc_rsp_packet(struct nci_dev *ndev,
 				   const struct sk_buff *skb)
 {
-	struct nci_conn_info    *conn_info;
+	struct nci_conn_info *conn_info;
 	__u8 status =3D skb->data[0];
 =

 	pr_debug("status 0x%x\n", status);
-- =

2.27.0

--===============7456903224403396963==--

