Content-Type: multipart/mixed; boundary="===============4106309521876020969=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: [PATCH 0/2] MAINTAINERS/dt-bindings: changes to my emails
Date: Wed, 30 Mar 2022 09:40:14 +0200
Message-ID: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4106309521876020969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

I can take both patches via my Samsung SoC tree, if that's ok.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: update Krzysztof Kozlowski's email
  MAINTAINERS: update Krzysztof Kozlowski's email to Linaro

 .../clock/samsung,exynos-audss-clock.yaml     |  2 +-
 .../bindings/clock/samsung,exynos-clock.yaml  |  2 +-
 .../clock/samsung,exynos-ext-clock.yaml       |  2 +-
 .../clock/samsung,exynos4412-isp-clock.yaml   |  2 +-
 .../clock/samsung,exynos5260-clock.yaml       |  2 +-
 .../clock/samsung,exynos5410-clock.yaml       |  2 +-
 .../clock/samsung,exynos5433-clock.yaml       |  2 +-
 .../bindings/clock/samsung,exynos7-clock.yaml |  2 +-
 .../clock/samsung,exynos7885-clock.yaml       |  2 +-
 .../clock/samsung,exynos850-clock.yaml        |  2 +-
 .../bindings/clock/samsung,s2mps11.yaml       |  2 +-
 .../clock/samsung,s5pv210-audss-clock.yaml    |  2 +-
 .../bindings/clock/samsung,s5pv210-clock.yaml |  2 +-
 .../devfreq/event/samsung,exynos-nocp.yaml    |  2 +-
 .../devfreq/event/samsung,exynos-ppmu.yaml    |  2 +-
 .../samsung/samsung,exynos-hdmi-ddc.yaml      |  2 +-
 .../display/samsung/samsung,exynos-hdmi.yaml  |  2 +-
 .../display/samsung/samsung,exynos-mixer.yaml |  2 +-
 .../samsung/samsung,exynos5433-decon.yaml     |  2 +-
 .../samsung/samsung,exynos5433-mic.yaml       |  2 +-
 .../samsung/samsung,exynos7-decon.yaml        |  2 +-
 .../display/samsung/samsung,fimd.yaml         |  2 +-
 .../bindings/extcon/maxim,max77843.yaml       |  2 +-
 .../bindings/hwmon/lltc,ltc4151.yaml          |  2 +-
 .../bindings/hwmon/microchip,mcp3021.yaml     |  2 +-
 .../bindings/hwmon/sensirion,sht15.yaml       |  2 +-
 .../devicetree/bindings/hwmon/ti,tmp102.yaml  |  2 +-
 .../devicetree/bindings/hwmon/ti,tmp108.yaml  |  2 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |  2 +-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     |  2 +-
 .../samsung,exynos4210-combiner.yaml          |  2 +-
 .../bindings/leds/maxim,max77693.yaml         |  2 +-
 .../memory-controllers/brcm,dpfe-cpu.yaml     |  2 +-
 .../ddr/jedec,lpddr2-timings.yaml             |  2 +-
 .../memory-controllers/ddr/jedec,lpddr2.yaml  |  2 +-
 .../ddr/jedec,lpddr3-timings.yaml             |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml  |  2 +-
 .../marvell,mvebu-sdram-controller.yaml       |  2 +-
 .../qca,ath79-ddr-controller.yaml             |  2 +-
 .../memory-controllers/renesas,h8300-bsc.yaml |  2 +-
 .../samsung,exynos5422-dmc.yaml               |  2 +-
 .../memory-controllers/synopsys,ddrc-ecc.yaml |  2 +-
 .../memory-controllers/ti,da8xx-ddrctl.yaml   |  2 +-
 .../bindings/mfd/maxim,max14577.yaml          |  2 +-
 .../bindings/mfd/maxim,max77686.yaml          |  2 +-
 .../bindings/mfd/maxim,max77693.yaml          |  2 +-
 .../bindings/mfd/maxim,max77802.yaml          |  2 +-
 .../bindings/mfd/maxim,max77843.yaml          |  2 +-
 .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
 .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
 .../bindings/mfd/samsung,s2mps11.yaml         |  2 +-
 .../bindings/mfd/samsung,s5m8767.yaml         |  2 +-
 .../bindings/net/nfc/marvell,nci.yaml         |  2 +-
 .../devicetree/bindings/net/nfc/nxp,nci.yaml  |  2 +-
 .../bindings/net/nfc/nxp,pn532.yaml           |  2 +-
 .../bindings/net/nfc/nxp,pn544.yaml           |  2 +-
 .../bindings/net/nfc/st,st-nci.yaml           |  2 +-
 .../bindings/net/nfc/st,st21nfca.yaml         |  2 +-
 .../bindings/net/nfc/st,st95hf.yaml           |  2 +-
 .../bindings/net/nfc/ti,trf7970a.yaml         |  2 +-
 .../bindings/phy/samsung,dp-video-phy.yaml    |  2 +-
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml |  2 +-
 .../phy/samsung,exynos5250-sata-phy.yaml      |  2 +-
 .../bindings/phy/samsung,mipi-video-phy.yaml  |  2 +-
 .../bindings/phy/samsung,usb2-phy.yaml        |  2 +-
 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +-
 .../pinctrl/samsung,pinctrl-gpio-bank.yaml    |  2 +-
 .../pinctrl/samsung,pinctrl-pins-cfg.yaml     |  2 +-
 .../samsung,pinctrl-wakeup-interrupt.yaml     |  2 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  2 +-
 .../bindings/power/supply/maxim,max14577.yaml |  2 +-
 .../bindings/power/supply/maxim,max77693.yaml |  2 +-
 .../bindings/regulator/maxim,max14577.yaml    |  2 +-
 .../bindings/regulator/maxim,max77686.yaml    |  2 +-
 .../bindings/regulator/maxim,max77693.yaml    |  2 +-
 .../bindings/regulator/maxim,max77802.yaml    |  2 +-
 .../bindings/regulator/maxim,max77843.yaml    |  2 +-
 .../bindings/regulator/maxim,max8952.yaml     |  2 +-
 .../bindings/regulator/maxim,max8973.yaml     |  2 +-
 .../bindings/regulator/maxim,max8997.yaml     |  2 +-
 .../bindings/regulator/samsung,s2mpa01.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps11.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps13.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps14.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps15.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mpu02.yaml   |  2 +-
 .../bindings/regulator/samsung,s5m8767.yaml   |  2 +-
 .../bindings/rng/samsung,exynos5250-trng.yaml |  2 +-
 .../bindings/rng/timeriomem_rng.yaml          |  2 +-
 .../bindings/soc/samsung/exynos-usi.yaml      |  2 +-
 .../bindings/sound/samsung,arndale.yaml       |  2 +-
 .../bindings/sound/samsung,smdk5250.yaml      |  2 +-
 .../bindings/sound/samsung,snow.yaml          |  2 +-
 .../bindings/sound/samsung,tm2.yaml           |  2 +-
 .../spi/samsung,spi-peripheral-props.yaml     |  2 +-
 .../devicetree/bindings/spi/samsung,spi.yaml  |  2 +-
 .../thermal/samsung,exynos-thermal.yaml       |  2 +-
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  2 +-
 .../bindings/usb/samsung,exynos-usb2.yaml     |  2 +-
 MAINTAINERS                                   | 36 +++++++++----------
 100 files changed, 117 insertions(+), 117 deletions(-)

-- =

2.32.0

--===============4106309521876020969==--

