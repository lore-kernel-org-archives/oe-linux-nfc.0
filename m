Content-Type: multipart/mixed; boundary="===============4632329553482602679=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 02/73] nfctool: fix adapter_get_devices() cast-function-type
Date: Mon, 19 Jul 2021 13:07:08 +0200
Message-ID: <20210719110819.27340-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4632329553482602679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix on GCC v10:

    tools/nfctool/adapter.c: In function =E2=80=98adapter_all_get_devices=
=E2=80=99:
    tools/nfctool/adapter.c:55:28: error: cast between incompatible functio=
n types from =E2=80=98void (*)(struct nfc_adapter *)=E2=80=99 to =E2=80=98v=
oid (*)(void *, void *)=E2=80=99 [-Werror=3Dcast-function-type]
       55 |  g_slist_foreach(adapters, (GFunc)adapter_get_devices, NULL);
          |                            ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/adapter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/nfctool/adapter.c b/tools/nfctool/adapter.c
index beaee53243ca..5a0c34a0f28b 100644
--- a/tools/nfctool/adapter.c
+++ b/tools/nfctool/adapter.c
@@ -36,7 +36,7 @@ static GSList *adapters;
 =

 static struct nfc_adapter *selected_adapter;
 =

-static void adapter_get_devices(struct nfc_adapter *adapter)
+static void adapter_get_devices(struct nfc_adapter *adapter, gpointer user=
_data)
 {
 	if (adapter->rf_mode =3D=3D NFC_RF_INITIATOR)
 		nl_get_targets(adapter);
-- =

2.27.0

--===============4632329553482602679==--

