Content-Type: multipart/mixed; boundary="===============4172857886592797779=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 07/12] nfc: fdp: drop unneeded cast for printing firmware size in dev_dbg()
Date: Thu, 29 Jul 2021 12:40:17 +0200
Message-ID: <20210729104022.47761-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4172857886592797779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Size of firmware is a type of size_t, so print it directly instead of
casting to int.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 3e542b7389cb..650a140bea46 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -276,8 +276,8 @@ static int fdp_nci_request_firmware(struct nci_dev *nde=
v)
 		(data[FDP_FW_HEADER_SIZE + 2] << 16) |
 		(data[FDP_FW_HEADER_SIZE + 3] << 24);
 =

-	dev_dbg(dev, "RAM patch version: %d, size: %d\n",
-		  info->ram_patch_version, (int) info->ram_patch->size);
+	dev_dbg(dev, "RAM patch version: %d, size: %zu\n",
+		  info->ram_patch_version, info->ram_patch->size);
 =

 =

 	r =3D request_firmware(&info->otp_patch, FDP_OTP_PATCH_NAME, dev);
@@ -293,8 +293,8 @@ static int fdp_nci_request_firmware(struct nci_dev *nde=
v)
 		(data[FDP_FW_HEADER_SIZE+2] << 16) |
 		(data[FDP_FW_HEADER_SIZE+3] << 24);
 =

-	dev_dbg(dev, "OTP patch version: %d, size: %d\n",
-		 info->otp_patch_version, (int) info->otp_patch->size);
+	dev_dbg(dev, "OTP patch version: %d, size: %zu\n",
+		 info->otp_patch_version, info->otp_patch->size);
 	return 0;
 }
 =

-- =

2.27.0

--===============4172857886592797779==--

