Content-Type: multipart/mixed; boundary="===============2206427917507088922=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 14/34] nciattach: do not shadow other local 'opt' variable (-Wshadow)
Date: Sun, 11 Jul 2021 22:23:31 +0200
Message-ID: <20210711202351.18363-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2206427917507088922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix -Wshadow warning:

    tools/nciattach.c: In function =E2=80=98main=E2=80=99:
    tools/nciattach.c:272:9: error: declaration of =E2=80=98opt=E2=80=99 sh=
adows a previous local [-Werror=3Dshadow]
      272 |   char *opt;
          |         ^~~
    tools/nciattach.c:236:24: note: shadowed declaration is here
      236 |  int detach, printpid, opt, i, n, ld, err;
          |                        ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nciattach.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/nciattach.c b/tools/nciattach.c
index 574c0fbe784a..4ac37d82d545 100644
--- a/tools/nciattach.c
+++ b/tools/nciattach.c
@@ -269,16 +269,16 @@ int main(int argc, char *argv[])
 	}
 =

 	for (n =3D 0; optind < argc; n++, optind++) {
-		char *opt;
+		char *option;
 =

-		opt =3D argv[optind];
+		option =3D argv[optind];
 =

 		switch(n) {
 		case 0:
 			dev[0] =3D 0;
-			if (!strchr(opt, '/'))
+			if (!strchr(option, '/'))
 				strcpy(dev, "/dev/");
-			strcat(dev, opt);
+			strcat(dev, option);
 			break;
 =

 		case 1:
-- =

2.27.0

--===============2206427917507088922==--

