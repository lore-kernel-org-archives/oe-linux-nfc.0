Content-Type: multipart/mixed; boundary="===============5640045357434740334=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 35/73] manager: use proper format for integers (-Wformat)
Date: Mon, 19 Jul 2021 13:07:41 +0200
Message-ID: <20210719110819.27340-36-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5640045357434740334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from src/near.h:36,
                     from src/manager.c:34:
    src/manager.c: In function =E2=80=98__near_manager_adapter_add=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 4 has type =E2=80=98ui=
nt32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    src/manager.c:45:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
       45 |  DBG("idx %d", idx);
          |  ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/manager.c b/src/manager.c
index e4b72a73fcbb..754c254d85ad 100644
--- a/src/manager.c
+++ b/src/manager.c
@@ -42,7 +42,7 @@ int __near_manager_adapter_add(uint32_t idx, const char *=
name,
 	const char *path;
 	int err;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D __near_adapter_create(idx, name, protocols, powered);
 	if (!adapter)
@@ -66,7 +66,7 @@ void __near_manager_adapter_remove(uint32_t idx)
 	struct near_adapter *adapter;
 	const char *path;
 =

-	DBG("idx %d", idx);
+	DBG("idx %u", idx);
 =

 	adapter =3D __near_adapter_get(idx);
 	if (!adapter)
-- =

2.27.0

--===============5640045357434740334==--

