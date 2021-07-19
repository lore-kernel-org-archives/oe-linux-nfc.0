Content-Type: multipart/mixed; boundary="===============6487145221429769327=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 40/73] tag: do not open-code freeing ndef message
Date: Mon, 19 Jul 2021 13:07:46 +0200
Message-ID: <20210719110819.27340-41-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6487145221429769327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use near_ndef_msg_free() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/tag.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/src/tag.c b/src/tag.c
index 520368b1552c..ce8c477d9527 100644
--- a/src/tag.c
+++ b/src/tag.c
@@ -459,14 +459,12 @@ static DBusMessage *write_ndef(DBusConnection *conn,
 		break;
 =

 	default:
-		g_free(ndef->data);
-		g_free(ndef);
+		near_ndef_msg_free(ndef);
 =

 		return __near_error_failed(msg, EOPNOTSUPP);
 	}
 =

-	g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 =

 	tag->write_ndef =3D ndef_with_header;
 	err =3D __near_tag_write(tag, ndef_with_header, write_cb);
-- =

2.27.0

--===============6487145221429769327==--

