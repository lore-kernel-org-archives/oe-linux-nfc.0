Content-Type: multipart/mixed; boundary="===============7934467504712344562=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 05/12] nfc: virtual_ncidev: constify pointer to nfc_dev
Date: Thu, 29 Jul 2021 12:40:15 +0200
Message-ID: <20210729104022.47761-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7934467504712344562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

virtual_ncidev_ioctl() does not modify struct nfc_dev, so local variable
can be a pointer to const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/virtual_ncidev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/virtual_ncidev.c b/drivers/nfc/virtual_ncidev.c
index b914ab2c2109..2ee0ec4bb739 100644
--- a/drivers/nfc/virtual_ncidev.c
+++ b/drivers/nfc/virtual_ncidev.c
@@ -170,7 +170,7 @@ static int virtual_ncidev_close(struct inode *inode, st=
ruct file *file)
 static long virtual_ncidev_ioctl(struct file *flip, unsigned int cmd,
 				 unsigned long arg)
 {
-	struct nfc_dev *nfc_dev =3D ndev->nfc_dev;
+	const struct nfc_dev *nfc_dev =3D ndev->nfc_dev;
 	void __user *p =3D (void __user *)arg;
 =

 	if (cmd !=3D IOCTL_GET_NCIDEV_IDX)
-- =

2.27.0

--===============7934467504712344562==--

