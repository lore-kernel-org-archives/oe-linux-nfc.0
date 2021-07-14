Content-Type: multipart/mixed; boundary="===============2529362486578839719=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 11/16] ndef: make freeing near_ndef_message reusable
Date: Wed, 14 Jul 2021 13:05:13 +0200
Message-ID: <20210714110518.104655-12-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2529362486578839719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In few places the ndef record/message (struct near_ndef_message) is
allocated and not freed leading to memory leaks.  In few places it is
also open-coded.  Rename free_ndef_message() to near_ndef_msg_free()
and allow other parts to use it.  No functional change, except global
symbol.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/ndef.h |  1 +
 src/ndef.c     | 56 +++++++++++++++++++++++++-------------------------
 2 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/include/ndef.h b/include/ndef.h
index 5abdf343ee07..a21eed2654e9 100644
--- a/include/ndef.h
+++ b/include/ndef.h
@@ -44,6 +44,7 @@ GList *near_ndef_parse_msg(uint8_t *ndef_data, size_t nde=
f_length,
 					struct near_ndef_message **reply);
 =

 void near_ndef_records_free(GList *records);
+void near_ndef_msg_free(struct near_ndef_message *record);
 =

 struct near_ndef_message *near_ndef_prepare_text_record(char *encoding,
 					char *language_code, char *text);
diff --git a/src/ndef.c b/src/ndef.c
index 66faf7867399..3dd8838ef9e6 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -832,15 +832,6 @@ static void free_ndef_record(struct near_ndef_record *=
record)
 	g_free(record);
 }
 =

-static void free_ndef_message(struct near_ndef_message *msg)
-{
-	if (!msg)
-		return;
-
-	g_free(msg->data);
-	g_free(msg);
-}
-
 void __near_ndef_record_free(struct near_ndef_record *record)
 {
 	g_dbus_unregister_interface(connection, record->path,
@@ -1752,7 +1743,7 @@ static struct near_ndef_message *ndef_message_alloc_c=
omplete(char *type_name,
 =

 fail:
 	near_error("ndef message struct allocation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 =

 	return NULL;
 }
@@ -2015,8 +2006,8 @@ static int near_ndef_prepare_ac_and_cfg_records(enum =
record_type type,
 	g_free(local_carrier);
 =

 	if (!*cfg || !*ac) {
-		free_ndef_message(*ac);
-		free_ndef_message(*cfg);
+		near_ndef_msg_free(*ac);
+		near_ndef_msg_free(*cfg);
 =

 		return -ENOMEM;
 	}
@@ -2028,7 +2019,7 @@ static void free_ndef_list(gpointer data)
 {
 	struct near_ndef_message *msg =3D data;
 =

-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 }
 =

 static struct near_ndef_message *prepare_handover_message_header(char *typ=
e,
@@ -2149,13 +2140,13 @@ static struct near_ndef_message *near_ndef_prepare_=
empty_hs_message(void)
 	if (hs_msg->offset > hs_msg->length)
 		goto fail;
 =

-	free_ndef_message(ac_msg);
+	near_ndef_msg_free(ac_msg);
 =

 	return hs_msg;
 =

 fail:
-	free_ndef_message(ac_msg);
-	free_ndef_message(hs_msg);
+	near_ndef_msg_free(ac_msg);
+	near_ndef_msg_free(hs_msg);
 =

 	return NULL;
 }
@@ -2272,7 +2263,7 @@ fail:
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
 =

-	free_ndef_message(hs_msg);
+	near_ndef_msg_free(hs_msg);
 =

 	return NULL;
 }
@@ -2406,7 +2397,7 @@ near_ndef_prepare_ho_message(enum record_type type, G=
SList *carriers)
 =

 	DBG("Handover message preparation is done");
 =

-	free_ndef_message(cr_msg);
+	near_ndef_msg_free(cr_msg);
 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
 =

@@ -2417,8 +2408,8 @@ fail:
 =

 	g_list_free_full(ac_msgs, free_ndef_list);
 	g_list_free_full(cfg_msgs, free_ndef_list);
-	free_ndef_message(cr_msg);
-	free_ndef_message(ho_msg);
+	near_ndef_msg_free(cr_msg);
+	near_ndef_msg_free(ho_msg);
 =

 	return NULL;
 }
@@ -2999,6 +2990,15 @@ void near_ndef_records_free(GList *records)
 	g_list_free(records);
 }
 =

+void near_ndef_msg_free(struct near_ndef_message *msg)
+{
+	if (!msg)
+		return;
+
+	g_free(msg->data);
+	g_free(msg);
+}
+
 /*
  * Compute ndef records length, even though the submitted frame is incompl=
ete.
  * This code is used in the handover read function, as we have to "guess" =
the
@@ -3166,7 +3166,7 @@ struct near_ndef_message *near_ndef_prepare_text_reco=
rd(char *encoding,
 =

 fail:
 	near_error("text record preparation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 =

 	return NULL;
 }
@@ -3205,7 +3205,7 @@ struct near_ndef_message *near_ndef_prepare_uri_recor=
d(uint8_t identifier,
 =

 fail:
 	near_error("uri record preparation failed");
-	free_ndef_message(msg);
+	near_ndef_msg_free(msg);
 =

 	return NULL;
 }
@@ -3234,15 +3234,15 @@ near_ndef_prepare_smartposter_record(uint8_t uri_id=
entifier,
 	if (msg->offset > msg->length)
 		goto fail;
 =

-	free_ndef_message(uri);
+	near_ndef_msg_free(uri);
 =

 	return msg;
 =

 fail:
 	near_error("smartposter record preparation failed");
 =

-	free_ndef_message(uri);
-	free_ndef_message(msg);
+	near_ndef_msg_free(uri);
+	near_ndef_msg_free(msg);
 =

 	return NULL;
 }
@@ -3908,7 +3908,7 @@ struct near_ndef_message *__ndef_build_from_message(D=
BusMessage *msg)
 		if (!ndef_message_append(ndef, record))
 			goto err;
 =

-		free_ndef_message(record);
+		near_ndef_msg_free(record);
 	next:
 		if (end)
 			break;
@@ -3918,8 +3918,8 @@ struct near_ndef_message *__ndef_build_from_message(D=
BusMessage *msg)
 exit:
 	return ndef;
 err:
-	free_ndef_message(ndef);
-	free_ndef_message(record);
+	near_ndef_msg_free(ndef);
+	near_ndef_msg_free(record);
 	ndef =3D NULL;
 	goto exit;
 }
-- =

2.27.0

--===============2529362486578839719==--

