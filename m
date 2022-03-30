Content-Type: multipart/mixed; boundary="===============6450977330191609474=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: [PATCH 1/2] dt-bindings: update Krzysztof Kozlowski's email
Date: Wed, 30 Mar 2022 09:40:15 +0200
Message-ID: <20220330074016.12896-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6450977330191609474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Krzysztof Kozlowski <krzk@kernel.org>

Krzysztof Kozlowski's @canonical.com email stopped working, so switch to
generic @kernel.org account for all Devicetree bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/clock/samsung,exynos-audss-clock.yaml   | 2 +-
 .../devicetree/bindings/clock/samsung,exynos-clock.yaml         | 2 +-
 .../devicetree/bindings/clock/samsung,exynos-ext-clock.yaml     | 2 +-
 .../devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml | 2 +-
 .../devicetree/bindings/clock/samsung,exynos5260-clock.yaml     | 2 +-
 .../devicetree/bindings/clock/samsung,exynos5410-clock.yaml     | 2 +-
 .../devicetree/bindings/clock/samsung,exynos5433-clock.yaml     | 2 +-
 .../devicetree/bindings/clock/samsung,exynos7-clock.yaml        | 2 +-
 .../devicetree/bindings/clock/samsung,exynos7885-clock.yaml     | 2 +-
 .../devicetree/bindings/clock/samsung,exynos850-clock.yaml      | 2 +-
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml    | 2 +-
 .../devicetree/bindings/clock/samsung,s5pv210-audss-clock.yaml  | 2 +-
 .../devicetree/bindings/clock/samsung,s5pv210-clock.yaml        | 2 +-
 .../devicetree/bindings/devfreq/event/samsung,exynos-nocp.yaml  | 2 +-
 .../devicetree/bindings/devfreq/event/samsung,exynos-ppmu.yaml  | 2 +-
 .../bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml       | 2 +-
 .../bindings/display/samsung/samsung,exynos-hdmi.yaml           | 2 +-
 .../bindings/display/samsung/samsung,exynos-mixer.yaml          | 2 +-
 .../bindings/display/samsung/samsung,exynos5433-decon.yaml      | 2 +-
 .../bindings/display/samsung/samsung,exynos5433-mic.yaml        | 2 +-
 .../bindings/display/samsung/samsung,exynos7-decon.yaml         | 2 +-
 .../devicetree/bindings/display/samsung/samsung,fimd.yaml       | 2 +-
 Documentation/devicetree/bindings/extcon/maxim,max77843.yaml    | 2 +-
 Documentation/devicetree/bindings/hwmon/lltc,ltc4151.yaml       | 2 +-
 Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml  | 2 +-
 Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml    | 2 +-
 Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml          | 2 +-
 Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml          | 2 +-
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml          | 2 +-
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml  | 2 +-
 .../interrupt-controller/samsung,exynos4210-combiner.yaml       | 2 +-
 Documentation/devicetree/bindings/leds/maxim,max77693.yaml      | 2 +-
 .../devicetree/bindings/memory-controllers/brcm,dpfe-cpu.yaml   | 2 +-
 .../bindings/memory-controllers/ddr/jedec,lpddr2-timings.yaml   | 2 +-
 .../bindings/memory-controllers/ddr/jedec,lpddr2.yaml           | 2 +-
 .../bindings/memory-controllers/ddr/jedec,lpddr3-timings.yaml   | 2 +-
 .../bindings/memory-controllers/ddr/jedec,lpddr3.yaml           | 2 +-
 .../memory-controllers/marvell,mvebu-sdram-controller.yaml      | 2 +-
 .../bindings/memory-controllers/qca,ath79-ddr-controller.yaml   | 2 +-
 .../bindings/memory-controllers/renesas,h8300-bsc.yaml          | 2 +-
 .../bindings/memory-controllers/samsung,exynos5422-dmc.yaml     | 2 +-
 .../bindings/memory-controllers/synopsys,ddrc-ecc.yaml          | 2 +-
 .../devicetree/bindings/memory-controllers/ti,da8xx-ddrctl.yaml | 2 +-
 Documentation/devicetree/bindings/mfd/maxim,max14577.yaml       | 2 +-
 Documentation/devicetree/bindings/mfd/maxim,max77686.yaml       | 2 +-
 Documentation/devicetree/bindings/mfd/maxim,max77693.yaml       | 2 +-
 Documentation/devicetree/bindings/mfd/maxim,max77802.yaml       | 2 +-
 Documentation/devicetree/bindings/mfd/maxim,max77843.yaml       | 2 +-
 .../devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml       | 2 +-
 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml      | 2 +-
 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml      | 2 +-
 Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml      | 2 +-
 Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml      | 2 +-
 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml          | 2 +-
 Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml        | 2 +-
 Documentation/devicetree/bindings/net/nfc/nxp,pn544.yaml        | 2 +-
 Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml        | 2 +-
 Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml      | 2 +-
 Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml        | 2 +-
 Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml      | 2 +-
 Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml | 2 +-
 .../devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml        | 2 +-
 .../devicetree/bindings/phy/samsung,exynos5250-sata-phy.yaml    | 2 +-
 .../devicetree/bindings/phy/samsung,mipi-video-phy.yaml         | 2 +-
 Documentation/devicetree/bindings/phy/samsung,usb2-phy.yaml     | 2 +-
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 +-
 .../devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.yaml  | 2 +-
 .../devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml   | 2 +-
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 +-
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml  | 2 +-
 .../devicetree/bindings/power/supply/maxim,max14577.yaml        | 2 +-
 .../devicetree/bindings/power/supply/maxim,max77693.yaml        | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max14577.yaml | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max77686.yaml | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max77693.yaml | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max77802.yaml | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max77843.yaml | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max8952.yaml  | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max8973.yaml  | 2 +-
 Documentation/devicetree/bindings/regulator/maxim,max8997.yaml  | 2 +-
 .../devicetree/bindings/regulator/samsung,s2mpa01.yaml          | 2 +-
 .../devicetree/bindings/regulator/samsung,s2mps11.yaml          | 2 +-
 .../devicetree/bindings/regulator/samsung,s2mps13.yaml          | 2 +-
 .../devicetree/bindings/regulator/samsung,s2mps14.yaml          | 2 +-
 .../devicetree/bindings/regulator/samsung,s2mps15.yaml          | 2 +-
 .../devicetree/bindings/regulator/samsung,s2mpu02.yaml          | 2 +-
 .../devicetree/bindings/regulator/samsung,s5m8767.yaml          | 2 +-
 .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml        | 2 +-
 Documentation/devicetree/bindings/rng/timeriomem_rng.yaml       | 2 +-
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml   | 2 +-
 Documentation/devicetree/bindings/sound/samsung,arndale.yaml    | 2 +-
 Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml   | 2 +-
 Documentation/devicetree/bindings/sound/samsung,snow.yaml       | 2 +-
 Documentation/devicetree/bindings/sound/samsung,tm2.yaml        | 2 +-
 .../devicetree/bindings/spi/samsung,spi-peripheral-props.yaml   | 2 +-
 Documentation/devicetree/bindings/spi/samsung,spi.yaml          | 2 +-
 .../devicetree/bindings/thermal/samsung,exynos-thermal.yaml     | 2 +-
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml  | 2 +-
 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml  | 2 +-
 99 files changed, 99 insertions(+), 99 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-audss-c=
