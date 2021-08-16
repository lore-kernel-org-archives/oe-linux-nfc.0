Content-Type: multipart/mixed; boundary="===============8736804181498597221=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH net-next 0/3] Update the virtual NCI driver and the NCI selftests
Date: Sun, 15 Aug 2021 21:05:57 -0700
Message-ID: <20210816040600.175813-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8736804181498597221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

This series updates the virtual NCI device driver and NCI selftest code
and add the NCI test case in selftests.
1/3 is the patch to use wait queue in virtual device driver.
2/3 is the patch to remove the polling code in selftests.
3/3 is the patch to add the NCI testcase in selftests.

Bongsu Jeon (3):
  nfc: Change the virtual NCI device driver to use Wait Queue
  selftests: Remove the polling code to read a NCI frame
  selftests: Add the NCI testcase reading T4T Tag

 drivers/nfc/virtual_ncidev.c          |  10 +-
 tools/testing/selftests/nci/nci_dev.c | 417 ++++++++++++++++++++++----
 2 files changed, 362 insertions(+), 65 deletions(-)

-- =

2.32.0

--===============8736804181498597221==--

