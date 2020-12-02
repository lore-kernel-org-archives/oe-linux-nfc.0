Content-Type: multipart/mixed; boundary="===============1918324923540797699=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next v4] net/nfc/nci: Support NCI 2.x initial sequence
Date: Thu, 03 Dec 2020 07:31:47 +0900
Message-ID: <20201202223147.3472-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1918324923540797699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

implement the NCI 2.x initial sequence to support NCI 2.x NFCC.
Since NCI 2.0, CORE_RESET and CORE_INIT sequence have been changed.
If NFCEE supports NCI 2.x, then NCI 2.x initial sequence will work.

In NCI 1.0, Initial sequence and payloads are as below:
(DH)                     (NFCC)
 |  -- CORE_RESET_CMD --> |
 |  <-- CORE_RESET_RSP -- |
 |  -- CORE_INIT_CMD -->  |
 |  <-- CORE_INIT_RSP --  |
 CORE_RESET_RSP payloads are Status, NCI version, Configuration Status.
 CORE_INIT_CMD payloads are empty.
 CORE_INIT_RSP payloads are Status, NFCC Features,
    Number of Supported RF Interfaces, Supported RF Interface,
    Max Logical Connections, Max Routing table Size,
    Max Control Packet Payload Size, Max Size for Large Parameters,
    Manufacturer ID, Manufacturer Specific Information.

In NCI 2.0, Initial Sequence and Parameters are as below:
(DH)                     (NFCC)
 |  -- CORE_RESET_CMD --> |
 |  <-- CORE_RESET_RSP -- |
 |  <-- CORE_RESET_NTF -- |
 |  -- CORE_INIT_CMD -->  |
 |  <-- CORE_INIT_RSP --  |
 CORE_RESET_RSP payloads are Status.
 CORE_RESET_NTF payloads are Reset Trigger,
    Configuration Status, NCI Version, Manufacturer ID,
    Manufacturer Specific Information Length,
    Manufacturer Specific Information.
 CORE_INIT_CMD payloads are Feature1, Feature2.
 CORE_INIT_RSP payloads are Status, NFCC Features,
    Max Logical Connections, Max Routing Table Size,
    Max Control Packet Payload Size,
    Max Data Packet Payload Size of the Static HCI Connection,
    Number of Credits of the Static HCI Connection,
    Max NFC-V RF Frame Size, Number of Supported RF Interfaces,
    Supported RF Interfaces.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---

 Changes in v4:
  - remove the unnecessary empty line.
  - pull out the common code.
  - change the unsigned char to u8.
  - order the variable declarations longest to shortest.

 Changes in v3:
  - remove the unused struct nci_core_reset_rsp_nci_ver2.
  - remove the __packed because of no need.
  - remove the unnecessary brackets.
  - change the asignment code for ndev->num_supported_rf_interfaces.

 Changes in v2:
  - fix the warning of type casting.
  - changed the __u8 type to unsigned char.

 include/net/nfc/nci.h | 34 ++++++++++++++++++
 net/nfc/nci/core.c    | 18 ++++++++--
 net/nfc/nci/ntf.c     | 21 +++++++++++
 net/nfc/nci/rsp.c     | 81 +++++++++++++++++++++++++++++++++++--------
 4 files changed, 138 insertions(+), 16 deletions(-)

diff --git a/include/net/nfc/nci.h b/include/net/nfc/nci.h
index 0550e0380b8d..e82f55f543bb 100644
--- a/include/net/nfc/nci.h
+++ b/include/net/nfc/nci.h
@@ -25,6 +25,8 @@
 #define NCI_MAX_PARAM_LEN					251
 #define NCI_MAX_PAYLOAD_SIZE					255
 #define NCI_MAX_PACKET_SIZE					258
+#define NCI_MAX_LARGE_PARAMS_NCI_v2				15
+#define NCI_VER_2_MASK						0x20
 =

 /* NCI Status Codes */
 #define NCI_STATUS_OK						0x00
@@ -131,6 +133,9 @@
 #define NCI_LF_CON_BITR_F_212					0x02
 #define NCI_LF_CON_BITR_F_424					0x04
 =

+/* NCI 2.x Feature Enable Bit */
+#define NCI_FEATURE_DISABLE					0x00
+
 /* NCI Reset types */
 #define NCI_RESET_TYPE_KEEP_CONFIG				0x00
 #define NCI_RESET_TYPE_RESET_CONFIG				0x01
@@ -220,6 +225,11 @@ struct nci_core_reset_cmd {
 } __packed;
 =

 #define NCI_OP_CORE_INIT_CMD		nci_opcode_pack(NCI_GID_CORE, 0x01)