lock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-cl=
ock.yaml
index f14f1d39da36..d819dfaafff9 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.ya=
ml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.ya=
ml
@@ -8,7 +8,7 @@ title: Samsung Exynos SoC Audio SubSystem clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.y=
aml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
index 4e8062860986..0589a63e273a 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -8,7 +8,7 @@ title: Samsung Exynos SoC clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clo=
ck.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.=
yaml
index 64d027dbe3b2..c98eff64f2b5 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
@@ -8,7 +8,7 @@ title: Samsung SoC external/osc/XXTI/XusbXTI clock
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp=
-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos4412-is=
p-clock.yaml
index 1ed64add4355..b644bbd0df38 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.=
yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.=
yaml
@@ -8,7 +8,7 @@ title: Samsung Exynos4412 SoC ISP clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos5260-clo=
ck.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos5260-clock.=
yaml
index a3fac5c6809d..b05f83533e3d 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos5260-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos5260-clock.yaml
@@ -8,7 +8,7 @@ title: Samsung Exynos5260 SoC clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos5410-clo=
ck.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos5410-clock.=
yaml
index 032862e9f55b..b737c9d35a1c 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos5410-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos5410-clock.yaml
@@ -8,7 +8,7 @@ title: Samsung Exynos5410 SoC clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos5433-clo=
ck.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.=
yaml
index edd1b4ac4334..3f9326e09f79 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos5433-clock.yaml
@@ -8,7 +8,7 @@ title: Samsung Exynos5433 SoC clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.=
yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
index 599baf0b7231..c137c6744ef9 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
@@ -8,7 +8,7 @@ title: Samsung Exynos7 SoC clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7885-clo=
ck.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.=
yaml
index 7e5a9cac2fd2..5073e569a47f 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml
@@ -9,7 +9,7 @@ title: Samsung Exynos7885 SoC clock controller
 maintainers:
   - D=C3=A1vid Vir=C3=A1g <virag.david003@gmail.com>
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-cloc=
k.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.ya=
ml
index 80ba60838f2b..aa11815ad3a3 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -9,7 +9,7 @@ title: Samsung Exynos850 SoC clock controller
 maintainers:
   - Sam Protsenko <semen.protsenko@linaro.org>
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b=
/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index 1410c51e0e7d..9248bfc16d48 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2M and S5M family clock generator block
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-=
clock.yaml b/Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-=
clock.yaml
index ae8f8fc93233..2659854ea1c0 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.y=
aml
+++ b/Documentation/devicetree/bindings/clock/samsung,s5pv210-audss-clock.y=
aml
@@ -8,7 +8,7 @@ title: Samsung S5Pv210 SoC Audio SubSystem clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.=
yaml b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.yaml
index dcb29a2d1159..67a33665cf00 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.yaml
@@ -8,7 +8,7 @@ title: Samsung S5P6442/S5PC110/S5PV210 SoC clock controller
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/devfreq/event/samsung,exynos=
-nocp.yaml b/Documentation/devicetree/bindings/devfreq/event/samsung,exynos=
-nocp.yaml
index d318fccf78f1..2bdd05af6079 100644
--- a/Documentation/devicetree/bindings/devfreq/event/samsung,exynos-nocp.y=
aml
+++ b/Documentation/devicetree/bindings/devfreq/event/samsung,exynos-nocp.y=
aml
@@ -8,7 +8,7 @@ title: Samsung Exynos NoC (Network on Chip) Probe
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   The Samsung Exynos542x SoC has a NoC (Network on Chip) Probe for NoC bus.
diff --git a/Documentation/devicetree/bindings/devfreq/event/samsung,exynos=
-ppmu.yaml b/Documentation/devicetree/bindings/devfreq/event/samsung,exynos=
-ppmu.yaml
index c9a8cb5fd555..e300df4b47f3 100644
--- a/Documentation/devicetree/bindings/devfreq/event/samsung,exynos-ppmu.y=
aml
+++ b/Documentation/devicetree/bindings/devfreq/event/samsung,exynos-ppmu.y=
aml
@@ -8,7 +8,7 @@ title: Samsung Exynos SoC PPMU (Platform Performance Monito=
ring Unit)
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   The Samsung Exynos SoC has PPMU (Platform Performance Monitoring Unit) f=
or
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exyn=
os-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/samsung/samsun=
g,exynos-hdmi-ddc.yaml
index f998a3a5b71f..919734c05c0b 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi=
-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi=
-ddc.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exyn=
os-hdmi.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,ex=
ynos-hdmi.yaml
index cb8e735ce3bd..63379fae3636 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi=
.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi=
.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exyn=
os-mixer.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,e=
xynos-mixer.yaml
index ba40284ac66f..00e325a19cb1 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixe=
r.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixe=
r.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description:
   Samsung Exynos SoC Mixer is responsible for mixing and blending multiple=
 data
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exyn=
os5433-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsu=
ng,exynos5433-decon.yaml
index 6f796835ea03..7c37470bd329 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-=
decon.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-=
decon.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   DECON (Display and Enhancement Controller) is the Display Controller for=
 the
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exyn=
os5433-mic.yaml b/Documentation/devicetree/bindings/display/samsung/samsung=
,exynos5433-mic.yaml
index 01fccb138ebd..c5c6239c28d0 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-=
mic.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos5433-=
mic.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   MIC (Mobile Image Compressor) resides between DECON and MIPI DSI. MIPI D=
SI is
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exyn=
os7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,=
exynos7-decon.yaml
index afa137d47922..320eedc61a5b 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-dec=
on.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-dec=
on.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   DECON (Display and Enhancement Controller) is the Display Controller for=
 the
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,fimd=
.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
index 9cf5f120d516..c62ea9d22843 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml b=
/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
index f9ffe3d6f957..03d6b8dbbdd3 100644
--- a/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
+++ b/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
@@ -8,7 +8,7 @@ title: Maxim MAX77843 MicroUSB and Companion Power Manageme=
nt IC Extcon
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77843 MicroUSB
diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4151.yaml b/Do=
cumentation/devicetree/bindings/hwmon/lltc,ltc4151.yaml
index 4b5851c326f7..b1a4c235376e 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc4151.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4151.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: LTC4151 High Voltage I2C Current and Voltage Monitor
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml=
 b/Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml
