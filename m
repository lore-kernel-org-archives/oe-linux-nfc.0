Content-Type: multipart/mixed; boundary="===============3253286958534704220=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3] nfc: hci: pass callback data param as pointer in nci_request()
Date: Sat, 31 Jul 2021 12:21:44 +0200
Message-ID: <20210731102144.57764-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3253286958534704220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The nci_request() receives a callback function and unsigned long data
argument "opt" which is passed to the callback.  Almost all of the
nci_request() callers pass pointer to a stack variable as data argument.
Only few pass scalar value (e.g. u8).

All such callbacks do not modify passed data argument and in previous
commit they were made as const.  However passing pointers via unsigned
long removes the const annotation.  The callback could simply cast
unsigned long to a pointer to writeable memory.

Use "const void *" as type of this "opt" argument to solve this and
prevent modifying the pointed contents.  This is also consistent with
generic pattern of passing data arguments - via "void *".  In few places
which pass scalar values, use casts via "unsigned long" to suppress any
warnings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v2:
1. Cast all constants to (void *) to avoid sparse warning "warning:
   Using plain integer as NULL pointer"
---
 include/net/nfc/nci_core.h |   4 +-
 net/nfc/nci/core.c         | 119 ++++++++++++++++++-------------------
 net/nfc/nci/hci.c          |  16 +++--
 3 files changed, 67 insertions(+), 72 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 4770a81f4aa7..a964daedc17b 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -276,8 +276,8 @@ int nci_register_device(struct nci_dev *ndev);
 void nci_unregister_device(struct nci_dev *ndev);
 int nci_request(struct nci_dev *ndev,
 		void (*req)(struct nci_dev *ndev,
-			    unsigned long opt),
-		unsigned long opt, __u32 timeout);
+			    const void *opt),
+		const void *opt, __u32 timeout);
 int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t len,
 		 const __u8 *payload);
 int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, size_t len,
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 80a5c2a8e9fa..82ab39d80726 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -95,8 +95,8 @@ static void nci_req_cancel(struct nci_dev *ndev, int err)
 =

 /* Execute request and wait for completion. */
 static int __nci_request(struct nci_dev *ndev,
-			 void (*req)(struct nci_dev *ndev, unsigned long opt),
-			 unsigned long opt, __u32 timeout)
+			 void (*req)(struct nci_dev *ndev, const void *opt),
+			 const void *opt, __u32 timeout)
 {
 	int rc =3D 0;
 	long completion_rc;
@@ -139,8 +139,8 @@ static int __nci_request(struct nci_dev *ndev,
 =

 inline int nci_request(struct nci_dev *ndev,
 		       void (*req)(struct nci_dev *ndev,
-				   unsigned long opt),
-		       unsigned long opt, __u32 timeout)
+				   const void *opt),
+		       const void *opt, __u32 timeout)
 {
 	int rc;
 =

@@ -155,7 +155,7 @@ inline int nci_request(struct nci_dev *ndev,
 	return rc;
 }
 =

-static void nci_reset_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_reset_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_core_reset_cmd cmd;
 =

@@ -163,17 +163,17 @@ static void nci_reset_req(struct nci_dev *ndev, unsig=
ned long opt)
 	nci_send_cmd(ndev, NCI_OP_CORE_RESET_CMD, 1, &cmd);
 }
 =

-static void nci_init_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_init_req(struct nci_dev *ndev, const void *opt)
 {
 	u8 plen =3D 0;
 =

 	if (opt)
 		plen =3D sizeof(struct nci_core_init_v2_cmd);
 =

-	nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, plen, (void *)opt);
+	nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, plen, opt);
 }
 =

-static void nci_init_complete_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_init_complete_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_rf_disc_map_cmd cmd;
 	struct disc_map_config *cfg =3D cmd.mapping_configs;
@@ -215,10 +215,9 @@ struct nci_set_config_param {
 	const __u8	*val;
 };
 =

-static void nci_set_config_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_set_config_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_set_config_param *param =3D
-		(struct nci_set_config_param *)opt;
+	const struct nci_set_config_param *param =3D opt;
 	struct nci_core_set_config_cmd cmd;
 =

 	BUG_ON(param->len > NCI_MAX_PARAM_LEN);
@@ -236,10 +235,9 @@ struct nci_rf_discover_param {
 	__u32	tm_protocols;
 };
 =

