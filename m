Content-Type: multipart/mixed; boundary="===============8053047500750940501=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 0/9] nfc: s3fwrn5: Few cleanups
Date: Sun, 06 Sep 2020 17:36:45 +0200
Message-ID: <20200906153654.2925-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8053047500750940501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Changes since v1:
1. Rename dtschema file and add additionalProperties:false, as Rob
   suggested,
2. Add Marek's tested-by,
3. New patches: #4, #5, #6, #7 and #9.

Best regards,
Krzysztof


Krzysztof Kozlowski (9):
  dt-bindings: net: nfc: s3fwrn5: Convert to dtschema
  dt-bindings: net: nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
  nfc: s3fwrn5: Remove wrong vendor prefix from GPIOs
  nfc: s3fwrn5: Remove unneeded 'ret' variable
  nfc: s3fwrn5: Add missing CRYPTO_HASH dependency
  nfc: s3fwrn5: Constify s3fwrn5_fw_info when not modified
  MAINTAINERS: Add Krzysztof Kozlowski to Samsung S3FWRN5 and remove
    Robert
  arm64: dts: exynos: Use newer S3FWRN5 GPIO properties in Exynos5433
    TM2
  arm64: defconfig: Enable Samsung S3FWRN5 NFC driver

 CREDITS                                       |  4 +
 .../devicetree/bindings/net/nfc/s3fwrn5.txt   | 25 -------
 .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 73 +++++++++++++++++++
 MAINTAINERS                                   |  5 +-
 .../dts/exynos/exynos5433-tm2-common.dtsi     |  4 +-
 arch/arm64/configs/defconfig                  |  3 +
 drivers/nfc/s3fwrn5/Kconfig                   |  1 +
 drivers/nfc/s3fwrn5/firmware.c                |  4 +-
 drivers/nfc/s3fwrn5/firmware.h                |  2 +-
 drivers/nfc/s3fwrn5/i2c.c                     | 24 +++---
 10 files changed, 104 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
 create mode 100644 Documentation/devicetree/bindings/net/nfc/samsung,s3fwr=
n5.yaml

-- =

2.17.1

--===============8053047500750940501==--

