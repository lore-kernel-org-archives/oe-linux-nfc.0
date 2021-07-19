Content-Type: multipart/mixed; boundary="===============3963412691682850617=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 03/73] nfctool: fix adapter_print_target() cast-function-type
Date: Mon, 19 Jul 2021 13:07:09 +0200
Message-ID: <20210719110819.27340-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3963412691682850617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix on GCC v10:

    tools/nfctool/adapter.c: In function =E2=80=98adpater_print_targets=E2=
=80=99:
    tools/nfctool/adapter.c:69:33: error: cast between incompatible functio=
n types from =E2=80=98void (*)(guint32,  gchar *)=E2=80=99 {aka =E2=80=98vo=
id (*)(unsigned int,  char *)=E2=80=99} to =E2=80=98void (*)(void *, void *=
)=E2=80=99 [-Werror=3Dcast-function-type]
       69 |  g_slist_foreach(adapter->tags, (GFunc)adapter_print_target, "t=
ag");
          |                                 ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/adapter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/nfctool/adapter.c b/tools/nfctool/adapter.c
index 5a0c34a0f28b..453c2c099009 100644
--- a/tools/nfctool/adapter.c
+++ b/tools/nfctool/adapter.c
@@ -57,9 +57,9 @@ int adapter_all_get_devices(void)
 	return 0;
 }
 =

-static void adapter_print_target(guint32 idx, gchar *type)
+static void adapter_print_target(gpointer idx, gchar *type)
 {
-	printf("%s%d ", type, idx);
+	printf("%s%d ", type, GPOINTER_TO_INT(idx));
 }
 =

 void adpater_print_targets(struct nfc_adapter *adapter, gchar *prefix)
-- =

2.27.0

--===============3963412691682850617==--

