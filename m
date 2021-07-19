Content-Type: multipart/mixed; boundary="===============4829524051860493627=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 05/73] nfctool: fix adapter_compare_idx() cast-function-type
Date: Mon, 19 Jul 2021 13:07:11 +0200
Message-ID: <20210719110819.27340-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4829524051860493627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix on GCC v10:

    tools/nfctool/adapter.c: In function =E2=80=98adapter_get=E2=80=99:
    tools/nfctool/adapter.c:155:8: error: cast between incompatible functio=
n types from =E2=80=98gint (*)(struct nfc_adapter *, guint32)=E2=80=99 {aka=
 =E2=80=98int (*)(struct nfc_adapter *, unsigned int)=E2=80=99} to =E2=80=
=98gint (*)(const void *, const void *)=E2=80=99 {aka =E2=80=98int (*)(cons=
t void *, const void *)=E2=80=99} [-Werror=3Dcast-function-type]
      155 |        (GCompareFunc)adapter_compare_idx);
          |        ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/adapter.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/nfctool/adapter.c b/tools/nfctool/adapter.c
index 5e3bf41884d1..343c4ab7d0ff 100644
--- a/tools/nfctool/adapter.c
+++ b/tools/nfctool/adapter.c
@@ -139,9 +139,11 @@ void adapter_idx_print_info(guint32 idx)
 		g_slist_foreach(adapters, (GFunc)adapter_print_info, NULL);
 }
 =

-static gint adapter_compare_idx(struct nfc_adapter *adapter, guint32 idx)
+static gint adapter_compare_idx(struct nfc_adapter *adapter, gpointer idx_=
ptr)
 {
-	return (gint)adapter->idx - (gint)idx;
+	gint idx =3D GPOINTER_TO_INT(idx_ptr);
+
+	return (gint)adapter->idx - idx;
 }
 =

 struct nfc_adapter *adapter_get(guint32 idx)
-- =

2.27.0

--===============4829524051860493627==--

