Content-Type: multipart/mixed; boundary="===============0552899176717597175=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 14/73] ndef: use NDEF_TEXT_RECORD_UTF16_STATUS define
Date: Mon, 19 Jul 2021 13:07:20 +0200
Message-ID: <20210719110819.27340-15-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0552899176717597175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Don't hard-code 0x80 because there is a define for it.  No functional
change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/ndef.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/ndef.c b/src/ndef.c
index 13e3356c2c4c..928e6a10a999 100644
--- a/src/ndef.c
+++ b/src/ndef.c
@@ -1164,8 +1164,8 @@ parse_text_payload(uint8_t *payload, uint32_t length)
 	if (!text_payload)
 		return NULL;
 =

-	/* 0x80 is used to get 7th bit value (0th bit is LSB) */
-	status =3D ((payload[offset] & 0x80) >> 7);
+	/* 0th bit is LSB */
+	status =3D ((payload[offset] & NDEF_TEXT_RECORD_UTF16_STATUS) >> 7);
 =

 	text_payload->encoding =3D (status =3D=3D 0) ?
 					g_strdup("UTF-8") : g_strdup("UTF-16");
-- =

2.27.0

--===============0552899176717597175==--