+/* To support NCI 2.x */
+struct nci_core_init_v2_cmd {
+	u8	feature1;
+	u8	feature2;
+};
 =

 #define NCI_OP_CORE_SET_CONFIG_CMD	nci_opcode_pack(NCI_GID_CORE, 0x02)
 struct set_config_param {
@@ -334,6 +344,20 @@ struct nci_core_init_rsp_2 {
 	__le32	manufact_specific_info;
 } __packed;
 =

+/* To support NCI ver 2.x */
+struct nci_core_init_rsp_nci_ver2 {
+	u8	status;
+	__le32	nfcc_features;
+	u8	max_logical_connections;
+	__le16	max_routing_table_size;
+	u8	max_ctrl_pkt_payload_len;
+	u8	max_data_pkt_hci_payload_len;
+	u8	number_of_hci_credit;
+	__le16	max_nfc_v_frame_size;
+	u8	num_supported_rf_interfaces;
+	u8	supported_rf_interfaces[];
+} __packed;
+
 #define NCI_OP_CORE_SET_CONFIG_RSP	nci_opcode_pack(NCI_GID_CORE, 0x02)
 struct nci_core_set_config_rsp {
 	__u8	status;
@@ -372,6 +396,16 @@ struct nci_nfcee_discover_rsp {
 /* --------------------------- */
 /* ---- NCI Notifications ---- */
 /* --------------------------- */
+#define NCI_OP_CORE_RESET_NTF		nci_opcode_pack(NCI_GID_CORE, 0x00)
+struct nci_core_reset_ntf {
+	u8	reset_trigger;
+	u8	config_status;
+	u8	nci_ver;
+	u8	manufact_id;
+	u8	manufacturer_specific_len;
+	__le32	manufact_specific_info;
+} __packed;
+
 #define NCI_OP_CORE_CONN_CREDITS_NTF	nci_opcode_pack(NCI_GID_CORE, 0x06)
 struct conn_credit_entry {
 	__u8	conn_id;
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 4953ee5146e1..e64727e1a72f 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -165,7 +165,12 @@ static void nci_reset_req(struct nci_dev *ndev, unsign=
ed long opt)
 =

 static void nci_init_req(struct nci_dev *ndev, unsigned long opt)
 {
-	nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
+	u8 plen =3D 0;
+
+	if (opt)
+		plen =3D sizeof(struct nci_core_init_v2_cmd);
+
+	nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, plen, (void *)opt);
 }
 =

 static void nci_init_complete_req(struct nci_dev *ndev, unsigned long opt)
@@ -497,7 +502,16 @@ static int nci_open_device(struct nci_dev *ndev)
 	}
 =

 	if (!rc) {
-		rc =3D __nci_request(ndev, nci_init_req, 0,
+		struct nci_core_init_v2_cmd nci_init_v2_cmd =3D {
+			.feature1 =3D NCI_FEATURE_DISABLE,
+			.feature2 =3D NCI_FEATURE_DISABLE
+		};
+		unsigned long opt =3D 0;
+
+		if (!(ndev->nci_ver & NCI_VER_2_MASK))
+			opt =3D (unsigned long)&nci_init_v2_cmd;
+
+		rc =3D __nci_request(ndev, nci_init_req, opt,
 				   msecs_to_jiffies(NCI_INIT_TIMEOUT));
 	}
 =

diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index 33e1170817f0..98af04c86b2c 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -27,6 +27,23 @@
 =

 /* Handle NCI Notification packets */
 =

+static void nci_core_reset_ntf_packet(struct nci_dev *ndev,
+				      struct sk_buff *skb)
+{
+	/* Handle NCI 2.x core reset notification */
+	struct nci_core_reset_ntf *ntf =3D (void *)skb->data;
+
+	ndev->nci_ver =3D ntf->nci_ver;
+	pr_debug("nci_ver 0x%x, config_status 0x%x\n",
+		 ntf->nci_ver, ntf->config_status);
+
+	ndev->manufact_id =3D ntf->manufact_id;
+	ndev->manufact_specific_info =3D
+		__le32_to_cpu(ntf->manufact_specific_info);
+
+	nci_req_complete(ndev, NCI_STATUS_OK);
+}
+
 static void nci_core_conn_credits_ntf_packet(struct nci_dev *ndev,
 					     struct sk_buff *skb)
 {
@@ -756,6 +773,10 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_bu=
ff *skb)
 	}
 =

 	switch (ntf_opcode) {
+	case NCI_OP_CORE_RESET_NTF:
+		nci_core_reset_ntf_packet(ndev, skb);
+		break;
+
 	case NCI_OP_CORE_CONN_CREDITS_NTF:
 		nci_core_conn_credits_ntf_packet(ndev, skb);
 		break;
diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index a48297b79f34..e9605922a322 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -31,16 +31,19 @@ static void nci_core_reset_rsp_packet(struct nci_dev *n=
dev, struct sk_buff *skb)
 =

 	pr_debug("status 0x%x\n", rsp->status);
 =

-	if (rsp->status =3D=3D NCI_STATUS_OK) {
-		ndev->nci_ver =3D rsp->nci_ver;
-		pr_debug("nci_ver 0x%x, config_status 0x%x\n",
-			 rsp->nci_ver, rsp->config_status);
-	}
+	/* Handle NCI 1.x ver */
+	if (skb->len !=3D 1) {
+		if (rsp->status =3D=3D NCI_STATUS_OK) {
+			ndev->nci_ver =3D rsp->nci_ver;
+			pr_debug("nci_ver 0x%x, config_status 0x%x\n",
+				 rsp->nci_ver, rsp->config_status);
+		}
 =

-	nci_req_complete(ndev, rsp->status);
+		nci_req_complete(ndev, rsp->status);
+	}
 }
 =

-static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_buff =
*skb)
+static u8 nci_core_init_rsp_packet_v1(struct nci_dev *ndev, struct sk_buff=
 *skb)
 {
 	struct nci_core_init_rsp_1 *rsp_1 =3D (void *) skb->data;
 	struct nci_core_init_rsp_2 *rsp_2;
@@ -48,16 +51,14 @@ static void nci_core_init_rsp_packet(struct nci_dev *nd=
ev, struct sk_buff *skb)
 	pr_debug("status 0x%x\n", rsp_1->status);
 =

 	if (rsp_1->status !=3D NCI_STATUS_OK)
-		goto exit;
+		return rsp_1->status;
 =

 	ndev->nfcc_features =3D __le32_to_cpu(rsp_1->nfcc_features);
 	ndev->num_supported_rf_interfaces =3D rsp_1->num_supported_rf_interfaces;
 =

-	if (ndev->num_supported_rf_interfaces >
-	    NCI_MAX_SUPPORTED_RF_INTERFACES) {
-		ndev->num_supported_rf_interfaces =3D
-			NCI_MAX_SUPPORTED_RF_INTERFACES;
-	}
+	ndev->num_supported_rf_interfaces =3D
+		min((int)ndev->num_supported_rf_interfaces,
+		    NCI_MAX_SUPPORTED_RF_INTERFACES);
 =

 	memcpy(ndev->supported_rf_interfaces,
 	       rsp_1->supported_rf_interfaces,
@@ -77,6 +78,58 @@ static void nci_core_init_rsp_packet(struct nci_dev *nde=
v, struct sk_buff *skb)
 	ndev->manufact_specific_info =3D
 		__le32_to_cpu(rsp_2->manufact_specific_info);
 =

+	return NCI_STATUS_OK;
+}
+
+static u8 nci_core_init_rsp_packet_v2(struct nci_dev *ndev, struct sk_buff=
 *skb)
+{
+	struct nci_core_init_rsp_nci_ver2 *rsp =3D (void *)skb->data;
+	u8 *supported_rf_interface =3D rsp->supported_rf_interfaces;
+	u8 rf_interface_idx =3D 0;
+	u8 rf_extension_cnt =3D 0;
+
+	pr_debug("status %x\n", rsp->status);
+
+	if (rsp->status !=3D NCI_STATUS_OK)
+		return rsp->status;
+
+	ndev->nfcc_features =3D __le32_to_cpu(rsp->nfcc_features);
+	ndev->num_supported_rf_interfaces =3D rsp->num_supported_rf_interfaces;
+
+	ndev->num_supported_rf_interfaces =3D
+		min((int)ndev->num_supported_rf_interfaces,
+		    NCI_MAX_SUPPORTED_RF_INTERFACES);
+
+	while (rf_interface_idx < ndev->num_supported_rf_interfaces) {
+		ndev->supported_rf_interfaces[rf_interface_idx++] =3D *supported_rf_inte=
rface++;
+
+		/* skip rf extension parameters */
+		rf_extension_cnt =3D *supported_rf_interface++;
+		supported_rf_interface +=3D rf_extension_cnt;
+	}
+
+	ndev->max_logical_connections =3D rsp->max_logical_connections;
+	ndev->max_routing_table_size =3D
+			__le16_to_cpu(rsp->max_routing_table_size);
+	ndev->max_ctrl_pkt_payload_len =3D
+			rsp->max_ctrl_pkt_payload_len;
+	ndev->max_size_for_large_params =3D NCI_MAX_LARGE_PARAMS_NCI_v2;
+
+	return NCI_STATUS_OK;
+}
+
+static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_buff =
*skb)
+{
+	u8 status =3D 0;
+
+	if (!(ndev->nci_ver & NCI_VER_2_MASK))
+		status =3D nci_core_init_rsp_packet_v1(ndev, skb);
+	else
+		status =3D nci_core_init_rsp_packet_v2(ndev, skb);
+
+	if (status !=3D NCI_STATUS_OK)
+		goto exit;
+
 	pr_debug("nfcc_features 0x%x\n",
 		 ndev->nfcc_features);
 	pr_debug("num_supported_rf_interfaces %d\n",
@@ -103,7 +156,7 @@ static void nci_core_init_rsp_packet(struct nci_dev *nd=
ev, struct sk_buff *skb)
 		 ndev->manufact_specific_info);
 =

 exit:
-	nci_req_complete(ndev, rsp_1->status);
+	nci_req_complete(ndev, status);
 }
 =

 static void nci_core_set_config_rsp_packet(struct nci_dev *ndev,
-- =

2.17.1

--===============1918324923540797699==--

