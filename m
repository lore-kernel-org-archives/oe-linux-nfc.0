Content-Type: multipart/mixed; boundary="===============6872946950928981758=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: [PATCH] nfc: nfcmrvl: spi: Fix irq_of_parse_and_map() return value
Date: Fri, 22 Apr 2022 12:47:58 +0200
Message-ID: <20220422104758.64039-1-krzysztof.kozlowski@linaro.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6872946950928981758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.

Fixes: caf6e49bf6d0 ("NFC: nfcmrvl: add spi driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is another issue to https://lore.kernel.org/all/20220422084605.2775542=
-1-lv.ruyi(a)zte.com.cn/
---
 drivers/nfc/nfcmrvl/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index a38e2fcdfd39..01f0a08a381c 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -115,7 +115,7 @@ static int nfcmrvl_spi_parse_dt(struct device_node *nod=
e,
 	}
 =

 	ret =3D irq_of_parse_and_map(node, 0);
-	if (ret < 0) {
+	if (!ret) {
 		pr_err("Unable to get irq, error: %d\n", ret);
 		return ret;
 	}
-- =

2.32.0

--===============6872946950928981758==--

