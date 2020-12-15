Content-Type: multipart/mixed; boundary="===============0670003425709224414=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 0/2] nfc: s3fwrn5: Refactor the s3fwrn5 module
Date: Tue, 15 Dec 2020 15:53:59 +0900
Message-ID: <20201215065401.3220-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0670003425709224414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Refactor the s3fwrn5 module.

1/2 is to remove the unneeded delay for NFC sleep.
2/2 is to remove the unused NCI prop commands.

ChangeLog:
 v2:
  - Update the commit messages.

Bongsu Jeon (2):
  nfc: s3fwrn5: Remove the delay for NFC sleep
  nfc: s3fwrn5: Remove unused NCI prop commands

 drivers/nfc/s3fwrn5/nci.c        | 25 -------------------------
 drivers/nfc/s3fwrn5/nci.h        | 22 ----------------------
 drivers/nfc/s3fwrn5/phy_common.c |  3 ++-
 3 files changed, 2 insertions(+), 48 deletions(-)

-- =

2.17.1

--===============0670003425709224414==--

