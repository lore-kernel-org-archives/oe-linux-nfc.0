Content-Type: multipart/mixed; boundary="===============4661755351919482833=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 16/34] nfctool: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:33 +0200
Message-ID: <20210711202351.18363-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4661755351919482833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print igned and nsigned integers.  This fixes warnings like:

    In file included from tools/nfctool/main.c:37:
    tools/nfctool/main.c: In function =E2=80=98nfctool_start_poll=E2=80=99:
    tools/nfctool/main.c:73:15: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=98gu=
int32=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       73 |   print_error("Invalid adapter index: %d", opts.adapter_idx);
          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~~
          |                                                |
          |                                                guint32 {aka uns=
igned int}
    tools/nfctool/llcp-decode.c: In function =E2=80=98llcp_print_params=E2=
=80=99:
    tools/nfctool/llcp-decode.c:276:27: error: format =E2=80=98%X=E2=80=99 =
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has=
 type =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
      276 |    sprintf(param_str, "0x%X", param[2] & 0x03);
          |                          ~^   ~~~~~~~~~~~~~~~
          |                           |            |
          |                           unsigned int int
          |                          %X
    tools/nfctool/llcp-decode.c: In function =E2=80=98llcp_print_pdu=E2=80=
=99:
    tools/nfctool/llcp-decode.c:553:27: error: format =E2=80=98%lu=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 4 has type =E2=80=98__time_t=E2=80=99 {aka =E2=80=98long int=E2=80=99} [-W=
error=3Dformat=3D]
      553 |   sprintf(time_str,  "%c%lu.%06lus", prefix, msg_timestamp.tv_s=
ec,
          |                         ~~^                  ~~~~~~~~~~~~~~~~~~=
~~
          |                           |                               |
          |                           long unsigned int               __tim=
e_t {aka long int}
          |                         %lu

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/adapter.c     |  4 ++--
 tools/nfctool/llcp-decode.c |  4 ++--
 tools/nfctool/main.c        | 20 ++++++++++----------
 tools/nfctool/sniffer.c     |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/nfctool/adapter.c b/tools/nfctool/adapter.c
index 343c4ab7d0ff..5e076782e373 100644
--- a/tools/nfctool/adapter.c
+++ b/tools/nfctool/adapter.c
@@ -85,7 +85,7 @@ void adapter_print_info(struct nfc_adapter *adapter, gpoi=
nter user_data)
 	if (!adapter)
 		return;
 =

-	printf("nfc%d:\n", adapter->idx);
+	printf("nfc%u:\n", adapter->idx);
 =

 	adpater_print_targets(adapter, "          ");
 =

@@ -164,7 +164,7 @@ struct nfc_adapter *adapter_get(guint32 idx)
 =

 void adapter_add_target(struct nfc_adapter *adapter, guint8 type, guint32 =
idx)
 {
-	DBG("adapter_idx: %d, target_type: %d, target_idx: %d",
+	DBG("adapter_idx: %u, target_type: %u, target_idx: %u",
 	    adapter->idx, type, idx);
 =

 	if (type =3D=3D TARGET_TYPE_TAG)
diff --git a/tools/nfctool/llcp-decode.c b/tools/nfctool/llcp-decode.c
index 13e7ba759218..3aa222f0f39e 100644
--- a/tools/nfctool/llcp-decode.c
+++ b/tools/nfctool/llcp-decode.c
@@ -273,7 +273,7 @@ static void llcp_print_params(struct sniffer_packet *pa=
cket)
 			break;
 =

 		case LLCP_PARAM_OPT:
-			sprintf(param_str, "0x%X", param[2] & 0x03);
+			sprintf(param_str, "0x%X", (unsigned int)param[2] & 0x03);
 			break;
 =

 		case LLCP_PARAM_SDREQ:
@@ -550,7 +550,7 @@ int llcp_print_pdu(guint8 *data, guint32 data_len, stru=
ct timeval *timestamp)
 			prefix =3D '+';
 		}
 =

-		sprintf(time_str,  "%c%lu.%06lus", prefix, msg_timestamp.tv_sec,
+		sprintf(time_str,  "%c%ld.%06lds", prefix, msg_timestamp.tv_sec,
 							msg_timestamp.tv_usec);
 	}
 =

diff --git a/tools/nfctool/main.c b/tools/nfctool/main.c
index 72a39de3ccbf..65a0c15a9465 100644
--- a/tools/nfctool/main.c
+++ b/tools/nfctool/main.c
@@ -70,7 +70,7 @@ static int nfctool_start_poll(void)
 	adapter =3D adapter_get(opts.adapter_idx);
 =

 	if (!adapter) {
-		print_error("Invalid adapter index: %d", opts.adapter_idx);
+		print_error("Invalid adapter index: %u", opts.adapter_idx);
 =

 		return -ENODEV;
 	}
@@ -81,7 +81,7 @@ static int nfctool_start_poll(void)
 	err =3D nl_start_poll(adapter, opts.poll_mode);
 =

 	if (err =3D=3D 0) {
-		printf("Start polling on nfc%d as %s\n\n",
+		printf("Start polling on nfc%u as %s\n\n",
 			adapter->idx, nfctool_poll_mode_str(opts.poll_mode));
 		return 0;
 	}
@@ -90,9 +90,9 @@ static int nfctool_start_poll(void)
 		return err;
 =

 	if (adapter->rf_mode =3D=3D NFC_RF_NONE)
-		printf("nfc%d already in polling mode\n\n", adapter->idx);
+		printf("nfc%u already in polling mode\n\n", adapter->idx);
 	else
-		printf("nfc%d already activated\n\n", adapter->idx);
+		printf("nfc%u already activated\n\n", adapter->idx);
 =

 	/* Don't fail if there is a pending SNL request */
 	if (opts.snl)
@@ -201,7 +201,7 @@ static int nfctool_dep_link_up_cb(guint8 cmd, guint32 i=
dx, gpointer data)
 {
 	struct nfc_adapter *adapter;
 =

-	printf("Link is UP for adapter nfc%d\n\n", idx);
+	printf("Link is UP for adapter nfc%u\n\n", idx);
 =

 	if (idx !=3D opts.adapter_idx)
 		return -ENODEV;
@@ -220,7 +220,7 @@ static int nfctool_dep_link_down_cb(guint8 cmd, guint32=
 idx, gpointer data)
 	if (idx !=3D opts.adapter_idx)
 		return -ENODEV;
 =

-	printf("Link is DOWN for adapter nfc%d\n\n", idx);
+	printf("Link is DOWN for adapter nfc%u\n\n", idx);
 =

 	opts.snl =3D false;
 =

@@ -269,7 +269,7 @@ static int nfctool_targets_found(guint32 adapter_idx)
 	int err;
 	struct nfc_adapter *adapter;
 =

-	DBG("adapter_idx: %d", adapter_idx);
+	DBG("adapter_idx: %u", adapter_idx);
 =

 	if (adapter_idx =3D=3D INVALID_ADAPTER_IDX)
 		return -ENODEV;
@@ -285,7 +285,7 @@ static int nfctool_targets_found(guint32 adapter_idx)
 		goto exit;
 	}
 =

-	printf("Targets found for nfc%d\n", adapter_idx);
+	printf("Targets found for nfc%u\n", adapter_idx);
 	adpater_print_targets(adapter, "  ");
 	printf("\n");
 =

@@ -308,7 +308,7 @@ static int nfctool_poll_cb(guint8 cmd, guint32 idx, gpo=
inter data)
 	if (idx !=3D opts.adapter_idx)
 		return 0;
 =

-	DBG("cmd: %d, idx: %d", cmd, idx);
+	DBG("cmd: %u, idx: %u", cmd, idx);
 =

 	switch (cmd) {
 	case NFC_EVENT_TARGETS_FOUND:
@@ -347,7 +347,7 @@ static int nfctool_snl_cb(guint8 cmd, guint32 idx, gpoi=
nter data)
 {
 	GSList *sdres_list =3D (GSList *)data;
 =

-	printf("nfc%d: Service Name lookup:\n", idx);
+	printf("nfc%u: Service Name lookup:\n", idx);
 =

 	g_slist_foreach(sdres_list, (GFunc)nfctool_print_and_remove_snl,
 			GINT_TO_POINTER(idx));
diff --git a/tools/nfctool/sniffer.c b/tools/nfctool/sniffer.c
index 71ac612ea924..3d1d230a50c5 100644
--- a/tools/nfctool/sniffer.c
+++ b/tools/nfctool/sniffer.c
@@ -369,7 +369,7 @@ int sniffer_init(void)
 	if (err)
 		goto exit;
 =

-	printf("Start sniffer on nfc%d\n\n", opts.adapter_idx);
+	printf("Start sniffer on nfc%u\n\n", opts.adapter_idx);
 =

 exit:
 	if (err)
-- =

2.27.0

--===============4661755351919482833==--

