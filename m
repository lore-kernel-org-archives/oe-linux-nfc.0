Content-Type: multipart/mixed; boundary="===============6724550893357525063=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 37/73] gdbus: annotate printf-like functions as accepting format
Date: Mon, 19 Jul 2021 13:07:43 +0200
Message-ID: <20210719110819.27340-38-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6724550893357525063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Printf-like functions should have the "format" argument annotated to:
1. Help in detection of format string vulnerabilities (and mistakes).
2. Satisfy -Wformat-nonliteral (-Wformat=3D2) warning.

This fixes clang warnings like:

    gdbus/object.c:1416:31: error: format string is not a string literal [-=
Werror,-Wformat-nonliteral]
                    vsnprintf(str, sizeof(str), format, args);
                                                ^~~~~~

    src/adapter.c:255:7: error: format string is not a string literal (pote=
ntially insecure) [-Werror,-Wformat-security]
                                                    strerror(err));
                                                    ^~~~~~~~~~~~~
    src/adapter.c:255:7: note: treat the string as an argument to avoid this
                                                    strerror(err));
                                                    ^
                                                    "%s",

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 gdbus/gdbus.h | 15 ++++++++++-----
 src/adapter.c |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/gdbus/gdbus.h b/gdbus/gdbus.h
index d99c2549d056..e9ffd029e178 100644
--- a/gdbus/gdbus.h
+++ b/gdbus/gdbus.h
@@ -239,13 +239,15 @@ void g_dbus_pending_error(DBusConnection *connection,
 					__attribute__((format(printf, 4, 5)));
 void g_dbus_pending_error_valist(DBusConnection *connection,
 				GDBusPendingReply pending, const char *name,
-					const char *format, va_list args);
+				const char *format, va_list args)
+				__attribute__ ((format (printf, 4, 0)));
 =

 DBusMessage *g_dbus_create_error(DBusMessage *message, const char *name,
 						const char *format, ...)
 					__attribute__((format(printf, 3, 4)));
 DBusMessage *g_dbus_create_error_valist(DBusMessage *message, const char *=
name,
-					const char *format, va_list args);
+					const char *format, va_list args)
+					__attribute__ ((format (printf, 3, 0)));
 DBusMessage *g_dbus_create_reply(DBusMessage *message, int type, ...);
 DBusMessage *g_dbus_create_reply_valist(DBusMessage *message,
 						int type, va_list args);
@@ -259,7 +261,8 @@ gboolean g_dbus_send_error(DBusConnection *connection, =
DBusMessage *message,
 					 __attribute__((format(printf, 4, 5)));
 gboolean g_dbus_send_error_valist(DBusConnection *connection,
 					DBusMessage *message, const char *name,
-					const char *format, va_list args);
+					const char *format, va_list args)
+					__attribute__ ((format (printf, 4, 0)));
 gboolean g_dbus_send_reply(DBusConnection *connection,
 				DBusMessage *message, int type, ...);
 gboolean g_dbus_send_reply_valist(DBusConnection *connection,
@@ -294,9 +297,11 @@ void g_dbus_remove_all_watches(DBusConnection *connect=
ion);
 =

 void g_dbus_pending_property_success(GDBusPendingPropertySet id);
 void g_dbus_pending_property_error_valist(GDBusPendingReply id,
-			const char *name, const char *format, va_list args);
+			const char *name, const char *format, va_list args)
+			__attribute__ ((format (printf, 3, 0)));
 void g_dbus_pending_property_error(GDBusPendingReply id, const char *name,
-						const char *format, ...);
+				   const char *format, ...)
+				   __attribute__((format(printf, 3, 4)));
 void g_dbus_emit_property_changed(DBusConnection *connection,
 				const char *path, const char *interface,
 				const char *name);
diff --git a/src/adapter.c b/src/adapter.c
index 420127f4f396..e0ab8c5d6055 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -252,6 +252,7 @@ static void set_powered(GDBusPendingPropertySet id, dbu=
s_bool_t powered,
 =

 		g_dbus_pending_property_error(id,
 						NFC_ERROR_INTERFACE ".Failed",
+						"%s",
 						strerror(err));
 =

 		return;
-- =

2.27.0

--===============6724550893357525063==--

