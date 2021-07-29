Content-Type: multipart/mixed; boundary="===============7846875080838347699=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 00/12] nfc: constify, continued (part 2)
Date: Thu, 29 Jul 2021 12:40:10 +0200
Message-ID: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7846875080838347699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On top of:
nfc: constify pointed data
https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowski(a)=
canonical.com/

Best regards,
Krzysztof


Krzysztof Kozlowski (12):
  nfc: constify passed nfc_dev
  nfc: mei_phy: constify buffer passed to mei_nfc_send()
  nfc: port100: constify several pointers
  nfc: trf7970a: constify several pointers
  nfc: virtual_ncidev: constify pointer to nfc_dev
  nfc: nfcsim: constify drvdata (struct nfcsim)
  nfc: fdp: drop unneeded cast for printing firmware size in dev_dbg()
  nfc: fdp: use unsigned int as loop iterator
  nfc: fdp: constify several pointers
  nfc: microread: constify several pointers
  nfc: mrvl: constify several pointers
  nfc: mrvl: constify static nfcmrvl_if_ops

 drivers/nfc/fdp/fdp.c             | 27 +++++++++++-----------
 drivers/nfc/fdp/fdp.h             |  2 +-
 drivers/nfc/fdp/i2c.c             |  6 ++---
 drivers/nfc/mei_phy.c             |  2 +-
 drivers/nfc/microread/i2c.c       |  2 +-
 drivers/nfc/microread/microread.c |  4 ++--
 drivers/nfc/microread/microread.h |  2 +-
 drivers/nfc/nfcmrvl/fw_dnld.c     | 16 +++++++------
 drivers/nfc/nfcmrvl/i2c.c         |  4 ++--
 drivers/nfc/nfcmrvl/main.c        |  4 ++--
 drivers/nfc/nfcmrvl/nfcmrvl.h     |  6 ++---
 drivers/nfc/nfcmrvl/spi.c         |  6 ++---
 drivers/nfc/nfcmrvl/uart.c        |  4 ++--
 drivers/nfc/nfcmrvl/usb.c         |  2 +-
 drivers/nfc/nfcsim.c              |  2 +-
 drivers/nfc/port100.c             | 37 +++++++++++++++++--------------
 drivers/nfc/trf7970a.c            | 17 +++++++-------
 drivers/nfc/virtual_ncidev.c      |  2 +-
 include/net/nfc/nfc.h             |  4 ++--
 19 files changed, 78 insertions(+), 71 deletions(-)

-- =

2.27.0

--===============7846875080838347699==--

