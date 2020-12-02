Content-Type: multipart/mixed; boundary="===============2322693309924436839=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v5 net-next 0/4] nfc: s3fwrn5: Support a UART interface
Date: Wed, 02 Dec 2020 20:47:37 +0900
Message-ID: <1606909661-3814-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2322693309924436839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

S3FWRN82 is the Samsung's NFC chip that supports the UART communication.
Before adding the UART driver module, I did refactoring the s3fwrn5_i2c mod=
ule =

to reuse the common blocks.

1/4 is the dt bindings for the RN82 UART interface.
2/4..3/4 are refactoring the s3fwrn5_i2c module.
4/4 is the UART driver module implementation.

ChangeLog:
 v5:
   1/4
    - remove the 'items' of the compatible property.
    - change the GPIO flags.
 v4:
   1/4
    - change 'oneOf' to 'items'.
    - fix the indentation.
   2/4
    - add the ACK tag.
   4/4
    - remove the of_match_ptr macro.
 v3:
   3/4
    - move the phy_common object to s3fwrn.ko to avoid duplication.
    - include the header files to include everything which is used inside.
    - wrap the lines.
   4/4
    - remove the kfree(phy) because of duplicated free.
    - use the phy_common blocks.
    - wrap lines properly.
 v2:
   1/4
    - change the compatible name.
    - change the const to enum for compatible.
    - change the node name to nfc.
   3/4
    - remove the common function's definition in common header file.
    - make the common phy_common.c file to define the common function.
    - wrap the lines.
    - change the Header guard.
    - remove the unused common function.

Bongsu Jeon (4):
  dt-bindings: net: nfc: s3fwrn5: Support a UART interface
  nfc: s3fwrn5: reduce the EN_WAIT_TIME
  nfc: s3fwrn5: extract the common phy blocks
  nfc: s3fwrn5: Support a UART interface

 .../bindings/net/nfc/samsung,s3fwrn5.yaml          |  31 +++-
 drivers/nfc/s3fwrn5/Kconfig                        |  12 ++
 drivers/nfc/s3fwrn5/Makefile                       |   4 +-
 drivers/nfc/s3fwrn5/i2c.c                          | 117 ++++--------
 drivers/nfc/s3fwrn5/phy_common.c                   |  75 ++++++++
 drivers/nfc/s3fwrn5/phy_common.h                   |  37 ++++
 drivers/nfc/s3fwrn5/uart.c                         | 196 +++++++++++++++++=
++++
 7 files changed, 390 insertions(+), 82 deletions(-)
 create mode 100644 drivers/nfc/s3fwrn5/phy_common.c
 create mode 100644 drivers/nfc/s3fwrn5/phy_common.h
 create mode 100644 drivers/nfc/s3fwrn5/uart.c

-- =

1.9.1

--===============2322693309924436839==--

