Content-Type: multipart/mixed; boundary="===============4333742763815217962=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 5/7] nfc: constify local pointer variables
Date: Fri, 30 Jul 2021 16:42:00 +0200
Message-ID: <20210730144202.255890-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4333742763815217962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Few pointers to struct nfc_target and struct nfc_se can be made const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn544/pn544.c | 4 ++--
 net/nfc/core.c            | 2 +-
 net/nfc/hci/core.c        | 8 ++++----
 net/nfc/netlink.c         | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index c2b4555ab4b7..092f03b80a78 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -809,7 +809,7 @@ static int pn544_hci_discover_se(struct nfc_hci_dev *hd=
ev)
 #define PN544_SE_MODE_ON	0x01
 static int pn544_hci_enable_se(struct nfc_hci_dev *hdev, u32 se_idx)
 {
-	struct nfc_se *se;
+	const struct nfc_se *se;
 	u8 enable =3D PN544_SE_MODE_ON;
 	static struct uicc_gatelist {
 		u8 head;
@@ -864,7 +864,7 @@ static int pn544_hci_enable_se(struct nfc_hci_dev *hdev=
, u32 se_idx)
 =

 static int pn544_hci_disable_se(struct nfc_hci_dev *hdev, u32 se_idx)
 {
-	struct nfc_se *se;
+	const struct nfc_se *se;
 	u8 disable =3D PN544_SE_MODE_OFF;
 =

 	se =3D nfc_find_se(hdev->ndev, se_idx);
diff --git a/net/nfc/core.c b/net/nfc/core.c
index 08182e209144..3c645c1d99c9 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -824,7 +824,7 @@ EXPORT_SYMBOL(nfc_targets_found);
  */
 int nfc_target_lost(struct nfc_dev *dev, u32 target_idx)
 {
-	struct nfc_target *tg;
+	const struct nfc_target *tg;
 	int i;
 =

 	pr_debug("dev_name %s n_target %d\n", dev_name(&dev->dev), target_idx);
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index ff94ac774937..ceb87db57cdb 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -128,7 +128,7 @@ static void nfc_hci_msg_rx_work(struct work_struct *wor=
k)
 	struct nfc_hci_dev *hdev =3D container_of(work, struct nfc_hci_dev,
 						msg_rx_work);
 	struct sk_buff *skb;
-	struct hcp_message *message;
+	const struct hcp_message *message;
 	u8 pipe;
 	u8 type;
 	u8 instruction;
@@ -182,9 +182,9 @@ void nfc_hci_cmd_received(struct nfc_hci_dev *hdev, u8 =
pipe, u8 cmd,
 			  struct sk_buff *skb)
 {
 	u8 status =3D NFC_HCI_ANY_OK;
-	struct hci_create_pipe_resp *create_info;
-	struct hci_delete_pipe_noti *delete_info;
-	struct hci_all_pipe_cleared_noti *cleared_info;
+	const struct hci_create_pipe_resp *create_info;
+	const struct hci_delete_pipe_noti *delete_info;
+	const struct hci_all_pipe_cleared_noti *cleared_info;
 	u8 gate;
 =

 	pr_debug("from pipe %x cmd %x\n", pipe, cmd);
diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 70467a82be8f..49089c50872e 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -530,7 +530,7 @@ int nfc_genl_se_transaction(struct nfc_dev *dev, u8 se_=
idx,
 =

 int nfc_genl_se_connectivity(struct nfc_dev *dev, u8 se_idx)
 {
-	struct nfc_se *se;
+	const struct nfc_se *se;
 	struct sk_buff *msg;
 	void *hdr;
 =

-- =

2.27.0

--===============4333742763815217962==--

