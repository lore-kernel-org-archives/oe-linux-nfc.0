Content-Type: multipart/mixed; boundary="===============5071819266737360371=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 00/15] nfc: minor printk cleanup
Date: Mon, 13 Sep 2021 15:20:20 +0200
Message-ID: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5071819266737360371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Changes since v1:
1. Remove unused variable in pn533 (reported by kbuild).

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  nfc: drop unneeded debug prints
  nfc: do not break pr_debug() call into separate lines
  nfc: nci: replace GPLv2 boilerplate with SPDX
  nfc: fdp: drop unneeded debug prints
  nfc: pn533: drop unneeded debug prints
  nfc: pn533: use dev_err() instead of pr_err()
  nfc: pn544: drop unneeded debug prints
  nfc: pn544: drop unneeded memory allocation fail messages
  nfc: s3fwrn5: simplify dereferencing pointer to struct device
  nfc: st-nci: drop unneeded debug prints
  nfc: st21nfca: drop unneeded debug prints
  nfc: trf7970a: drop unneeded debug prints
  nfc: microread: drop unneeded debug prints
  nfc: microread: drop unneeded memory allocation fail messages
  nfc: mrvl: drop unneeded memory allocation fail messages

 drivers/nfc/fdp/i2c.c          |  1 -
 drivers/nfc/microread/i2c.c    |  4 ----
 drivers/nfc/microread/mei.c    |  6 +-----
 drivers/nfc/nfcmrvl/fw_dnld.c  |  4 +---
 drivers/nfc/pn533/i2c.c        |  4 ----
 drivers/nfc/pn533/pn533.c      |  4 +---
 drivers/nfc/pn544/mei.c        |  8 +-------
 drivers/nfc/s3fwrn5/firmware.c | 29 +++++++++++-----------------
 drivers/nfc/s3fwrn5/nci.c      | 18 +++++++----------
 drivers/nfc/st-nci/i2c.c       |  4 ----
 drivers/nfc/st-nci/ndlc.c      |  4 ----
 drivers/nfc/st-nci/se.c        |  6 ------
 drivers/nfc/st-nci/spi.c       |  4 ----
 drivers/nfc/st21nfca/i2c.c     |  4 ----
 drivers/nfc/st21nfca/se.c      |  4 ----
 drivers/nfc/trf7970a.c         |  8 --------
 net/nfc/hci/command.c          | 16 ----------------
 net/nfc/hci/llc_shdlc.c        | 35 +++++++++-------------------------
 net/nfc/llcp_commands.c        |  8 --------
 net/nfc/llcp_core.c            |  5 +----
 net/nfc/nci/core.c             |  4 ----
 net/nfc/nci/hci.c              |  4 ----
 net/nfc/nci/ntf.c              |  9 ---------
 net/nfc/nci/uart.c             | 16 ++--------------
 24 files changed, 34 insertions(+), 175 deletions(-)

-- =

2.30.2

--===============5071819266737360371==--

