Content-Type: multipart/mixed; boundary="===============7813031970752600607=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next v4 0/2] Add nci suit and virtual nci device driver
Date: Wed, 27 Jan 2021 22:08:27 +0900
Message-ID: <20210127130829.4026-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7813031970752600607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

1/2 is the Virtual NCI device driver.
2/2 is the NCI selftest suite

v4:
 1/2
 - flip the condition for the ioctl.
 - refactor some code.
 - remove the unused function after refactoring.
v3:
 1/2
 - change the Kconfig help comment.
 - remove the mutex init code.
 - remove the unnecessary mutex(nci_send_mutex).
 - remove the full_txbuff.
 - add the code to release skb at error case.
 - refactor some code.
v2:
 1/2
 - change the permission of the Virtual NCI device.
 - add the ioctl to find the nci device index.
 2/2
 - add the NCI selftest suite.

Bongsu Jeon (2):
  nfc: Add a virtual nci device driver
  selftests: Add nci suite

 MAINTAINERS                           |   8 +
 drivers/nfc/Kconfig                   |  11 +
 drivers/nfc/Makefile                  |   1 +
 drivers/nfc/virtual_ncidev.c          | 215 +++++++++
 tools/testing/selftests/Makefile      |   1 +
 tools/testing/selftests/nci/Makefile  |   6 +
 tools/testing/selftests/nci/config    |   3 +
 tools/testing/selftests/nci/nci_dev.c | 599 ++++++++++++++++++++++++++
 8 files changed, 844 insertions(+)
 create mode 100644 drivers/nfc/virtual_ncidev.c
 create mode 100644 tools/testing/selftests/nci/Makefile
 create mode 100644 tools/testing/selftests/nci/config
 create mode 100644 tools/testing/selftests/nci/nci_dev.c

-- =

2.25.1

--===============7813031970752600607==--

