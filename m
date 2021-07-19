Content-Type: multipart/mixed; boundary="===============2815292741281278853=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 25/73] bluetooth: use proper format for integers (-Wformat)
Date: Mon, 19 Jul 2021 13:07:31 +0200
Message-ID: <20210719110819.27340-26-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2815292741281278853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from src/near.h:36,
                     from src/bluetooth.c:32:
    src/bluetooth.c: In function =E2=80=98bt_adapter_property_changed=E2=80=
=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%x=E2=80=99 expects =
argument of type =E2=80=98unsigned int=E2=80=99, but argument 5 has type =
=E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    src/bluetooth.c:465:3: note: in expansion of macro =E2=80=98DBG=E2=80=
=99
      465 |   DBG("%s: %x", property, bt_def_oob_data.class_of_device);
          |   ^~~

    In file included from src/near.h:36,
                     from src/bluetooth.c:32:
    src/bluetooth.c: In function =E2=80=98bt_adapter_property_changed=E2=80=
=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%u=E2=80=99 expects =
argument of type =E2=80=98unsigned int=E2=80=99, but argument 5 has type =
=E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    src/bluetooth.c:475:3: note: in expansion of macro =E2=80=98DBG=E2=80=
=99
      475 |   DBG("%s: %u", property, bt_def_oob_data.powered);
          |   ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/bluetooth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/bluetooth.c b/src/bluetooth.c
index 3e67f1c88b84..79cfbb38e334 100644
--- a/src/bluetooth.c
+++ b/src/bluetooth.c
@@ -462,7 +462,7 @@ static gboolean bt_adapter_property_changed(DBusConnect=
ion *conn,
 		dbus_message_iter_get_basic(&var, &class);
 		bt_def_oob_data.class_of_device =3D class;
 =

-		DBG("%s: %x", property, bt_def_oob_data.class_of_device);
+		DBG("%s: %x", property, (unsigned int)bt_def_oob_data.class_of_device);
 	} else if (g_str_equal(property, "Powered")) {
 		dbus_bool_t powered;
 =

@@ -472,7 +472,7 @@ static gboolean bt_adapter_property_changed(DBusConnect=
ion *conn,
 		dbus_message_iter_get_basic(&var, &powered);
 		bt_def_oob_data.powered =3D powered;
 =

-		DBG("%s: %u", property, bt_def_oob_data.powered);
+		DBG("%s: %d", property, bt_def_oob_data.powered);
 	}
 =

 	return TRUE;
-- =

2.27.0

--===============2815292741281278853==--