index c42051f8a191..028d6e570131 100644
--- a/Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml
+++ b/Documentation/devicetree/bindings/hwmon/microchip,mcp3021.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Microchip MCP3021 A/D converter
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml b=
/Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml
index 4669217d01e1..80df7182ea28 100644
--- a/Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht15.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Sensirion SHT15 humidity and temperature sensor
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Docum=
entation/devicetree/bindings/hwmon/ti,tmp102.yaml
index d3eff4fac107..c5a889e3e27b 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: TMP102 temperature sensor
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Docum=
entation/devicetree/bindings/hwmon/ti,tmp108.yaml
index eda55bbc172d..dcbc6fbc3b48 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: TMP108 temperature sensor
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Docum=
entation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 19874e8b73b9..3e52a0db6c41 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung's High Speed I2C controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   The Samsung's High Speed I2C controller is used to interface with I2C de=
vices
diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index 84051b0129c2..c26230518957 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S3C/S5P/Exynos SoC I2C Controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/samsung=
,exynos4210-combiner.yaml b/Documentation/devicetree/bindings/interrupt-con=
troller/samsung,exynos4210-combiner.yaml
index d631b7589d50..72456a07dac9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/samsung,exynos=
4210-combiner.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/samsung,exynos=
4210-combiner.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC Interrupt Combiner Controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   Samsung's Exynos4 architecture includes a interrupt combiner controller =
which
diff --git a/Documentation/devicetree/bindings/leds/maxim,max77693.yaml b/D=
ocumentation/devicetree/bindings/leds/maxim,max77693.yaml
index 86a0005cf156..e27f57bb52ae 100644
--- a/Documentation/devicetree/bindings/leds/maxim,max77693.yaml
+++ b/Documentation/devicetree/bindings/leds/maxim,max77693.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX77693 MicroUSB and Companion Power Management IC LEDs
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77693 MicroUSB Integ=
rated
diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,dpfe=
-cpu.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,dpfe-=
cpu.yaml
index 769f13250047..08cbdcddfead 100644
--- a/Documentation/devicetree/bindings/memory-controllers/brcm,dpfe-cpu.ya=
ml
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,dpfe-cpu.ya=
ml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: DDR PHY Front End (DPFE) for Broadcom STB
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Markus Mayer <mmayer@broadcom.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec=
,lpddr2-timings.yaml b/Documentation/devicetree/bindings/memory-controllers=
/ddr/jedec,lpddr2-timings.yaml
index f3e62ee07126..1daa66592477 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2=
-timings.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2=
-timings.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: LPDDR2 SDRAM AC timing parameters for a given speed-bin
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec=
,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jed=
ec,lpddr2.yaml
index dd2141cad866..9d78f140609b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2=
.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2=
.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: LPDDR2 SDRAM compliant to JEDEC JESD209-2
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec=
,lpddr3-timings.yaml b/Documentation/devicetree/bindings/memory-controllers=
/ddr/jedec,lpddr3-timings.yaml
index 97c3e988af5f..5c6512c1e1e3 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3=
-timings.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3=
-timings.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: LPDDR3 SDRAM AC timing parameters for a given speed-bin
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec=
,lpddr3.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jed=
ec,lpddr3.yaml
index c542f32c39fa..48908a19473c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3=
.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3=
.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: LPDDR3 SDRAM compliant to JEDEC JESD209-3
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/marvell,m=
vebu-sdram-controller.yaml b/Documentation/devicetree/bindings/memory-contr=
ollers/marvell,mvebu-sdram-controller.yaml
index 14a6bc8f421f..9249624c4fa0 100644
--- a/Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-sd=
ram-controller.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-sd=
ram-controller.yaml
@@ -8,7 +8,7 @@ title: Marvell MVEBU SDRAM controller
 =

 maintainers:
   - Jan Luebbe <jlu@pengutronix.de>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/memory-controllers/qca,ath79=
