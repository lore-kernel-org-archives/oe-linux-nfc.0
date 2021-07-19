Content-Type: multipart/mixed; boundary="===============5278394117524857792=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 15/73] ndef: use proper format for integers (-Wformat)
Date: Mon, 19 Jul 2021 13:07:21 +0200
Message-ID: <20210719110819.27340-16-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5278394117524857792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    ./include/near/log.h:45:14: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 4 has type =E2=80=98ui=
nt32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    src/ndef.c:1084:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
     1084 |  DBG("payload length %d", rec_header->payload_len);
          |  ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/ndef.c b/src/ndef.c
index 928e6a10a999..790655a279ba 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -503,8 +503,8 @@ static gboolean property_get_uri(const GDBusPropertyTab=
le *property,
 =

 	DBG("URI prefix %s", prefix);
 =

-	value =3D g_strdup_printf("%s%.*s", prefix, uri->field_length,
-							 uri->field);
+	value =3D g_strdup_printf("%s%.*s", prefix, (int)uri->field_length,
+				uri->field);
 =

 	dbus_message_iter_append_basic(iter, DBUS_TYPE_STRING, &value);
 =

@@ -585,7 +585,7 @@ static gboolean property_get_size(const GDBusPropertyTa=
ble *property,
 {
 	struct near_ndef_record *record =3D user_data;
 =

-	DBG("%d", record->sp->size);
+	DBG("%u", record->sp->size);
 =

 	dbus_message_iter_append_basic(iter, DBUS_TYPE_UINT32, &record->sp->size);
 =

@@ -1042,7 +1042,7 @@ static struct near_ndef_record_header *parse_record_h=
eader(uint8_t *rec,
 	uint8_t *type =3D NULL;
 	uint32_t header_len =3D 0;
 =

-	DBG("length %d", length);
+	DBG("length %u", length);
 =

 	if (!rec || offset >=3D length)
 		return NULL;
@@ -1081,7 +1081,7 @@ static struct near_ndef_record_header *parse_record_h=
eader(uint8_t *rec,
 			goto fail;
 	}
 =

-	DBG("payload length %d", rec_header->payload_len);
+	DBG("payload length %u", rec_header->payload_len);
 =

 	if (rec_header->il =3D=3D 1) {
 		rec_header->il_length =3D rec[offset++];
@@ -1274,7 +1274,7 @@ parse_uri_payload(uint8_t *payload, uint32_t length)
 	}
 =

 	DBG("Identifier  '0X%X'", uri_payload->identifier);
-	DBG("Field  '%.*s'", uri_payload->field_length, uri_payload->field);
+	DBG("Field  '%.*s'", (int)uri_payload->field_length, uri_payload->field);
 =

 	return uri_payload;
 =

-- =

2.27.0

--===============5278394117524857792==--

