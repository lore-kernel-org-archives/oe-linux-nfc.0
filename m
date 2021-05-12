Content-Type: multipart/mixed; boundary="===============2983497332598568312=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 1/2] MAINTAINERS: nfc: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 May 2021 10:43:18 -0400
Message-ID: <20210512144319.30852-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2983497332598568312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The NFC subsystem is orphaned.  I am happy to spend some cycles to
review the patches, send pull requests and in general keep the NFC
subsystem running.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

I admit I don't have big experience in NFC part but this will be nice
opportunity to learn something new.  I am already maintainer of few
other parts: memory controller drivers, Samsung ARM/ARM64 SoC and some
drviers.  I have a kernel.org account and my GPG key is:
https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/tree/keys/1B93437D3B=
41629B.asc

Best regards,
Krzysztof
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc81667e8bab..adc6cbe29f78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12899,8 +12899,9 @@ F:	include/uapi/linux/nexthop.h
 F:	net/ipv4/nexthop.c
 =

 NFC SUBSYSTEM
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	netdev(a)vger.kernel.org
-S:	Orphan
+S:	Maintained
 F:	Documentation/devicetree/bindings/net/nfc/
 F:	drivers/nfc/
 F:	include/linux/platform_data/nfcmrvl.h
-- =

2.25.1

--===============2983497332598568312==--

