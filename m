Content-Type: multipart/mixed; boundary="===============8650624554310933948=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 22/73] gdbus: do not shadow global 'pending' variable (-Wshadow)
Date: Mon, 19 Jul 2021 13:07:28 +0200
Message-ID: <20210719110819.27340-23-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8650624554310933948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix -Wshadow warnings:

    gdbus/object.c: In function =E2=80=98g_dbus_pending_success=E2=80=99:
    gdbus/object.c:286:24: error: declaration of =E2=80=98pending=E2=80=99 =
shadows a global declaration [-Werror=3Dshadow]
      286 |      GDBusPendingReply pending)
          |      ~~~~~~~~~~~~~~~~~~^~~~~~~
    gdbus/object.c:89:16: note: shadowed declaration is here
       89 | static GSList *pending =3D NULL;
          |                ^~~~~~~
    gdbus/object.c: In function =E2=80=98g_dbus_pending_error_valist=E2=80=
=99:
    gdbus/object.c:308:23: error: declaration of =E2=80=98pending=E2=80=99 =
shadows a global declaration [-Werror=3Dshadow]
      308 |     GDBusPendingReply pending, const char *name,
          |     ~~~~~~~~~~~~~~~~~~^~~~~~~
    gdbus/object.c:89:16: note: shadowed declaration is here
       89 | static GSList *pending =3D NULL;
          |                ^~~~~~~
    gdbus/object.c: In function =E2=80=98g_dbus_pending_error=E2=80=99:
    gdbus/object.c:331:23: error: declaration of =E2=80=98pending=E2=80=99 =
shadows a global declaration [-Werror=3Dshadow]
      331 |     GDBusPendingReply pending,
          |     ~~~~~~~~~~~~~~~~~~^~~~~~~
    gdbus/object.c:89:16: note: shadowed declaration is here
       89 | static GSList *pending =3D NULL;
          |                ^~~~~~~
    gdbus/object.c: In function =E2=80=98builtin_security_function=E2=80=99:
    gdbus/object.c:370:25: error: declaration of =E2=80=98pending=E2=80=99 =
shadows a global declaration [-Werror=3Dshadow]
      370 |       GDBusPendingReply pending)
          |       ~~~~~~~~~~~~~~~~~~^~~~~~~
    gdbus/object.c:89:16: note: shadowed declaration is here
       89 | static GSList *pending =3D NULL;
          |                ^~~~~~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 gdbus/object.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/gdbus/object.c b/gdbus/object.c
index 96db51665301..f394334d4594 100644
--- a/gdbus/object.c
+++ b/gdbus/object.c
@@ -283,14 +283,14 @@ static GSList *pending_security =3D NULL;
 static const GDBusSecurityTable *security_table =3D NULL;
 =

 void g_dbus_pending_success(DBusConnection *connection,
-					GDBusPendingReply pending)
+			    GDBusPendingReply pending_reply)
 {
 	GSList *list;
 =

 	for (list =3D pending_security; list; list =3D list->next) {
 		struct security_data *secdata =3D list->data;
 =

-		if (secdata->pending !=3D pending)
+		if (secdata->pending !=3D pending_reply)
 			continue;
 =

 		pending_security =3D g_slist_remove(pending_security, secdata);
@@ -305,7 +305,7 @@ void g_dbus_pending_success(DBusConnection *connection,
 }
 =

 void g_dbus_pending_error_valist(DBusConnection *connection,
-				GDBusPendingReply pending, const char *name,
+				GDBusPendingReply pending_reply, const char *name,
 					const char *format, va_list args)
 {
 	GSList *list;
@@ -313,7 +313,7 @@ void g_dbus_pending_error_valist(DBusConnection *connec=
tion,
 	for (list =3D pending_security; list; list =3D list->next) {
 		struct security_data *secdata =3D list->data;
 =

-		if (secdata->pending !=3D pending)
+		if (secdata->pending !=3D pending_reply)
 			continue;
 =

 		pending_security =3D g_slist_remove(pending_security, secdata);
@@ -328,14 +328,14 @@ void g_dbus_pending_error_valist(DBusConnection *conn=
ection,
 }
 =

 void g_dbus_pending_error(DBusConnection *connection,
-				GDBusPendingReply pending,
+			  GDBusPendingReply pending_reply,
 				const char *name, const char *format, ...)
 {
 	va_list args;
 =

 	va_start(args, format);
 =

-	g_dbus_pending_error_valist(connection, pending, name, format, args);
+	g_dbus_pending_error_valist(connection, pending_reply, name, format, args=
);
 =

 	va_end(args);
 }
@@ -365,19 +365,19 @@ static void builtin_security_result(dbus_bool_t autho=
rized, void *user_data)
 }
 =

 static void builtin_security_function(DBusConnection *conn,
-						const char *action,
-						gboolean interaction,
-						GDBusPendingReply pending)
+				      const char *action,
+				      gboolean interaction,
+				      GDBusPendingReply pending_reply)
 {
 	struct builtin_security_data *data;
 =

 	data =3D g_new0(struct builtin_security_data, 1);
 	data->conn =3D conn;
-	data->pending =3D pending;
+	data->pending =3D pending_reply;
 =

 	if (polkit_check_authorization(conn, action, interaction,
 				builtin_security_result, data, 30000) < 0)
-		g_dbus_pending_error(conn, pending, NULL, NULL);
+		g_dbus_pending_error(conn, pending_reply, NULL, NULL);
 }
 =

 static gboolean check_privilege(DBusConnection *conn, DBusMessage *msg,
-- =

2.27.0

--===============8650624554310933948==--

