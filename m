Content-Type: multipart/mixed; boundary="===============2786263641131882854=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 10/73] dbus: fix -Wformat in near_dbus_encode_string()
Date: Mon, 19 Jul 2021 13:07:16 +0200
Message-ID: <20210719110819.27340-11-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2786263641131882854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix GCC warning:

    src/dbus.c: In function =E2=80=98near_dbus_encode_string=E2=80=99:
    src/dbus.c:71:37: error: format =E2=80=98%x=E2=80=99 expects argument o=
f type =E2=80=98unsigned int=E2=80=99, but argument 3 has type =E2=80=98int=
=E2=80=99 [-Werror=3Dformat=3D]
       71 |    g_string_append_printf(str, "_%02x", tmp);
          |                                  ~~~^   ~~~
          |                                     |   |
          |                                     |   int
          |                                     unsigned int
          |                                  %02x

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/dbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/dbus.c b/src/dbus.c
index 9c67a9eec89a..ed4570d951ed 100644
--- a/src/dbus.c
+++ b/src/dbus.c
@@ -68,7 +68,7 @@ char *near_dbus_encode_string(const char *value)
 		const char tmp =3D value[i];
 		if ((tmp < '0' || tmp > '9') && (tmp < 'A' || tmp > 'Z') &&
 						(tmp < 'a' || tmp > 'z'))
-			g_string_append_printf(str, "_%02x", tmp);
+			g_string_append_printf(str, "_%02x", (unsigned int)tmp);
 		else
 			str =3D g_string_append_c(str, tmp);
 	}
-- =

2.27.0

--===============2786263641131882854==--