-ddr-controller.yaml b/Documentation/devicetree/bindings/memory-controllers=
/qca,ath79-ddr-controller.yaml
index 9566b3421f03..0c511ab906bf 100644
--- a/Documentation/devicetree/bindings/memory-controllers/qca,ath79-ddr-co=
ntroller.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qca,ath79-ddr-co=
ntroller.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Atheros AR7xxx/AR9xxx DDR controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   The DDR controller of the AR7xxx and AR9xxx families provides an interfa=
ce to
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,h=
8300-bsc.yaml b/Documentation/devicetree/bindings/memory-controllers/renesa=
s,h8300-bsc.yaml
index 2b18cef99511..514b2c5f8858 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,h8300-bs=
c.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,h8300-bs=
c.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: H8/300 bus controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Yoshinori Sato <ysato@users.sourceforge.jp>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/memory-controllers/samsung,e=
xynos5422-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/s=
amsung,exynos5422-dmc.yaml
index f152243f6b18..098348b2b815 100644
--- a/Documentation/devicetree/bindings/memory-controllers/samsung,exynos54=
22-dmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos54=
22-dmc.yaml
@@ -9,7 +9,7 @@ title: |
   Controller device
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Lukasz Luba <lukasz.luba@arm.com>
 =

 description: |
