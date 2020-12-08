Content-Type: multipart/mixed; boundary="===============9132836554440240075=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 0/2] nfc: s3fwrn5: Change I2C interrupt trigger to EDGE_RISING
Date: Tue, 08 Dec 2020 23:10:10 +0900
Message-ID: <20201208141012.6033-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============9132836554440240075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

For stable Samsung's I2C interrupt handling, I changed the interrupt =

trigger from IRQ_TYPE_LEVEL_HIGH to IRQ_TYPE_EDGE_RISING and removed =

the hard coded interrupt trigger type in the i2c module for the flexible =

control.

1/2 is the changed dt binding for the edge rising trigger.
2/2 is to remove the hard coded interrupt trigger type in the i2c module.

ChangeLog:
 v2:
  2/2
   - remove the hard coded interrupt trigger type.

Bongsu Jeon (2):
  dt-bindings: net: nfc: s3fwrn5: Change I2C interrupt trigger to
    EDGE_RISING
  nfc: s3fwrn5: Remove hard coded interrupt trigger type from the i2c
    module

 .../devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml      | 2 +-
 drivers/nfc/s3fwrn5/i2c.c                                 | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- =

2.17.1

--===============9132836554440240075==--

