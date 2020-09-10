Content-Type: multipart/mixed; boundary="===============1464676901017680881=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 7/8] MAINTAINERS: Add Krzysztof Kozlowski to Samsung S3FWRN5 and remove Robert
Date: Thu, 10 Sep 2020 18:12:18 +0200
Message-ID: <20200910161219.6237-8-krzk@kernel.org>
In-Reply-To: <20200910161219.6237-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1464676901017680881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Robert Ba=C5=82dyga's email does not work (bounces) since 2016 so remove it.
Additionally there are no review/ack/tested tags from Krzysztof Opasiak
so it looks like the driver is not supported.

As a maintainer of Samsung ARM/ARM64 SoC, I can take care about this
driver and provide some review.  However clearly driver is not in
supported mode as I do not work in Samsung anymore.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 32ee70a7562e..1df63cdf71df 100644
--- a/CREDITS
+++ b/CREDITS
@@ -191,6 +191,10 @@ N: Krishna Balasubramanian
 E: balasub(a)cis.ohio-state.edu
 D: Wrote SYS V IPC (part of standard kernel since 0.99.10)
 =

+B: Robert Baldyga
+E: r.baldyga(a)hackerion.com
+D: Samsung S3FWRN5 NCI NFC Controller
+
 N: Chris Ball
 E: chris(a)printf.net
 D: Former maintainer of the MMC/SD/SDIO subsystem.
diff --git a/MAINTAINERS b/MAINTAINERS
index ec4f1d9cb3dc..6888bd851caf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15269,10 +15269,10 @@ F:	drivers/media/platform/s3c-camif/
 F:	include/media/drv-intf/s3c_camif.h
 =

 SAMSUNG S3FWRN5 NFC DRIVER
-M:	Robert Baldyga <r.baldyga@samsung.com>
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Krzysztof Opasiak <k.opasiak@samsung.com>
 L:	linux-nfc(a)lists.01.org (moderated for non-subscribers)
-S:	Supported
+S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml
 F:	drivers/nfc/s3fwrn5
 =

-- =

2.17.1

--===============1464676901017680881==--

