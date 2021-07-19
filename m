Content-Type: multipart/mixed; boundary="===============3217640757120412205=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 60/73] unit: do not pass NULL to memcpy()
Date: Mon, 19 Jul 2021 13:08:06 +0200
Message-ID: <20210719110819.27340-61-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3217640757120412205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

memcpy() should not receive NULL as source pointer and such is passed
from test_snep_read_get_req_frags_client_resp() and
test_snep_read_verify_resp().  ASAN reports:

    unit/test-snep-read.c:325:2: runtime error: null pointer passed as argu=
ment 2, which is declared to never be null
    unit/test-snep-read.c:266:2: runtime error: null pointer passed as argu=
ment 2, which is declared to never be null

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 128937ed910f..ea41ae03a8b2 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -261,7 +261,8 @@ static struct p2p_snep_req_frame *test_snep_build_req_f=
rame(
 	req->version =3D ver;
 	req->request =3D req_type;
 	req->length =3D GUINT_TO_BE(info_len);
-	memcpy(req->ndef, data, payload_len);
+	if (data)
+		memcpy(req->ndef, data, payload_len);
 =

 	return req;
 }
@@ -320,7 +321,8 @@ static struct p2p_snep_resp_frame *test_snep_build_resp=
_frame(
 	resp->version =3D ver;
 	resp->response =3D resp_type;
 	resp->length =3D GUINT_TO_BE(info_len);
-	memcpy(resp->info, data, info_len);
+	if (data)
+		memcpy(resp->info, data, info_len);
 =

 	return resp;
 }
-- =

2.27.0

--===============3217640757120412205==--

