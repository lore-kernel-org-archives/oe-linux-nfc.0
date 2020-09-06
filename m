Content-Type: multipart/mixed; boundary="===============9140169649710951282=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 9/9] arm64: defconfig: Enable Samsung S3FWRN5 NFC driver
Date: Sun, 06 Sep 2020 17:36:54 +0200
Message-ID: <20200906153654.2925-10-krzk@kernel.org>
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============9140169649710951282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enable the Samsung S3FWRN5 NFC driver present in Exynos5433-based
TM2/TM2E boards.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a03cefd58799..b78a14d43f3f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -199,6 +199,9 @@ CONFIG_MAC80211_LEDS=3Dy
 CONFIG_RFKILL=3Dm
 CONFIG_NET_9P=3Dy
 CONFIG_NET_9P_VIRTIO=3Dy
+CONFIG_NFC=3Dm
+CONFIG_NFC_NCI=3Dm
+CONFIG_NFC_S3FWRN5_I2C=3Dm
 CONFIG_PCI=3Dy
 CONFIG_PCIEPORTBUS=3Dy
 CONFIG_PCI_IOV=3Dy
-- =

2.17.1

--===============9140169649710951282==--

