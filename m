Content-Type: multipart/mixed; boundary="===============8925208966224996119=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 31/34] ndef: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:48 +0200
Message-ID: <20210711202351.18363-19-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8925208966224996119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    src/ndef.c: In function =E2=80=98property_get_uri=E2=80=99:
    src/ndef.c:506:31: error: field precision specifier =E2=80=98.*=E2=80=
=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 has type=
 =E2=80=98uint32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
      506 |  value =3D g_strdup_printf("%s%.*s", prefix, uri->field_length,
          |                             ~~^~           ~~~~~~~~~~~~~~~~~
          |                               |               |
          |                               int             uint32_t {aka uns=
igned int}
    src/ndef.c: In function =E2=80=98property_get_uri=E2=80=99:
    src/ndef.c:506:31: error: field precision specifier =E2=80=98.*=E2=80=
=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 has type=
 =E2=80=98uint32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
      506 |  value =3D g_strdup_printf("%s%.*s", prefix, uri->field_length,
          |                             ~~^~           ~~~~~~~~~~~~~~~~~
          |                               |               |
          |                               int             uint32_t {aka uns=
igned int}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/ndef.c b/src/ndef.c
index 0d84ff4dc17b..66faf7867399 100644
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

@@ -1280,7 +1280,7 @@ parse_uri_payload(uint8_t *payload, uint32_t length)
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

--===============8925208966224996119==--

