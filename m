Content-Type: multipart/mixed; boundary="===============8574910766364176679=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 62/73] unit: remove duplicated invalid definitions in test-snep-read
Date: Mon, 19 Jul 2021 13:08:08 +0200
Message-ID: <20210719110819.27340-63-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8574910766364176679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The unit tests duplicated several definitions in unit/test-utils.h which
after some time become outdated and not matching the original ones.
This lead to bogus data printed in logs, for example length of
near_ndef_record:

    [SNEP unit]	dummy_req_put STORED REC data=3D0x55ceb3fc8050 length=3D943=
46271294192

Move all of them into new src/ndef-private.h header.  Start using SPDX
identifier instead of full GPL license boilerplate.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Makefile.am           |   2 +-
 src/ndef-private.h    | 140 ++++++++++++++++++++++++++++++++++++++++++
 src/ndef.c            | 137 +----------------------------------------
 unit/test-snep-read.c |   2 +
 unit/test-utils.h     |  81 +-----------------------
 5 files changed, 145 insertions(+), 217 deletions(-)
 create mode 100644 src/ndef-private.h

diff --git a/Makefile.am b/Makefile.am
index fa552ee38f98..26aa4ca82e80 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -37,7 +37,7 @@ pkglibexecdir =3D ${libexecdir}/nfc
 pkglibexec_PROGRAMS =3D src/neard
 =

 src_neard_SOURCES =3D $(gdbus_sources) $(gweb_sources) $(builtin_sources) \
-			src/main.c src/error.c src/near.h src/log.c \
+			src/main.c src/error.c src/ndef-private.h src/near.h src/log.c \
 			src/dbus.c src/manager.c src/adapter.c src/device.c \
 			src/tag.c src/plugin.c src/netlink.c src/ndef.c \
 			src/tlv.c src/bluetooth.c src/agent.c src/snep.c
diff --git a/src/ndef-private.h b/src/ndef-private.h
new file mode 100644
index 000000000000..08a928e0cfbe
--- /dev/null
+++ b/src/ndef-private.h
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2011-2016  Intel Corporation. All rights reserved.
+ * Copyright (c) 2021 Canonical Ltd.
+ */
+
+enum record_type {
+	RECORD_TYPE_WKT_SMART_POSTER          =3D   0x01,
+	RECORD_TYPE_WKT_URI                   =3D   0x02,
+	RECORD_TYPE_WKT_TEXT                  =3D   0x03,
+	RECORD_TYPE_WKT_SIZE                  =3D   0x04,
+	RECORD_TYPE_WKT_TYPE                  =3D   0x05,
+	RECORD_TYPE_WKT_ACTION                =3D   0x06,
+	RECORD_TYPE_WKT_HANDOVER_REQUEST      =3D   0x07,
+	RECORD_TYPE_WKT_HANDOVER_SELECT       =3D   0x08,
+	RECORD_TYPE_WKT_HANDOVER_CARRIER      =3D   0x09,
+	RECORD_TYPE_WKT_ALTERNATIVE_CARRIER   =3D   0x0a,
+	RECORD_TYPE_WKT_COLLISION_RESOLUTION  =3D   0x0b,
+	RECORD_TYPE_WKT_ERROR                 =3D   0x0c,
+	RECORD_TYPE_MIME_TYPE                 =3D   0x0d,
+	RECORD_TYPE_EXT_AAR                   =3D   0x0e,
+	RECORD_TYPE_UNKNOWN                   =3D   0xfe,
+	RECORD_TYPE_ERROR                     =3D   0xff
+};
+
+#define RECORD_TYPE_WKT "urn:nfc:wkt:"
+#define RECORD_TYPE_EXTERNAL "urn:nfc:ext:"
+#define AAR_STRING "android.com:pkg"
+
+struct near_ndef_record_header {
+	uint8_t mb;
+	uint8_t me;
+	uint8_t cf;
+	uint8_t sr;
+	uint8_t il;
+	uint8_t tnf;
+	uint8_t il_length;
+	uint8_t *il_field;
+	uint32_t payload_len;
+	uint32_t offset;
+	uint8_t	type_len;
+	enum record_type rec_type;
+	char *type_name;
+	uint32_t header_len;
+};
+
+struct near_ndef_text_payload {
+	char *encoding;
+	char *language_code;
+	char *data;
+};
+
+struct near_ndef_uri_payload {
+	uint8_t identifier;
+
+	uint32_t  field_length;
+	uint8_t  *field;
+};
+
+struct near_ndef_sp_payload {
+	struct near_ndef_uri_payload *uri;
+
+	uint8_t number_of_title_records;
+	struct near_ndef_text_payload **title_records;
+
+	uint32_t size; /* from Size record*/
+	char *type;    /* from Type record*/
+	char *action;
+	/* TODO add icon and other records fields*/
+};
+
+struct near_ndef_mime_payload {
+	char *type;
+
+	struct {
+		enum handover_carrier carrier_type;
+		uint16_t properties;	/* e.g.: NO_PAIRING_KEY */
+	} handover;
+	uint8_t *payload;
+	uint32_t payload_len;
+};
+
+/* Handover record definitions */
+
+/* alternative record (AC) length based on cdr length without adata */
+#define AC_RECORD_PAYLOAD_LEN(cdr_len) (3 + cdr_len)
+
+struct near_ndef_ac_payload {
+	enum carrier_power_state cps;	/* carrier power state */
+
+	uint8_t cdr_len;	/* carrier data reference length */
+	uint8_t *cdr;		/* carrier data reference */
+	uint8_t adata_refcount;	/* auxiliary data reference count */
+
+	/* !: if adata_refcount =3D=3D 0, then there's no data reference */
+	uint16_t **adata;	/* auxiliary data reference */
+};
+
+/* Default Handover version */
+#define HANDOVER_VERSION	0x12
+#define HANDOVER_MAJOR(version) (((version) >> 4) & 0xf)
+#define HANDOVER_MINOR(version) ((version) & 0xf)
+
+/* General Handover Request/Select record */
+struct near_ndef_ho_payload {
+	uint8_t version;		/* version id */
+	uint16_t collision_record;	/* collision record */
+
+	uint8_t number_of_ac_payloads;	/* At least 1 ac is needed */
+	struct near_ndef_ac_payload **ac_payloads;
+
+	/* Optional records */
+	uint16_t *err_record;	/* not NULL if present */
+
+	uint8_t number_of_cfg_payloads;	/* extra NDEF records */
+	struct near_ndef_mime_payload **cfg_payloads;
+};
+
+struct near_ndef_aar_payload {
+	char *package;
+};
+
+struct near_ndef_record {
+	char *path;
+
+	struct near_ndef_record_header *header;
+
+	/* specific payloads */
+	struct near_ndef_text_payload *text;
+	struct near_ndef_uri_payload  *uri;
+	struct near_ndef_sp_payload   *sp;
+	struct near_ndef_mime_payload *mime;
+	struct near_ndef_ho_payload   *ho;	/* handover payload */
+	struct near_ndef_aar_payload  *aar;
+
+	char *type;
+
+	uint8_t *data;
+	size_t data_len;
+};
diff --git a/src/ndef.c b/src/ndef.c
index 0215bba0f3ae..f26e6746181d 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -34,6 +34,7 @@
 #include <gdbus.h>
 =

 #include "near.h"
