Content-Type: multipart/mixed; boundary="===============2798878350367099042=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 01/12] nfc: constify passed nfc_dev
Date: Thu, 29 Jul 2021 12:40:11 +0200
Message-ID: <20210729104022.47761-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2798878350367099042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The struct nfc_dev is not modified by nfc_get_drvdata() and
nfc_device_name() so it can be made a const.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/net/nfc/nfc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
index c9ff341d57e4..5dee575fbe86 100644
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -245,7 +245,7 @@ static inline void nfc_set_drvdata(struct nfc_dev *dev,=
 void *data)
  *
  * @dev: The nfc device
  */
-static inline void *nfc_get_drvdata(struct nfc_dev *dev)
+static inline void *nfc_get_drvdata(const struct nfc_dev *dev)
 {
 	return dev_get_drvdata(&dev->dev);
 }
@@ -255,7 +255,7 @@ static inline void *nfc_get_drvdata(struct nfc_dev *dev)
  *
  * @dev: The nfc device whose name to return
  */
-static inline const char *nfc_device_name(struct nfc_dev *dev)
+static inline const char *nfc_device_name(const struct nfc_dev *dev)
 {
 	return dev_name(&dev->dev);
 }
-- =

2.27.0

--===============2798878350367099042==--

