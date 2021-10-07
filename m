Content-Type: multipart/mixed; boundary="===============7775557871317568861=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH v2 1/7] nfc: drop unneeded debug prints
Date: Thu, 07 Oct 2021 15:30:15 +0200
Message-ID: <20211007133021.32704-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211007133021.32704-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7775557871317568861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/hci/command.c   | 16 ----------------
 net/nfc/hci/llc_shdlc.c | 12 ------------
 net/nfc/llcp_commands.c |  8 --------
 net/nfc/llcp_core.c     |  5 +----
 net/nfc/nci/core.c      |  4 ----
 net/nfc/nci/hci.c       |  4 ----
 net/nfc/nci/ntf.c       |  9 ---------
 7 files changed, 1 insertion(+), 57 deletions(-)

diff --git a/net/nfc/hci/command.c b/net/nfc/hci/command.c
index 3a89bd9b89fc..af6bacb3ba98 100644
--- a/net/nfc/hci/command.c
+++ b/net/nfc/hci/command.c
@@ -114,8 +114,6 @@ int nfc_hci_send_cmd(struct nfc_hci_dev *hdev, u8 gate,=
 u8 cmd,
 {
 	u8 pipe;
 =

-	pr_debug("\n");
-
 	pipe =3D hdev->gate2pipe[gate];
 	if (pipe =3D=3D NFC_HCI_INVALID_PIPE)
 		return -EADDRNOTAVAIL;
@@ -130,8 +128,6 @@ int nfc_hci_send_cmd_async(struct nfc_hci_dev *hdev, u8=
 gate, u8 cmd,
 {
 	u8 pipe;
 =

-	pr_debug("\n");
-
 	pipe =3D hdev->gate2pipe[gate];
 	if (pipe =3D=3D NFC_HCI_INVALID_PIPE)
 		return -EADDRNOTAVAIL;
@@ -205,8 +201,6 @@ static int nfc_hci_open_pipe(struct nfc_hci_dev *hdev, =
u8 pipe)
 =

 static int nfc_hci_close_pipe(struct nfc_hci_dev *hdev, u8 pipe)
 {
-	pr_debug("\n");
-
 	return nfc_hci_execute_cmd(hdev, pipe, NFC_HCI_ANY_CLOSE_PIPE,
 				   NULL, 0, NULL);
 }
@@ -242,8 +236,6 @@ static u8 nfc_hci_create_pipe(struct nfc_hci_dev *hdev,=
 u8 dest_host,
 =

 static int nfc_hci_delete_pipe(struct nfc_hci_dev *hdev, u8 pipe)
 {
-	pr_debug("\n");
-
 	return nfc_hci_execute_cmd(hdev, NFC_HCI_ADMIN_PIPE,
 				   NFC_HCI_ADM_DELETE_PIPE, &pipe, 1, NULL);
 }
@@ -256,8 +248,6 @@ static int nfc_hci_clear_all_pipes(struct nfc_hci_dev *=
hdev)
 	/* TODO: Find out what the identity reference data is
 	 * and fill param with it. HCI spec 6.1.3.5 */
 =

-	pr_debug("\n");
-
 	if (test_bit(NFC_HCI_QUIRK_SHORT_CLEAR, &hdev->quirks))
 		param_len =3D 0;
 =

@@ -271,8 +261,6 @@ int nfc_hci_disconnect_gate(struct nfc_hci_dev *hdev, u=
8 gate)
 	int r;
 	u8 pipe =3D hdev->gate2pipe[gate];
 =

-	pr_debug("\n");
-
 	if (pipe =3D=3D NFC_HCI_INVALID_PIPE)
 		return -EADDRNOTAVAIL;
 =

@@ -296,8 +284,6 @@ int nfc_hci_disconnect_all_gates(struct nfc_hci_dev *hd=
ev)
 {
 	int r;
 =

-	pr_debug("\n");
-
 	r =3D nfc_hci_clear_all_pipes(hdev);
 	if (r < 0)
 		return r;
@@ -314,8 +300,6 @@ int nfc_hci_connect_gate(struct nfc_hci_dev *hdev, u8 d=
est_host, u8 dest_gate,
 	bool pipe_created =3D false;
 	int r;
 =

-	pr_debug("\n");
-
 	if (pipe =3D=3D NFC_HCI_DO_NOT_CREATE_PIPE)
 		return 0;
 =

diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index 71e10347e6a9..e90f70385813 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -363,8 +363,6 @@ static int llc_shdlc_connect_initiate(const struct llc_=
shdlc *shdlc)
 {
 	struct sk_buff *skb;
 =

-	pr_debug("\n");
-
 	skb =3D llc_shdlc_alloc_skb(shdlc, 2);
 	if (skb =3D=3D NULL)
 		return -ENOMEM;
@@ -379,8 +377,6 @@ static int llc_shdlc_connect_send_ua(const struct llc_s=
hdlc *shdlc)
 {
 	struct sk_buff *skb;
 =

-	pr_debug("\n");
-
 	skb =3D llc_shdlc_alloc_skb(shdlc, 0);
 	if (skb =3D=3D NULL)
 		return -ENOMEM;
@@ -570,8 +566,6 @@ static void llc_shdlc_connect_timeout(struct timer_list=
 *t)
 {
 	struct llc_shdlc *shdlc =3D from_timer(shdlc, t, connect_timer);
 =

-	pr_debug("\n");
-
 	schedule_work(&shdlc->sm_work);
 }
 =

@@ -598,8 +592,6 @@ static void llc_shdlc_sm_work(struct work_struct *work)
 	struct llc_shdlc *shdlc =3D container_of(work, struct llc_shdlc, sm_work);
 	int r;
 =

-	pr_debug("\n");
-
 	mutex_lock(&shdlc->state_mutex);
 =

 	switch (shdlc->state) {
@@ -681,8 +673,6 @@ static int llc_shdlc_connect(struct llc_shdlc *shdlc)
 {
 	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(connect_wq);
 =

-	pr_debug("\n");
-
 	mutex_lock(&shdlc->state_mutex);
 =

 	shdlc->state =3D SHDLC_CONNECTING;
@@ -701,8 +691,6 @@ static int llc_shdlc_connect(struct llc_shdlc *shdlc)
 =

 static void llc_shdlc_disconnect(struct llc_shdlc *shdlc)
 {
-	pr_debug("\n");
-
 	mutex_lock(&shdlc->state_mutex);
 =

 	shdlc->state =3D SHDLC_DISCONNECTED;
diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 3c4172a5aeb5..41e3a20c8935 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -337,8 +337,6 @@ int nfc_llcp_send_disconnect(struct nfc_llcp_sock *sock)
 	struct nfc_dev *dev;
 	struct nfc_llcp_local *local;
 =

-	pr_debug("Sending DISC\n");
-
 	local =3D sock->local;
 	if (local =3D=3D NULL)
 		return -ENODEV;
@@ -362,8 +360,6 @@ int nfc_llcp_send_symm(struct nfc_dev *dev)
 	struct nfc_llcp_local *local;
 	u16 size =3D 0;
 =

-	pr_debug("Sending SYMM\n");
-
 	local =3D nfc_llcp_find_local(dev);
 	if (local =3D=3D NULL)
 		return -ENODEV;
@@ -399,8 +395,6 @@ int nfc_llcp_send_connect(struct nfc_llcp_sock *sock)
 	u16 size =3D 0;
 	__be16 miux;
 =

-	pr_debug("Sending CONNECT\n");
-
 	local =3D sock->local;
 	if (local =3D=3D NULL)
 		return -ENODEV;
@@ -475,8 +469,6 @@ int nfc_llcp_send_cc(struct nfc_llcp_sock *sock)
 	u16 size =3D 0;
 	__be16 miux;
 =

-	pr_debug("Sending CC\n");
-
 	local =3D sock->local;
 	if (local =3D=3D NULL)
 		return -ENODEV;
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index eaeb2b1cfa6a..5ad5157aa9c5 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -45,8 +45,6 @@ static void nfc_llcp_socket_purge(struct nfc_llcp_sock *s=
ock)
 	struct nfc_llcp_local *local =3D sock->local;
 	struct sk_buff *s, *tmp;
 =

-	pr_debug("%p\n", &sock->sk);
-
 	skb_queue_purge(&sock->tx_queue);
 	skb_queue_purge(&sock->tx_pending_queue);
 =

@@ -1505,9 +1503,8 @@ void nfc_llcp_recv(void *data, struct sk_buff *skb, i=
nt err)
 {
 	struct nfc_llcp_local *local =3D (struct nfc_llcp_local *) data;
 =

-	pr_debug("Received an LLCP PDU\n");
 	if (err < 0) {
-		pr_err("err %d\n", err);
+		pr_err("LLCP PDU receive err %d\n", err);
 		return;
 	}
 =

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 82ab39d80726..6fd873aa86be 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -930,8 +930,6 @@ static void nci_deactivate_target(struct nfc_dev *nfc_d=
ev,
 	struct nci_dev *ndev =3D nfc_get_drvdata(nfc_dev);
 	unsigned long nci_mode =3D NCI_DEACTIVATE_TYPE_IDLE_MODE;
 =

-	pr_debug("entry\n");
-
 	if (!ndev->target_active_prot) {
 		pr_err("unable to deactivate target, no active target\n");
 		return;
@@ -977,8 +975,6 @@ static int nci_dep_link_down(struct nfc_dev *nfc_dev)
 	struct nci_dev *ndev =3D nfc_get_drvdata(nfc_dev);
 	int rc;
 =

-	pr_debug("entry\n");
-
 	if (nfc_dev->rf_mode =3D=3D NFC_RF_INITIATOR) {
 		nci_deactivate_target(nfc_dev, NULL, NCI_DEACTIVATE_TYPE_IDLE_MODE);
 	} else {
diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index e199912ee1e5..19703a649b5a 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -432,8 +432,6 @@ void nci_hci_data_received_cb(void *context,
 	struct sk_buff *frag_skb;
 	int msg_len;
 =

-	pr_debug("\n");
-
 	if (err) {
 		nci_req_complete(ndev, err);
 		return;
@@ -547,8 +545,6 @@ static u8 nci_hci_create_pipe(struct nci_dev *ndev, u8 =
dest_host,
 =

 static int nci_hci_delete_pipe(struct nci_dev *ndev, u8 pipe)
 {
-	pr_debug("\n");
-
 	return nci_hci_send_cmd(ndev, NCI_HCI_ADMIN_GATE,
 				NCI_HCI_ADM_DELETE_PIPE, &pipe, 1, NULL);
 }
diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
index c5eacaac41ae..282c51051dcc 100644
--- a/net/nfc/nci/ntf.c
+++ b/net/nfc/nci/ntf.c
@@ -738,8 +738,6 @@ static void nci_nfcee_discover_ntf_packet(struct nci_de=
v *ndev,
 	const struct nci_nfcee_discover_ntf *nfcee_ntf =3D
 				(struct nci_nfcee_discover_ntf *)skb->data;
 =

-	pr_debug("\n");
-
 	/* NFCForum NCI 9.2.1 HCI Network Specific Handling
 	 * If the NFCC supports the HCI Network, it SHALL return one,
 	 * and only one, NFCEE_DISCOVER_NTF with a Protocol type of
@@ -751,12 +749,6 @@ static void nci_nfcee_discover_ntf_packet(struct nci_d=
ev *ndev,
 	nci_req_complete(ndev, status);
 }
 =

-static void nci_nfcee_action_ntf_packet(struct nci_dev *ndev,
-					const struct sk_buff *skb)
-{
-	pr_debug("\n");
-}
-
 void nci_ntf_packet(struct nci_dev *ndev, struct sk_buff *skb)
 {
 	__u16 ntf_opcode =3D nci_opcode(skb->data);
@@ -813,7 +805,6 @@ void nci_ntf_packet(struct nci_dev *ndev, struct sk_buf=
f *skb)
 		break;
 =

 	case NCI_OP_RF_NFCEE_ACTION_NTF:
-		nci_nfcee_action_ntf_packet(ndev, skb);
 		break;
 =

 	default:
-- =

2.30.2

--===============7775557871317568861==--