diff --git a/Documentation/devicetree/bindings/memory-controllers/synopsys,=
ddrc-ecc.yaml b/Documentation/devicetree/bindings/memory-controllers/synops=
ys,ddrc-ecc.yaml
index fb7ae38a9c86..06812512e9b2 100644
--- a/Documentation/devicetree/bindings/memory-controllers/synopsys,ddrc-ec=
c.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/synopsys,ddrc-ec=
c.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Synopsys IntelliDDR Multi Protocol memory controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Manish Narani <manish.narani@xilinx.com>
   - Michal Simek <michal.simek@xilinx.com>
 =

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,da8xx-=
ddrctl.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,da8xx=
-ddrctl.yaml
index 9ed51185ff99..382ddab60fbd 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,da8xx-ddrctl.=
yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,da8xx-ddrctl.=
yaml
@@ -8,7 +8,7 @@ title: Texas Instruments da8xx DDR2/mDDR memory controller
 =

 maintainers:
   - Bartosz Golaszewski <bgolaszewski@baylibre.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   Documentation:
diff --git a/Documentation/devicetree/bindings/mfd/maxim,max14577.yaml b/Do=
cumentation/devicetree/bindings/mfd/maxim,max14577.yaml
index 27870b8760a6..52edd1bf549f 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max14577.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max14577.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX14577/MAX77836 MicroUSB and Companion Power Management IC
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX14577/MAX77836 Micro=
USB
diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77686.yaml b/Do=
cumentation/devicetree/bindings/mfd/maxim,max77686.yaml
index 859655a789c3..d027aabe453b 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77686.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77686.yaml
@@ -8,7 +8,7 @@ title: Maxim MAX77686 Power Management IC
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77686 Power Manageme=
nt
diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77693.yaml b/Do=
cumentation/devicetree/bindings/mfd/maxim,max77693.yaml
index 906101197e11..1b06a77ec798 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77693.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77693.yaml
@@ -8,7 +8,7 @@ title: Maxim MAX77693 MicroUSB and Companion Power Manageme=
nt IC
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77693 MicroUSB
diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77802.yaml b/Do=
cumentation/devicetree/bindings/mfd/maxim,max77802.yaml
index baa1346ac5d5..ad2013900b03 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77802.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77802.yaml
@@ -8,7 +8,7 @@ title: Maxim MAX77802 Power Management IC
 =

 maintainers:
   - Javier Martinez Canillas <javier@dowhile0.org>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77802 Power Manageme=