-static void nci_rf_discover_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_rf_discover_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_rf_discover_param *param =3D
-		(struct nci_rf_discover_param *)opt;
+	const struct nci_rf_discover_param *param =3D opt;
 	struct nci_rf_disc_cmd cmd;
 =

 	cmd.num_disc_configs =3D 0;
@@ -302,10 +300,9 @@ struct nci_rf_discover_select_param {
 	__u8	rf_protocol;
 };
 =

-static void nci_rf_discover_select_req(struct nci_dev *ndev, unsigned long=
 opt)
+static void nci_rf_discover_select_req(struct nci_dev *ndev, const void *o=
pt)
 {
-	const struct nci_rf_discover_select_param *param =3D
-		(struct nci_rf_discover_select_param *)opt;
+	const struct nci_rf_discover_select_param *param =3D opt;
 	struct nci_rf_discover_select_cmd cmd;
 =

 	cmd.rf_discovery_id =3D param->rf_discovery_id;
@@ -329,11 +326,11 @@ static void nci_rf_discover_select_req(struct nci_dev=
 *ndev, unsigned long opt)
 		     sizeof(struct nci_rf_discover_select_cmd), &cmd);
 }
 =

-static void nci_rf_deactivate_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_rf_deactivate_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_rf_deactivate_cmd cmd;
 =

-	cmd.type =3D opt;
+	cmd.type =3D (unsigned long)opt;
 =

 	nci_send_cmd(ndev, NCI_OP_RF_DEACTIVATE_CMD,
 		     sizeof(struct nci_rf_deactivate_cmd), &cmd);
@@ -345,10 +342,9 @@ struct nci_cmd_param {
 	const __u8 *payload;
 };
 =

-static void nci_generic_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_generic_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_cmd_param *param =3D
-		(struct nci_cmd_param *)opt;
+	const struct nci_cmd_param *param =3D opt;
 =

 	nci_send_cmd(ndev, param->opcode, param->len, param->payload);
 }
