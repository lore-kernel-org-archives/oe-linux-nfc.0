Content-Type: multipart/mixed; boundary="===============7065506311209736197=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 50/73] unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
Date: Mon, 19 Jul 2021 13:07:56 +0200
Message-ID: <20210719110819.27340-51-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7065506311209736197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Raw data bytes should be passed as pointer to uint8_t and the calling
function already uses that type.  This fixes warning:

    unit/test-snep-read.c: In function =E2=80=98test_snep_read_recv_fragmen=
ts=E2=80=99:
    unit/test-snep-read.c:408:21: error: pointer of type =E2=80=98void *=E2=
=80=99 used in arithmetic [-Werror=3Dpointer-arith]
      408 |   memcpy(data_recvd + offset, resp, nbytes);
          |                     ^

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-snep-read.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/unit/test-snep-read.c b/unit/test-snep-read.c
index 5511fecf5c17..78db58ba859f 100644
--- a/unit/test-snep-read.c
+++ b/unit/test-snep-read.c
@@ -386,7 +386,7 @@ static bool test_snep_read_send_fragment(size_t frag_le=
n,
  * @param[out] data             Must be preallocated
  */
 static void test_snep_read_recv_fragments(uint32_t frag_len,
-				uint32_t remaining_bytes, void *data_recvd)
+				uint32_t remaining_bytes, uint8_t *data_recvd)
 {
 	struct p2p_snep_resp_frame *resp;
 	uint32_t offset =3D 0;
-- =

2.27.0

--===============7065506311209736197==--

