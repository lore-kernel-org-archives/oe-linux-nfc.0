Content-Type: multipart/mixed; boundary="===============1623308848692255023=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 1/8] nfc: mrvl: correct nfcmrvl_spi_parse_dt() device_node argument
Date: Fri, 30 Jul 2021 08:56:18 +0200
Message-ID: <20210730065625.34010-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210730065625.34010-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1623308848692255023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The device_node in nfcmrvl_spi_parse_dt() cannot be const as it is
passed to OF functions which modify it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcmrvl/spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index d64abd0c4df3..b182ab2e03c0 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -106,7 +106,7 @@ static const struct nfcmrvl_if_ops spi_ops =3D {
 	.nci_update_config =3D nfcmrvl_spi_nci_update_config,
 };
 =

-static int nfcmrvl_spi_parse_dt(const struct device_node *node,
+static int nfcmrvl_spi_parse_dt(struct device_node *node,
 				struct nfcmrvl_platform_data *pdata)
 {
 	int ret;
-- =

2.27.0

--===============1623308848692255023==--

