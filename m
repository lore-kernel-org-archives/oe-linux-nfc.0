Content-Type: multipart/mixed; boundary="===============6101902614723634781=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 25/34] adapter: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:42 +0200
Message-ID: <20210711202351.18363-13-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6101902614723634781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    src/adapter.c: In function =E2=80=98near_adapter_disconnect=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 4 has type =E2=80=98ui=
nt32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    src/adapter.c:1095:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
     1095 |  DBG("idx %d", idx);
          |  ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/adapter.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index 5a8f083a686c..420127f4f396 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -566,7 +566,7 @@ struct near_adapter *__near_adapter_create(uint32_t idx,
 							NULL, free_device);
 	adapter->device_sock =3D -1;
 =

-	adapter->path =3D g_strdup_printf("%s/nfc%d", NFC_PATH, idx);
+	adapter->path =3D g_strdup_printf("%s/nfc%u", NFC_PATH, idx);
 =

 	return adapter;
 }
@@ -597,7 +597,7 @@ int __near_adapter_set_dep_state(uint32_t idx, bool dep)
 {
 	struct near_adapter *adapter;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -639,7 +639,7 @@ bool __near_adapter_get_dep_state(uint32_t idx)
 {
 	struct near_adapter *adapter;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -821,7 +821,7 @@ int __near_adapter_add_target(uint32_t idx, uint32_t ta=
rget_idx,
 	struct near_adapter *adapter;
 	int ret;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -852,7 +852,7 @@ int __near_adapter_remove_target(uint32_t idx, uint32_t=
 target_idx)
 {
 	struct near_adapter *adapter;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -875,11 +875,11 @@ static gboolean poll_error(gpointer user_data)
 	struct near_adapter *adapter =3D user_data;
 	bool reset;
 =

-	DBG("adapter %d", adapter->idx);
+	DBG("adapter %u", adapter->idx);
 =

 	reset =3D near_setting_get_bool("ResetOnError");
 	if (reset) {
-		near_error("Resetting nfc%d", adapter->idx);
+		near_error("Resetting nfc%u", adapter->idx);
 		 __near_netlink_adapter_enable(adapter->idx, false);
 		 __near_netlink_adapter_enable(adapter->idx, true);
 	}
@@ -893,7 +893,7 @@ int __near_adapter_get_targets_done(uint32_t idx)
 {
 	struct near_adapter *adapter;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -920,7 +920,7 @@ int __near_adapter_add_device(uint32_t idx, uint8_t *nf=
cid, uint8_t nfcid_len)
 	struct near_adapter *adapter;
 	int ret;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -944,7 +944,7 @@ int __near_adapter_remove_device(uint32_t idx)
 	struct near_adapter *adapter;
 	uint32_t device_idx =3D 0;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -1040,7 +1040,7 @@ int near_adapter_connect(uint32_t idx, uint32_t targe=
t_idx, uint8_t protocol)
 	struct sockaddr_nfc addr;
 	int err, sock;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -1092,7 +1092,7 @@ int near_adapter_disconnect(uint32_t idx)
 	uint32_t target_idx;
 	uint16_t tag_type;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter)
@@ -1106,7 +1106,7 @@ int near_adapter_disconnect(uint32_t idx)
 	tag_type =3D __near_tag_get_type(adapter->tag_link);
 	target_idx =3D near_tag_get_target_idx(adapter->tag_link);
 =

-	DBG("tag type %d", tag_type);
+	DBG("tag type %u", tag_type);
 =

 	__near_adapter_remove_target(adapter->idx, target_idx);
 =

@@ -1133,7 +1133,7 @@ int near_adapter_send(uint32_t idx, uint8_t *buf, siz=
e_t length,
 	struct near_adapter_ioreq *req =3D NULL;
 	int err;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D g_hash_table_lookup(adapter_hash, GINT_TO_POINTER(idx));
 	if (!adapter) {
-- =

2.27.0

--===============6101902614723634781==--

