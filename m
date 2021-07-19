Content-Type: multipart/mixed; boundary="===============2760152522105136906=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 42/73] snep: remove useless NULL-ify of local pointer variable
Date: Mon, 19 Jul 2021 13:07:48 +0200
Message-ID: <20210719110819.27340-43-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2760152522105136906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Assigning NULL to a local variable (a pointer) at the end of function
does not have any effect as this NULL is not passed outside.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/snep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/snep.c b/src/snep.c
index a1e90243c020..737060139b07 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -206,7 +206,6 @@ static void free_snep_core_fragment(gpointer data)
 		g_free(fragment->data);
 =

 	g_free(fragment);
-	fragment =3D NULL;
 }
 =

 static void free_snep_core_push_data(gpointer userdata, int status)
-- =

2.27.0

--===============2760152522105136906==--