nt
diff --git a/Documentation/devicetree/bindings/mfd/maxim,max77843.yaml b/Do=
cumentation/devicetree/bindings/mfd/maxim,max77843.yaml
index 61a0f9dcb983..f30f96bbff43 100644
--- a/Documentation/devicetree/bindings/mfd/maxim,max77843.yaml
+++ b/Documentation/devicetree/bindings/mfd/maxim,max77843.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX77843 MicroUSB and Companion Power Management IC
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77843 MicroUSB
diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass=
.yaml b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
index bae55c98961c..f7bb67d10eff 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC Low Power Audio Subsystem (LPASS)
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml b/D=
ocumentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
index 017befdf8adb..055dfc337c2f 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPA01 Power Management IC
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/D=
ocumentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index 771b3f16da96..5ff6546c72b7 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPS11/13/14/15 and S2MPU02 Power Management IC
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/D=
ocumentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
index 5531718abdf0..10c7b408f33a 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S5M8767 Power Management IC
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml b/D=
ocumentation/devicetree/bindings/net/nfc/marvell,nci.yaml
index 15a45db3899a..1bcaf6ba822c 100644
--- a/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Marvell International Ltd. NCI NFC controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml b/Docum=
entation/devicetree/bindings/net/nfc/nxp,nci.yaml
index 7465aea2e1c0..e381a3c14836 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
@@ -8,7 +8,7 @@ title: NXP Semiconductors NCI NFC controller
 =

 maintainers:
   - Charles Gorand <charles.gorand@effinnov.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml b/Doc=
umentation/devicetree/bindings/net/nfc/nxp,pn532.yaml
index d8ba5a18db98..0509e0166345 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,pn532.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP Semiconductors PN532 NFC controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,pn544.yaml b/Doc=
umentation/devicetree/bindings/net/nfc/nxp,pn544.yaml
index d520414de463..18b3a7d819df 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,pn544.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,pn544.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP Semiconductors PN544 NFC Controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml b/Doc=
umentation/devicetree/bindings/net/nfc/st,st-nci.yaml
index a6a1bc788d29..ef1155038a2f 100644
--- a/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/st,st-nci.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: STMicroelectronics ST NCI NFC controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml b/D=
ocumentation/devicetree/bindings/net/nfc/st,st21nfca.yaml
index 4356eacde8aa..8a7274357b46 100644
--- a/Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/st,st21nfca.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: STMicroelectronics SAS ST21NFCA NFC controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml b/Doc=
umentation/devicetree/bindings/net/nfc/st,st95hf.yaml
index d3bca376039e..963d9531a856 100644
--- a/Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/st,st95hf.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: STMicroelectronics ST95HF NFC controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml b/D=
ocumentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
index 40da2ac98978..404c8df99364 100644
--- a/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Texas Instruments TRF7970A RFID/NFC/15693 Transceiver
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Mark Greer <mgreer@animalcreek.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yam=
l b/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml
index 838c6d480ce6..b03b2f00cc5b 100644
--- a/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,dp-video-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC DisplayPort PHY
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Marek Szyprowski <m.szyprowski@samsung.com>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.=
yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
index c61574e10b2a..3e5f035de2e9 100644
--- a/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Joonyoung Shim <jy0922.shim@samsung.com>
   - Seung-Woo Kim <sw0312.kim@samsung.com>
   - Kyungmin Park <kyungmin.park@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-=
phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-ph=
y.yaml
index 62b39bb46585..8751e559484f 100644
--- a/Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos5250-sata-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos5250 SoC SATA PHY
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Marek Szyprowski <m.szyprowski@samsung.com>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

diff --git a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.y=
aml b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
index 54aa056b224d..415440aaad89 100644
--- a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S5P/Exynos SoC MIPI CSIS/DSIM DPHY
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Marek Szyprowski <m.szyprowski@samsung.com>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb2-phy.yaml b/=
Documentation/devicetree/bindings/phy/samsung,usb2-phy.yaml
index 056e270a4e88..d9f22a801cbf 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb2-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S5P/Exynos SoC USB 2.0 PHY
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Marek Szyprowski <m.szyprowski@samsung.com>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yam=
l b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index f83f0f8135b9..5ba55f9f20cc 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC USB 3.0 DRD PHY USB 2.0 PHY
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Marek Szyprowski <m.szyprowski@samsung.com>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio=
-bank.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio=
-bank.yaml
index f73348c54748..8cf3c47ab86b 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.y=
aml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.y=
aml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S3C/S5P/Exynos SoC pin controller - gpio bank
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins=
-cfg.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-=
cfg.yaml
index c71939ac8b63..9869d4dceddb 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.ya=
ml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.ya=
ml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S3C/S5P/Exynos SoC pin controller - pins configuration
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wake=
up-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinct=
rl-wakeup-interrupt.yaml
index a822f70f5702..1de91a51234d 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-inte=
rrupt.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S3C/S5P/Exynos SoC pin controller - wake-up interrupt contr=
oller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml=
 b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 989e48c051cf..3a65c66ca71d 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S3C/S5P/Exynos SoC pin controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
   - Tomasz Figa <tomasz.figa@gmail.com>
 =

diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max14577.=
yaml b/Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
index 3978b48299de..4d3a1d09036f 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX14577/MAX77836 MicroUSB and Companion Power Management IC =
Charger
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX14577/MAX77836 Micro=
USB
diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max77693.=
yaml b/Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
index a21dc1a8890f..f5fd53debbc8 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX77693 MicroUSB and Companion Power Management IC Charger
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77693 MicroUSB Integ=
rated
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max14577.yam=
l b/Documentation/devicetree/bindings/regulator/maxim,max14577.yaml
index 16f01886a601..285dc7122977 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max14577.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max14577.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX14577/MAX77836 MicroUSB and Companion Power Management IC =
regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX14577/MAX77836 Micro=
USB
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77686.yam=
l b/Documentation/devicetree/bindings/regulator/maxim,max77686.yaml
index bb64b679f765..0e7cd4b3ace0 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77686.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77686.yaml
@@ -8,7 +8,7 @@ title: Maxim MAX77686 Power Management IC regulators
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77686 Power Manageme=
nt
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77693.yam=
l b/Documentation/devicetree/bindings/regulator/maxim,max77693.yaml
index 20d8559bdc2b..945a539749e8 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77693.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77693.yaml
@@ -8,7 +8,7 @@ title: Maxim MAX77693 MicroUSB and Companion Power Manageme=
nt IC regulators
 =

 maintainers:
   - Chanwoo Choi <cw00.choi@samsung.com>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77693 MicroUSB Integ=
rated
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77802.yam=
l b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
index f2b4dd15a0f3..236348c4710c 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
@@ -8,7 +8,7 @@ title: Maxim MAX77802 Power Management IC regulators
 =

 maintainers:
   - Javier Martinez Canillas <javier@dowhile0.org>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77802 Power Manageme=
nt
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77843.yam=
l b/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml
index a963025e96c1..9695e7242882 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77843.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX77843 MicroUSB and Companion Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for Maxim MAX77843 MicroUSB Integ=
rated
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8952.yaml=
 b/Documentation/devicetree/bindings/regulator/maxim,max8952.yaml
index e4e8c58f6046..3ff0d7d980e9 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8952.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8952.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX8952 voltage regulator
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 allOf:
   - $ref: regulator.yaml#
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8973.yaml=
 b/Documentation/devicetree/bindings/regulator/maxim,max8973.yaml
