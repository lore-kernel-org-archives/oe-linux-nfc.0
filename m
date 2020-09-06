Content-Type: multipart/mixed; boundary="===============1418357203618706684=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 8/9] arm64: dts: exynos: Use newer S3FWRN5 GPIO properties in Exynos5433 TM2
Date: Sun, 06 Sep 2020 17:36:53 +0200
Message-ID: <20200906153654.2925-9-krzk@kernel.org>
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1418357203618706684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since "s3fwrn5" is not a valid vendor prefix, use new GPIO properties
instead of the deprecated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/a=
rm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 250fc01de78d..24aab3ea3f52 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -795,8 +795,8 @@
 		reg =3D <0x27>;
 		interrupt-parent =3D <&gpa1>;
 		interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH>;
-		s3fwrn5,en-gpios =3D <&gpf1 4 GPIO_ACTIVE_HIGH>;
-		s3fwrn5,fw-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
+		en-gpios =3D <&gpf1 4 GPIO_ACTIVE_HIGH>;
+		wake-gpios =3D <&gpj0 2 GPIO_ACTIVE_HIGH>;
 	};
 };
 =

-- =

2.17.1

--===============1418357203618706684==--

