Content-Type: multipart/mixed; boundary="===============6198091970149710969=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 02/16] nfctool: annotate printf-like functions as accepting format
Date: Wed, 14 Jul 2021 13:05:04 +0200
Message-ID: <20210714110518.104655-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6198091970149710969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Printf-like functions should have the "format" argument annotated to:
1. Help in detection of format string vulnerabilities (and mistakes).
2. Satisfy -Wformat-nonliteral (-Wformat=3D2) warning.

This fixes clang warnings like:

    tools/nfctool/sniffer.c:206:18: error: format string is not a string li=
teral [-Werror,-Wformat-nonliteral]
                        sprintf(line, fmt, offset);
                                      ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/nfctool/sniffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/nfctool/sniffer.c b/tools/nfctool/sniffer.c
index 3d1d230a50c5..6a38a213c74d 100644
--- a/tools/nfctool/sniffer.c
+++ b/tools/nfctool/sniffer.c
@@ -168,7 +168,6 @@ void sniffer_print_hexdump(FILE *file, guint8 *data, gu=
int32 len,
 	gchar *hexa =3D NULL, *human =3D NULL;
 	guint8 offset_len;
 	guint8 human_offset;
-	gchar *fmt;
 =

 	if (len =3D=3D 0)
 		return;
@@ -185,11 +184,9 @@ void sniffer_print_hexdump(FILE *file, guint8 *data, g=
uint32 len,
 	if (output_len > 0xFFFF) {
 		offset_len =3D 8;
 		human_offset =3D HUMAN_READABLE_OFFSET + 4;
-		fmt =3D "%08X: ";
 	} else {
 		offset_len =3D 4;
 		human_offset =3D HUMAN_READABLE_OFFSET;
-		fmt =3D "%04X: ";
 	}
 =

 	if (print_len) {
@@ -203,7 +200,10 @@ void sniffer_print_hexdump(FILE *file, guint8 *data, g=
uint32 len,
 		if (digits =3D=3D 0) {
 			memset(line, ' ', human_offset);
 =

-			sprintf(line, fmt, offset);
+			if (offset_len =3D=3D 8)
+				sprintf(line, "%08X: ", offset);
+			else
+				sprintf(line, "%04X: ", offset);
 =

 			offset +=3D 16;
 =

-- =

2.27.0

--===============6198091970149710969==--

