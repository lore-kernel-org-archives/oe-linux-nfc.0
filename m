Content-Type: multipart/mixed; boundary="===============1153308031639521999=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 04/73] nfctool: fix adapter_print_info() cast-function-type
Date: Mon, 19 Jul 2021 13:07:10 +0200
Message-ID: <20210719110819.27340-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1153308031639521999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix on GCC v10:

    tools/nfctool/adapter.c: In function =E2=80=98adapter_idx_print_info=E2=
=80=99:
    tools/nfctool/adapter.c:139:29: error: cast between incompatible functi=
on types from =E2=80=98void (*)(struct nfc_adapter *)=E2=80=99 to =E2=80=98=
void (*)(void *, void *)=E2=80=99 [-Werror=3Dcast-function-type]
      139 |   g_slist_foreach(adapters, (GFunc)adapter_print_info, NULL);
          |                             ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/adapter.c | 4 ++--
 tools/nfctool/adapter.h | 2 +-
 tools/nfctool/main.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/nfctool/adapter.c b/tools/nfctool/adapter.c
index 453c2c099009..5e3bf41884d1 100644
--- a/tools/nfctool/adapter.c
+++ b/tools/nfctool/adapter.c
@@ -78,7 +78,7 @@ void adpater_print_targets(struct nfc_adapter *adapter, g=
char *prefix)
 	printf("]\n");
 }
 =

-void adapter_print_info(struct nfc_adapter *adapter)
+void adapter_print_info(struct nfc_adapter *adapter, gpointer user_data)
 {
 	gchar *rf_mode_str;
 =

@@ -134,7 +134,7 @@ void adapter_print_info(struct nfc_adapter *adapter)
 void adapter_idx_print_info(guint32 idx)
 {
 	if (idx !=3D INVALID_ADAPTER_IDX)
-		adapter_print_info(adapter_get(idx));
+		adapter_print_info(adapter_get(idx), NULL);
 	else
 		g_slist_foreach(adapters, (GFunc)adapter_print_info, NULL);
 }
diff --git a/tools/nfctool/adapter.h b/tools/nfctool/adapter.h
index c22ded8ba34d..d2707ca1c107 100644
--- a/tools/nfctool/adapter.h
+++ b/tools/nfctool/adapter.h
@@ -52,7 +52,7 @@ int adapter_all_get_devices(void);
 =

 void adapter_idx_print_info(guint32 idx);
 =

-void adapter_print_info(struct nfc_adapter *adapter);
+void adapter_print_info(struct nfc_adapter *adapter, gpointer user_data);
 =

 void adpater_print_targets(struct nfc_adapter *adapter, gchar *prefix);
 =

diff --git a/tools/nfctool/main.c b/tools/nfctool/main.c
index c9a236fe4122..c48bf0919657 100644
--- a/tools/nfctool/main.c
+++ b/tools/nfctool/main.c
@@ -118,7 +118,7 @@ static int nfctool_set_params(void)
 =

 	nl_get_params(adapter);
 =

-	adapter_print_info(adapter);
+	adapter_print_info(adapter, NULL);
 =

 exit:
 	return err;
-- =

2.27.0

--===============1153308031639521999==--

