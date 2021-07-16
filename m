Content-Type: multipart/mixed; boundary="===============3604061247322178902=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 3/7] snep: remove useless NULL-ify of local pointer variable
Date: Fri, 16 Jul 2021 12:08:40 +0200
Message-ID: <20210716100844.51360-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210716100844.51360-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3604061247322178902==
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

--===============3604061247322178902==--

