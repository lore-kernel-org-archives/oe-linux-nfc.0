Content-Type: multipart/mixed; boundary="===============9095069177870771628=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 06/34] adapter: adjust indentation of continued arguments
Date: Sun, 11 Jul 2021 22:20:34 +0200
Message-ID: <20210711202102.18094-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============9095069177870771628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/adapter.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index 9c483ca28855..5a8f083a686c 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -232,7 +232,7 @@ static gboolean property_get_powered(const GDBusPropert=
yTable *property,
 }
 =

 static void set_powered(GDBusPendingPropertySet id, dbus_bool_t powered,
-								void *data)
+			void *data)
 {
 	struct near_adapter *adapter =3D data;
 	int err;
@@ -284,7 +284,7 @@ static void property_set_powered(const GDBusPropertyTab=
le *property,
 }
 =

 static void append_protocols(DBusMessageIter *iter,
-					struct near_adapter *adapter)
+			     struct near_adapter *adapter)
 {
 	const char *str;
 =

@@ -405,7 +405,7 @@ static DBusMessage *stop_poll_loop(DBusConnection *conn,
 }
 =

 static void tag_present_cb(uint32_t adapter_idx, uint32_t target_idx,
-								int status);
+			   int status);
 =

 static gboolean check_presence(gpointer user_data)
 {
@@ -453,7 +453,7 @@ static gboolean dep_timer(gpointer user_data)
 }
 =

 static void tag_present_cb(uint32_t adapter_idx, uint32_t target_idx,
-								int status)
+			   int status)
 {
 	struct near_adapter *adapter;
 =

@@ -704,7 +704,7 @@ static void tag_read_cb(uint32_t adapter_idx, uint32_t =
target_idx, int status)
 }
 =

 static void device_read_cb(uint32_t adapter_idx, uint32_t target_idx,
-								int status)
+			   int status)
 {
 	struct near_adapter *adapter;
 =

@@ -996,7 +996,7 @@ static gboolean execute_recv_cb(gpointer user_data)
 }
 =

 static gboolean adapter_recv_event(GIOChannel *channel, GIOCondition condi=
tion,
-							gpointer user_data)
+				   gpointer user_data)
 {
 	struct near_adapter *adapter =3D user_data;
 	struct near_adapter_ioreq *req;
-- =

2.27.0

--===============9095069177870771628==--

