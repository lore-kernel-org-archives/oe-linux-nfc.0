Content-Type: multipart/mixed; boundary="===============6532639111035500218=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 18/34] ndef: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:35 +0200
Message-ID: <20210711202351.18363-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6532639111035500218==
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
 src/ndef.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/ndef.c b/src/ndef.c
index 54e2e1ae170e..0d84ff4dc17b 100644
--- a/src/ndef.c
+++ b/src/ndef.c
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
-- =

2.27.0

--===============6532639111035500218==--

