Content-Type: multipart/mixed; boundary="===============2712615186532849240=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 06/12] nfc: nfcsim: constify drvdata (struct nfcsim)
Date: Thu, 29 Jul 2021 12:40:16 +0200
Message-ID: <20210729104022.47761-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2712615186532849240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nfcsim_abort_cmd() does not modify struct nfcsim, so local variable
can be a pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/nfcsim.c b/drivers/nfc/nfcsim.c
index 143dc49b815b..15754671eb4d 100644
--- a/drivers/nfc/nfcsim.c
+++ b/drivers/nfc/nfcsim.c
@@ -240,7 +240,7 @@ static int nfcsim_send(struct nfc_digital_dev *ddev, st=
ruct sk_buff *skb,
 =

 static void nfcsim_abort_cmd(struct nfc_digital_dev *ddev)
 {
-	struct nfcsim *dev =3D nfc_digital_get_drvdata(ddev);
+	const struct nfcsim *dev =3D nfc_digital_get_drvdata(ddev);
 =

 	nfcsim_link_recv_cancel(dev->link_in);
 }
-- =

2.27.0

--===============2712615186532849240==--