@@ -361,7 +357,7 @@ int nci_prop_cmd(struct nci_dev *ndev, __u8 oid, size_t=
 len, const __u8 *payload
 	param.len =3D len;
 	param.payload =3D payload;
 =

-	return __nci_request(ndev, nci_generic_req, (unsigned long)&param,
+	return __nci_request(ndev, nci_generic_req, &param,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_prop_cmd);
@@ -375,21 +371,21 @@ int nci_core_cmd(struct nci_dev *ndev, __u16 opcode, =
size_t len,
 	param.len =3D len;
 	param.payload =3D payload;
 =

-	return __nci_request(ndev, nci_generic_req, (unsigned long)&param,
+	return __nci_request(ndev, nci_generic_req, &param,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_cmd);
 =

 int nci_core_reset(struct nci_dev *ndev)
 {
-	return __nci_request(ndev, nci_reset_req, 0,
+	return __nci_request(ndev, nci_reset_req, (void *)0,
 			     msecs_to_jiffies(NCI_RESET_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_reset);
 =

 int nci_core_init(struct nci_dev *ndev)
 {
-	return __nci_request(ndev, nci_init_req, 0,
+	return __nci_request(ndev, nci_init_req, (void *)0,
 			     msecs_to_jiffies(NCI_INIT_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_init);
@@ -399,9 +395,9 @@ struct nci_loopback_data {
 	struct sk_buff *data;
 };
 =

-static void nci_send_data_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_send_data_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_loopback_data *data =3D (struct nci_loopback_data *)opt;
+	const struct nci_loopback_data *data =3D opt;
 =

 	nci_send_data(ndev, data->conn_id, data->data);
 }
@@ -462,7 +458,7 @@ int nci_nfcc_loopback(struct nci_dev *ndev, const void =
*data, size_t data_len,
 	loopback_data.data =3D skb;
 =

 	ndev->cur_conn_id =3D conn_id;
-	r =3D nci_request(ndev, nci_send_data_req, (unsigned long)&loopback_data,
+	r =3D nci_request(ndev, nci_send_data_req, &loopback_data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 	if (r =3D=3D NCI_STATUS_OK && resp)
 		*resp =3D conn_info->rx_skb;
@@ -495,7 +491,7 @@ static int nci_open_device(struct nci_dev *ndev)
 		rc =3D ndev->ops->init(ndev);
 =

 	if (!rc) {
-		rc =3D __nci_request(ndev, nci_reset_req, 0,
+		rc =3D __nci_request(ndev, nci_reset_req, (void *)0,
 				   msecs_to_jiffies(NCI_RESET_TIMEOUT));
 	}
 =

@@ -508,10 +504,10 @@ static int nci_open_device(struct nci_dev *ndev)
 			.feature1 =3D NCI_FEATURE_DISABLE,
 			.feature2 =3D NCI_FEATURE_DISABLE
 		};
-		unsigned long opt =3D 0;
+		const void *opt =3D NULL;
 =

 		if (ndev->nci_ver & NCI_VER_2_MASK)
-			opt =3D (unsigned long)&nci_init_v2_cmd;
+			opt =3D &nci_init_v2_cmd;
 =

 		rc =3D __nci_request(ndev, nci_init_req, opt,
 				   msecs_to_jiffies(NCI_INIT_TIMEOUT));
@@ -521,7 +517,7 @@ static int nci_open_device(struct nci_dev *ndev)
 		rc =3D ndev->ops->post_setup(ndev);
 =

 	if (!rc) {
-		rc =3D __nci_request(ndev, nci_init_complete_req, 0,
+		rc =3D __nci_request(ndev, nci_init_complete_req, (void *)0,
 				   msecs_to_jiffies(NCI_INIT_TIMEOUT));
 	}
 =

@@ -571,7 +567,7 @@ static int nci_close_device(struct nci_dev *ndev)
 	atomic_set(&ndev->cmd_cnt, 1);
 =

 	set_bit(NCI_INIT, &ndev->flags);
-	__nci_request(ndev, nci_reset_req, 0,
+	__nci_request(ndev, nci_reset_req, (void *)0,
 		      msecs_to_jiffies(NCI_RESET_TIMEOUT));
 =

 	/* After this point our queues are empty
@@ -637,15 +633,15 @@ int nci_set_config(struct nci_dev *ndev, __u8 id, siz=
e_t len, const __u8 *val)
 	param.len =3D len;
 	param.val =3D val;
 =

-	return __nci_request(ndev, nci_set_config_req, (unsigned long)&param,
+	return __nci_request(ndev, nci_set_config_req, &param,
 			     msecs_to_jiffies(NCI_SET_CONFIG_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_set_config);
 =

-static void nci_nfcee_discover_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_nfcee_discover_req(struct nci_dev *ndev, const void *opt)
 {
 	struct nci_nfcee_discover_cmd cmd;
-	__u8 action =3D opt;
+	__u8 action =3D (unsigned long)opt;
 =

 	cmd.discovery_action =3D action;
 =

@@ -654,15 +650,16 @@ static void nci_nfcee_discover_req(struct nci_dev *nd=
ev, unsigned long opt)
 =

 int nci_nfcee_discover(struct nci_dev *ndev, u8 action)
 {
-	return __nci_request(ndev, nci_nfcee_discover_req, action,
+	unsigned long opt =3D action;
+
+	return __nci_request(ndev, nci_nfcee_discover_req, (void *)opt,
 				msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_nfcee_discover);
 =

-static void nci_nfcee_mode_set_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_nfcee_mode_set_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_nfcee_mode_set_cmd *cmd =3D
-					(struct nci_nfcee_mode_set_cmd *)opt;
+	const struct nci_nfcee_mode_set_cmd *cmd =3D opt;
 =

 	nci_send_cmd(ndev, NCI_OP_NFCEE_MODE_SET_CMD,
 		     sizeof(struct nci_nfcee_mode_set_cmd), cmd);
@@ -675,16 +672,14 @@ int nci_nfcee_mode_set(struct nci_dev *ndev, u8 nfcee=
_id, u8 nfcee_mode)
 	cmd.nfcee_id =3D nfcee_id;
 	cmd.nfcee_mode =3D nfcee_mode;
 =

-	return __nci_request(ndev, nci_nfcee_mode_set_req,
-			     (unsigned long)&cmd,
+	return __nci_request(ndev, nci_nfcee_mode_set_req, &cmd,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_nfcee_mode_set);
 =

-static void nci_core_conn_create_req(struct nci_dev *ndev, unsigned long o=
pt)
+static void nci_core_conn_create_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct core_conn_create_data *data =3D
-					(struct core_conn_create_data *)opt;
+	const struct core_conn_create_data *data =3D opt;
 =

 	nci_send_cmd(ndev, NCI_OP_CORE_CONN_CREATE_CMD, data->length, data->cmd);
 }
@@ -721,24 +716,26 @@ int nci_core_conn_create(struct nci_dev *ndev, u8 des=
tination_type,
 	}
 	ndev->cur_dest_type =3D destination_type;
 =

-	r =3D __nci_request(ndev, nci_core_conn_create_req, (unsigned long)&data,
+	r =3D __nci_request(ndev, nci_core_conn_create_req, &data,
 			  msecs_to_jiffies(NCI_CMD_TIMEOUT));
 	kfree(cmd);
 	return r;
 }
 EXPORT_SYMBOL(nci_core_conn_create);
 =

-static void nci_core_conn_close_req(struct nci_dev *ndev, unsigned long op=
t)
+static void nci_core_conn_close_req(struct nci_dev *ndev, const void *opt)
 {
-	__u8 conn_id =3D opt;
+	__u8 conn_id =3D (unsigned long)opt;
 =

 	nci_send_cmd(ndev, NCI_OP_CORE_CONN_CLOSE_CMD, 1, &conn_id);
 }
 =

 int nci_core_conn_close(struct nci_dev *ndev, u8 conn_id)
 {
+	unsigned long opt =3D conn_id;
+
 	ndev->cur_conn_id =3D conn_id;
-	return __nci_request(ndev, nci_core_conn_close_req, conn_id,
+	return __nci_request(ndev, nci_core_conn_close_req, (void *)opt,
 			     msecs_to_jiffies(NCI_CMD_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_core_conn_close);
@@ -758,14 +755,14 @@ static int nci_set_local_general_bytes(struct nfc_dev=
 *nfc_dev)
 =

 	param.id =3D NCI_PN_ATR_REQ_GEN_BYTES;
 =

-	rc =3D nci_request(ndev, nci_set_config_req, (unsigned long)&param,
+	rc =3D nci_request(ndev, nci_set_config_req, &param,
 			 msecs_to_jiffies(NCI_SET_CONFIG_TIMEOUT));
 	if (rc)
 		return rc;
 =

 	param.id =3D NCI_LN_ATR_RES_GEN_BYTES;
 =

-	return nci_request(ndev, nci_set_config_req, (unsigned long)&param,
+	return nci_request(ndev, nci_set_config_req, &param,
 			   msecs_to_jiffies(NCI_SET_CONFIG_TIMEOUT));
 }
 =

@@ -815,7 +812,7 @@ static int nci_start_poll(struct nfc_dev *nfc_dev,
 		pr_debug("target active or w4 select, implicitly deactivate\n");
 =

 		rc =3D nci_request(ndev, nci_rf_deactivate_req,
-				 NCI_DEACTIVATE_TYPE_IDLE_MODE,
+				 (void *)NCI_DEACTIVATE_TYPE_IDLE_MODE,
 				 msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 		if (rc)
 			return -EBUSY;
@@ -837,7 +834,7 @@ static int nci_start_poll(struct nfc_dev *nfc_dev,
 =

 	param.im_protocols =3D im_protocols;
 	param.tm_protocols =3D tm_protocols;
-	rc =3D nci_request(ndev, nci_rf_discover_req, (unsigned long)&param,
+	rc =3D nci_request(ndev, nci_rf_discover_req, &param,
 			 msecs_to_jiffies(NCI_RF_DISC_TIMEOUT));
 =

 	if (!rc)
@@ -856,7 +853,8 @@ static void nci_stop_poll(struct nfc_dev *nfc_dev)
 		return;
 	}
 =

-	nci_request(ndev, nci_rf_deactivate_req, NCI_DEACTIVATE_TYPE_IDLE_MODE,
+	nci_request(ndev, nci_rf_deactivate_req,
+		    (void *)NCI_DEACTIVATE_TYPE_IDLE_MODE,
 		    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 }
 =

@@ -915,8 +913,7 @@ static int nci_activate_target(struct nfc_dev *nfc_dev,
 		else
 			param.rf_protocol =3D NCI_RF_PROTOCOL_NFC_DEP;
 =

-		rc =3D nci_request(ndev, nci_rf_discover_select_req,
-				 (unsigned long)&param,
+		rc =3D nci_request(ndev, nci_rf_discover_select_req, &param,
 				 msecs_to_jiffies(NCI_RF_DISC_SELECT_TIMEOUT));
 	}
 =

@@ -931,7 +928,7 @@ static void nci_deactivate_target(struct nfc_dev *nfc_d=
ev,
 				  __u8 mode)
 {
 	struct nci_dev *ndev =3D nfc_get_drvdata(nfc_dev);
-	u8 nci_mode =3D NCI_DEACTIVATE_TYPE_IDLE_MODE;
+	unsigned long nci_mode =3D NCI_DEACTIVATE_TYPE_IDLE_MODE;
 =

 	pr_debug("entry\n");
 =

@@ -949,7 +946,7 @@ static void nci_deactivate_target(struct nfc_dev *nfc_d=
ev,
 	}
 =

 	if (atomic_read(&ndev->state) =3D=3D NCI_POLL_ACTIVE) {
-		nci_request(ndev, nci_rf_deactivate_req, nci_mode,
+		nci_request(ndev, nci_rf_deactivate_req, (void *)nci_mode,
 			    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 	}
 }
@@ -987,8 +984,8 @@ static int nci_dep_link_down(struct nfc_dev *nfc_dev)
 	} else {
 		if (atomic_read(&ndev->state) =3D=3D NCI_LISTEN_ACTIVE ||
 		    atomic_read(&ndev->state) =3D=3D NCI_DISCOVERY) {
-			nci_request(ndev, nci_rf_deactivate_req, 0,
-				msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
+			nci_request(ndev, nci_rf_deactivate_req, (void *)0,
+				    msecs_to_jiffies(NCI_RF_DEACTIVATE_TIMEOUT));
 		}
 =

 		rc =3D nfc_tm_deactivated(nfc_dev);
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index a8ff794a8084..e199912ee1e5 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -195,9 +195,9 @@ static int nci_hci_send_data(struct nci_dev *ndev, u8 p=
ipe,
 	return i;
 }
 =

-static void nci_hci_send_data_req(struct nci_dev *ndev, unsigned long opt)
+static void nci_hci_send_data_req(struct nci_dev *ndev, const void *opt)
 {
-	const struct nci_data *data =3D (struct nci_data *)opt;
+	const struct nci_data *data =3D opt;
 =

 	nci_hci_send_data(ndev, data->pipe, data->cmd,
 			  data->data, data->data_len);
@@ -240,7 +240,7 @@ int nci_hci_send_cmd(struct nci_dev *ndev, u8 gate, u8 =
cmd,
 	data.data =3D param;
 	data.data_len =3D param_len;
 =

-	r =3D nci_request(ndev, nci_hci_send_data_req, (unsigned long)&data,
+	r =3D nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 	if (r =3D=3D NCI_STATUS_OK) {
 		message =3D (struct nci_hcp_message *)conn_info->rx_skb->data;
@@ -511,9 +511,8 @@ int nci_hci_open_pipe(struct nci_dev *ndev, u8 pipe)
 	data.data =3D NULL;
 	data.data_len =3D 0;
 =

-	return nci_request(ndev, nci_hci_send_data_req,
-			(unsigned long)&data,
-			msecs_to_jiffies(NCI_DATA_TIMEOUT));
+	return nci_request(ndev, nci_hci_send_data_req, &data,
+			   msecs_to_jiffies(NCI_DATA_TIMEOUT));
 }
 EXPORT_SYMBOL(nci_hci_open_pipe);
 =

@@ -587,8 +586,7 @@ int nci_hci_set_param(struct nci_dev *ndev, u8 gate, u8=
 idx,
 	data.data =3D tmp;
 	data.data_len =3D param_len + 1;
 =

-	r =3D nci_request(ndev, nci_hci_send_data_req,
-			(unsigned long)&data,
+	r =3D nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 	if (r =3D=3D NCI_STATUS_OK) {
 		message =3D (struct nci_hcp_message *)conn_info->rx_skb->data;
@@ -627,7 +625,7 @@ int nci_hci_get_param(struct nci_dev *ndev, u8 gate, u8=
 idx,
 	data.data =3D &idx;
 	data.data_len =3D 1;
 =

-	r =3D nci_request(ndev, nci_hci_send_data_req, (unsigned long)&data,
+	r =3D nci_request(ndev, nci_hci_send_data_req, &data,
 			msecs_to_jiffies(NCI_DATA_TIMEOUT));
 =

 	if (r =3D=3D NCI_STATUS_OK) {
-- =

2.27.0

--===============3253286958534704220==--

