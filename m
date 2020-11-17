Content-Type: multipart/mixed; boundary="===============2163998532722029575=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon@samsung.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next v2 0/3] nfc: s3fwrn5: Refactor the s3fwrn5 driver
Date: Tue, 17 Nov 2020 10:14:20 +0900
Message-ID: <20201117011420epcms2p28407a6596fdf1e63cb84af98fa768566@epcms2p2>
In-Reply-To: <CGME20201117011420epcms2p28407a6596fdf1e63cb84af98fa768566@epcms2p2>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2163998532722029575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Changes from v1:
- Remove the trailing dot from subject.
- Remove an empty line at beginning of commit message.
- Add a commit message.

Bongsu Jeon (3):
  nfc: s3fwrn5: Remove the max_payload
  nfc: s3fwrn5: Fix the misspelling in a comment
  nfc: s3fwrn5: Change the error code

 drivers/nfc/s3fwrn5/core.c     |  3 +--
 drivers/nfc/s3fwrn5/firmware.c |  2 +-
 drivers/nfc/s3fwrn5/i2c.c      |  4 +---
 drivers/nfc/s3fwrn5/s3fwrn5.h  | 11 +++++------
 4 files changed, 8 insertions(+), 12 deletions(-)

-- =

2.17.1

--===============2163998532722029575==--

