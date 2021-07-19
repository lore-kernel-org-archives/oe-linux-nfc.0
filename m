Content-Type: multipart/mixed; boundary="===============2164301506213721956=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 07/73] nfctool: fix nfctool_print_and_remove_snl() cast-function-type
Date: Mon, 19 Jul 2021 13:07:13 +0200
Message-ID: <20210719110819.27340-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2164301506213721956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix on GCC v10:

    tools/nfctool/main.c: In function =E2=80=98nfctool_snl_cb=E2=80=99:
    tools/nfctool/main.c:352:30: error: cast between incompatible function =
types from =E2=80=98void (*)(struct nfc_snl *, guint32)=E2=80=99 {aka =E2=
=80=98void (*)(struct nfc_snl *, unsigned int)=E2=80=99} to =E2=80=98void (=
*)(void *, void *)=E2=80=99 [-Werror=3Dcast-function-type]
      352 |  g_slist_foreach(sdres_list, (GFunc)nfctool_print_and_remove_sn=
l,
          |                              ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/nfctool/main.c b/tools/nfctool/main.c
index 282df519fcc8..72a39de3ccbf 100644
--- a/tools/nfctool/main.c
+++ b/tools/nfctool/main.c
@@ -325,13 +325,13 @@ static int nfctool_poll_cb(guint8 cmd, guint32 idx, g=
pointer data)
 }
 =

 static void nfctool_print_and_remove_snl(struct nfc_snl *sdres,
-					 guint32 adapter_idx)
+					 gpointer adapter_idx)
 {
 	GSList *elem;
 =

 	printf(" uri: %s - sap: %d\n", sdres->uri, sdres->sap);
 =

-	if (adapter_idx =3D=3D opts.adapter_idx) {
+	if (GPOINTER_TO_UINT(adapter_idx) =3D=3D opts.adapter_idx) {
 		elem =3D g_slist_find_custom(opts.snl_list, sdres->uri,
 					   (GCompareFunc)g_strcmp0);
 =

-- =

2.27.0

--===============2164301506213721956==--