+#include "ndef-private.h"
 =

 enum record_tnf {
 	RECORD_TNF_EMPTY     =3D 0x00,
@@ -78,142 +79,6 @@ enum record_tnf {
 =

 #define AC_CPS_MASK 0x03
 =

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
-#define RECORD_TYPE_WKT "urn:nfc:wkt:"
-#define RECORD_TYPE_EXTERNAL "urn:nfc:ext:"
-#define AAR_STRING "android.com:pkg"
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
-	/* TODO add icon and other records fields*/
-};
-
-struct near_ndef_mime_payload {
-	char *type;
-
-	struct {
-		enum handover_carrier carrier_type;
-		uint16_t properties;	/* e.g.: NO_PAIRING_KEY */
-	} handover;
-	uint8_t *payload;
-	uint32_t payload_len;
-};
-
-/* Handover record definitions */
-
-/* alternative record (AC) length based on cdr length without adata */
-#define AC_RECORD_PAYLOAD_LEN(cdr_len) (3 + cdr_len)
-
-struct near_ndef_ac_payload {
-	enum carrier_power_state cps;	/* carrier power state */
-
-	uint8_t cdr_len;	/* carrier data reference length */
-	uint8_t *cdr;		/* carrier data reference */
-	uint8_t adata_refcount;	/* auxiliary data reference count */
-
-	/* !: if adata_refcount =3D=3D 0, then there's no data reference */
-	uint16_t **adata;	/* auxiliary data reference */
-};
-
-/* Default Handover version */
-#define HANDOVER_VERSION	0x12
-#define HANDOVER_MAJOR(version) (((version) >> 4) & 0xf)
-#define HANDOVER_MINOR(version) ((version) & 0xf)
-
-
-/* General Handover Request/Select record */
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
-	struct near_ndef_mime_payload *mime;
-	struct near_ndef_ho_payload   *ho;	/* handover payload */
-	struct near_ndef_aar_payload  *aar;
-
-	char *type;
-
-	uint8_t *data;
-	size_t data_len;
-};
-
 static DBusConnection *connection =3D NULL;
 =

 static inline void fillb8(uint8_t *ptr, uint32_t len)
diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index ea41ae03a8b2..21be58785eda 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -35,6 +35,8 @@
 =

 #include <near/types.h>
 =

+#include <src/near.h>
+#include <src/ndef-private.h>
 #include "test-utils.h"
 =

 #define TEST_SNEP_LOG(fmt, ...) do { \
diff --git a/unit/test-utils.h b/unit/test-utils.h
index 108f2a1fb139..6d434f43cb2d 100644
--- a/unit/test-utils.h
+++ b/unit/test-utils.h
@@ -28,8 +28,7 @@
 #include <string.h>
 #include <unistd.h>
 =

-#include <src/near.h>
-#include <near/nfc_copy.h>
+#include <near/device.h>
 #include <near/types.h>
 #include <near/ndef.h>
 #include <glib.h>
@@ -65,84 +64,6 @@ struct p2p_snep_resp_frame {
 	uint8_t info[];
 } __attribute__((packed));
 =

-/* NDEF specific types */
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
-struct near_ndef_record {
-	char *path;
-
-	struct near_ndef_record_header *header;
-
-	/* specific payloads */
-	struct near_ndef_text_payload *text;
-	struct near_ndef_uri_payload  *uri;
-	struct near_ndef_sp_payload   *sp;
-	struct near_ndef_mime_payload *mime;
-	struct near_ndef_ho_payload   *ho;	/* handover payload */
-
-	char *type;
-
-	uint8_t *data;
-	size_t data_len;
-};
-
 struct near_ndef_message *test_ndef_create_test_record(const char *str);
 =

 #endif
-- =

2.27.0

--===============8574910766364176679==--

