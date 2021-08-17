Content-Type: multipart/mixed; boundary="===============8625069388101641176=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 0/8] Update the virtual NCI device driver and add the NCI testcase
Date: Tue, 17 Aug 2021 06:28:10 -0700
Message-ID: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8625069388101641176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

This series updates the virtual NCI device driver and NCI selftest code
and add the NCI test case in selftests.

1/8 to use wait queue in virtual device driver.
2/8 to remove the polling code in selftests.
3/8 to fix a typo.
4/8 to fix the next nlattr offset calculation.
5/8 to fix the wrong condition in if statement.
6/8 to add a flag parameter to the Netlink send function.
7/8 to extract the start/stop discovery function.
8/8 to add the NCI testcase in selftests.

v2:
 1/8
 - change the commit message.
 - add the dfense code while reading a frame.
 3/8
 - change the commit message.
 - separate the commit into 3/8~8/8.

Bongsu Jeon (8):
  nfc: virtual_ncidev: Use wait queue instead of polling
  selftests: nci: Remove the polling code to read a NCI frame
  selftests: nci: Fix the typo
  selftests: nci: Fix the code for next nlattr offset
  selftests: nci: Fix the wrong condition
  selftests: nci: Add the flags parameter for the send_cmd_mt_nla
  selftests: nci: Extract the start/stop discovery function
  selftests: nci: Add the NCI testcase reading T4T Tag

 drivers/nfc/virtual_ncidev.c          |   9 +-
 tools/testing/selftests/nci/nci_dev.c | 416 ++++++++++++++++++++++----
 2 files changed, 362 insertions(+), 63 deletions(-)

-- =

2.32.0

--===============8625069388101641176==--

