Content-Type: multipart/mixed; boundary="===============8173931057576792153=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 08/12] nfc: fdp: use unsigned int as loop iterator
Date: Thu, 29 Jul 2021 12:40:18 +0200
Message-ID: <20210729104022.47761-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8173931057576792153==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Loop iterators are simple integers, no point to optimize the size and
use u8.  It only raises the question whether the variable is used in
some other context.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 650a140bea46..3f5fba922c4d 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -611,7 +611,8 @@ static int fdp_nci_core_get_config_rsp_packet(struct nc=
i_dev *ndev,
 	struct fdp_nci_info *info =3D nci_get_drvdata(ndev);
 	struct device *dev =3D &info->phy->i2c_dev->dev;
 	struct nci_core_get_config_rsp *rsp =3D (void *) skb->data;
-	u8 i, *p;
+	unsigned int i;
+	u8 *p;
 =

 	if (rsp->status =3D=3D NCI_STATUS_OK) {
 =

-- =

2.27.0

--===============8173931057576792153==--

