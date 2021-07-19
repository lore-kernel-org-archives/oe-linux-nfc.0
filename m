Content-Type: multipart/mixed; boundary="===============4698597922339315444=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 06/73] nfctool: fix nfctool_send_dep_link_up() cast-function-type
Date: Mon, 19 Jul 2021 13:07:12 +0200
Message-ID: <20210719110819.27340-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4698597922339315444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix on GCC v10:

    tools/nfctool/main.c: In function =E2=80=98nfctool_targets_found=E2=80=
=99:
    tools/nfctool/main.c:294:5: error: cast between incompatible function t=
ypes from =E2=80=98void (*)(guint32,  guint32)=E2=80=99 {aka =E2=80=98void =
(*)(unsigned int,  unsigned int)=E2=80=99} to =E2=80=98void (*)(void *, voi=
d *)=E2=80=99 [-Werror=3Dcast-function-type]
      294 |     (GFunc)nfctool_send_dep_link_up,
          |     ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/nfctool/main.c b/tools/nfctool/main.c
index c48bf0919657..282df519fcc8 100644
--- a/tools/nfctool/main.c
+++ b/tools/nfctool/main.c
@@ -259,9 +259,9 @@ static int nfctool_snl(void)
 	return nfctool_snl_send_request(adapter);
 }
 =

-static void nfctool_send_dep_link_up(guint32 target_idx, guint32 adapter_i=
dx)
+static void nfctool_send_dep_link_up(gpointer target_idx, gpointer adapter=
_idx)
 {
-	nl_send_dep_link_up(adapter_idx, target_idx);
+	nl_send_dep_link_up(GPOINTER_TO_INT(adapter_idx), GPOINTER_TO_INT(target_=
idx));
 }
 =

 static int nfctool_targets_found(guint32 adapter_idx)
-- =

2.27.0

--===============4698597922339315444==--