index 5898dcf10f06..b92eef68c19f 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8973.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8973.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX8973/MAX77621 voltage regulator
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 allOf:
   - $ref: regulator.yaml#
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml=
 b/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
index d5a44ca3df04..4321f061a7f6 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8997.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX8997 Power Management IC
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   The Maxim MAX8997 is a Power Management IC which includes voltage and cu=
rrent
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.ya=
ml b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
index 0627dec513da..0f9eb317ba9a 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPA01 Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.ya=
ml b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
index e3b780715f44..f1c50dcd0b04 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPS11 Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps13.ya=
ml b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
index 579d77aefc3f..53b105a4ead1 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPS13 Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.ya=
ml b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
index fdea290b3e94..01f9d4e236e9 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPS14 Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps15.ya=
ml b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
index b3a883c94628..9576c2df45a6 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPS15 Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.ya=
ml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
index 0ded6953e3b6..39b652c3c3c4 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S2MPU02 Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.ya=
ml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
index 3c1617b66861..172631ca3c25 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S5M8767 Power Management IC regulators
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   This is a part of device tree bindings for S2M and S5M family of Power
diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.=
yaml b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
index a50c34d5d199..765d9f9edd6e 100644
--- a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC True Random Number Generator
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - =C5=81ukasz Stelmach <l.stelmach@samsung.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml b/Do=
cumentation/devicetree/bindings/rng/timeriomem_rng.yaml
index 84bf518a5549..4754174e9849 100644
--- a/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
+++ b/Documentation/devicetree/bindings/rng/timeriomem_rng.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: TimerIO Random Number Generator
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml =
b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index a98ed66d092e..0cabb773c397 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -8,7 +8,7 @@ title: Samsung's Exynos USI (Universal Serial Interface) bi=
nding
 =

 maintainers:
   - Sam Protsenko <semen.protsenko@linaro.org>
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   USI IP-core provides selectable serial protocol (UART, SPI or High-Speed=
 I2C).
diff --git a/Documentation/devicetree/bindings/sound/samsung,arndale.yaml b=
/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
index cea2bf3544f0..9bc4585bb6e5 100644
--- a/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,arndale.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Insignal Arndale boards audio complex
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml =
b/Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml
index cb51af90435e..ac151d3c1d77 100644
--- a/Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,smdk5250.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung SMDK5250 audio complex with WM8994 codec
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/sound/samsung,snow.yaml b/Do=
cumentation/devicetree/bindings/sound/samsung,snow.yaml
index 0c3b3302b842..51a83d3c7274 100644
--- a/Documentation/devicetree/bindings/sound/samsung,snow.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Google Snow audio complex with MAX9809x codec
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml b/Doc=
umentation/devicetree/bindings/sound/samsung,tm2.yaml
index 74712d6f3ef4..491e08019c04 100644
--- a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos5433 TM2(E) audio complex with WM5110 codec
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 =

 properties:
diff --git a/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-p=
rops.yaml b/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-pr=
ops.yaml
index f0db3fb3d688..25b1b6c12d4d 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.ya=
ml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.ya=
ml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Peripheral-specific properties for Samsung S3C/S5P/Exynos SoC SPI c=
ontroller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description:
   See spi-peripheral-props.yaml for more info.
diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Docum=
entation/devicetree/bindings/spi/samsung,spi.yaml
index bf9a76d931d2..a50f24f9359d 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung S3C/S5P/Exynos SoC SPI controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description:
   All the SPI controller nodes should be represented in the aliases node u=
sing
diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-therm=
al.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.=
yaml
index 17129f75d962..1344df708e2d 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC Thermal Management Unit (TMU)
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 description: |
   For multi-instance tmu each instance should have an alias correctly numb=
ered
diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 22b91a27d776..6b9a3bcb3926 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC USB 3.0 DWC3 Controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml=
 b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
index fbf07d6e707a..340dff8d19c3 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung Exynos SoC USB 2.0 EHCI/OHCI Controller
 =

 maintainers:
-  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
 =

 properties:
   compatible:
-- =

2.32.0

--===============6450977330191609474==--

