Content-Type: multipart/mixed; boundary="===============6860214119645456260=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 41/73] snep: do not open-code freeing ndef message
Date: Mon, 19 Jul 2021 13:07:47 +0200
Message-ID: <20210719110819.27340-42-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6860214119645456260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use near_ndef_msg_free() instead of open-coding it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/snep.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/src/snep.c b/src/snep.c
index c0a1d1a00491..a1e90243c020 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -147,8 +147,7 @@ void near_snep_core_parse_handover_record(int client_fd=
, uint8_t *ndef,
 	near_snep_core_response_with_info(client_fd, NEAR_SNEP_RESP_SUCCESS,
 								msg->data, msg->length);
 =

-	g_free(msg->data);
-	g_free(msg);
+	near_ndef_msg_free(msg);
 }
 =

 /*
@@ -787,9 +786,7 @@ done:
 		}
 	}
 =

-	if (ndef)
-		g_free(ndef->data);
-	g_free(ndef);
+	near_ndef_msg_free(ndef);
 }
 =

 /* SNEP Core: on P2P push */
-- =

2.27.0

--===============6860214119645456260==--

