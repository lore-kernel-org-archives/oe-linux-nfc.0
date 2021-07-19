Content-Type: multipart/mixed; boundary="===============8952953692061818750=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 63/73] unit: remove duplicated definitions in test-ndef-parse
Date: Mon, 19 Jul 2021 13:08:09 +0200
Message-ID: <20210719110819.27340-64-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8952953692061818750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The unit/test-ndef-parse.c duplicated several definitions which is
error-prone.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-parse.c | 109 +----------------------------------------
 1 file changed, 1 insertion(+), 108 deletions(-)

diff --git a/unit/test-ndef-parse.c b/unit/test-ndef-parse.c
index de3cac81b90d..53a5b584437a 100644
--- a/unit/test-ndef-parse.c
+++ b/unit/test-ndef-parse.c
@@ -32,114 +32,7 @@
 =

 #include <near/ndef.h>
 #include <src/near.h>
-
-enum record_type {
-	RECORD_TYPE_WKT_SMART_POSTER          =3D   0x01,
-	RECORD_TYPE_WKT_URI                   =3D   0x02,
-	RECORD_TYPE_WKT_TEXT                  =3D   0x03,
-	RECORD_TYPE_WKT_SIZE                  =3D   0x04,
-	RECORD_TYPE_WKT_TYPE                  =3D   0x05,
-	RECORD_TYPE_WKT_ACTION                =3D   0x06,
-	RECORD_TYPE_WKT_HANDOVER_REQUEST      =3D   0x07,
-	RECORD_TYPE_WKT_HANDOVER_SELECT       =3D   0x08,
-	RECORD_TYPE_WKT_HANDOVER_CARRIER      =3D   0x09,
-	RECORD_TYPE_WKT_ALTERNATIVE_CARRIER   =3D   0x0a,
-	RECORD_TYPE_WKT_COLLISION_RESOLUTION  =3D   0x0b,
-	RECORD_TYPE_WKT_ERROR                 =3D   0x0c,
-	RECORD_TYPE_MIME_TYPE                 =3D   0x0d,
-	RECORD_TYPE_EXT_AAR                   =3D   0x0e,
-	RECORD_TYPE_UNKNOWN                   =3D   0xfe,
-	RECORD_TYPE_ERROR                     =3D   0xff
-};
-
-struct near_ndef_record_header {
-	uint8_t mb;
-	uint8_t me;
-	uint8_t cf;
-	uint8_t sr;
-	uint8_t il;
-	uint8_t tnf;
-	uint8_t il_length;
-	uint8_t *il_field;
-	uint32_t payload_len;
-	uint32_t offset;
-	uint8_t	type_len;
-	enum record_type rec_type;
-	char *type_name;
-	uint32_t header_len;
-};
-
-struct near_ndef_text_payload {
-	char *encoding;
-	char *language_code;
-	char *data;
-};
-
-struct near_ndef_uri_payload {
-	uint8_t identifier;
-
-	uint32_t  field_length;
-	uint8_t  *field;
-};
-
-struct near_ndef_sp_payload {
-	struct near_ndef_uri_payload *uri;
-
-	uint8_t number_of_title_records;
-	struct near_ndef_text_payload **title_records;
-
-	uint32_t size; /* from Size record*/
-	char *type;    /* from Type record*/
-	char *action;
-};
-
-struct near_ndef_aar_payload {
-	char *package;
-};
-
-struct near_ndef_record {
-	char *path;
-
-	struct near_ndef_record_header *header;
-
-	/* specific payloads */
-	struct near_ndef_text_payload *text;
-	struct near_ndef_uri_payload  *uri;
-	struct near_ndef_sp_payload   *sp;
- 	struct near_ndef_mime_payload *mime;
-	struct near_ndef_ho_payload   *ho;	/* handover payload */
-	struct near_ndef_aar_payload  *aar;
-
-	char *type;
-
-	uint8_t *data;
-	size_t data_len;
-};
-
-struct near_ndef_ho_payload {
-	uint8_t version;		/* version id */
-	uint16_t collision_record;	/* collision record */
-
-	uint8_t number_of_ac_payloads;	/* At least 1 ac is needed */
-	struct near_ndef_ac_payload **ac_payloads;
-
-	/* Optional records */
-	uint16_t *err_record;	/* not NULL if present */
-
-	uint8_t number_of_cfg_payloads;	/* extra NDEF records */
-	struct near_ndef_mime_payload **cfg_payloads;
-};
-
-struct near_ndef_ac_payload {
-	enum carrier_power_state cps;	/* carrier power state */
-
-	uint8_t cdr_len;	/* carrier data reference length: 0x01 */
-	uint8_t *cdr;		/* carrier data reference */
-	uint8_t adata_refcount;	/* auxiliary data reference count */
-
-	/* !: if adata_refcount =3D=3D 0, then there's no data reference */
-	uint16_t **adata;	/* auxiliary data reference */
-};
+#include <src/ndef-private.h>
 =

 /* http://www.intel.com URI NDEF */
 static uint8_t test_uri[] =3D {0xd1, 0x1, 0xa, 0x55, 0x1, 0x69, 0x6e, 0x74,
-- =

2.27.0

--===============8952953692061818750==--

