Content-Type: multipart/mixed; boundary="===============1151747925436262143=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon@samsung.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next 2/3] nfc: s3fwrn5: Fix the misspelling in a comment
Date: Mon, 16 Nov 2020 10:17:55 +0900
Message-ID: <20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571@epcms2p7>
In-Reply-To: <CGME20201116011755epcms2p7f7232e0865e8e1bc11a4b528c10d3571@epcms2p7>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1151747925436262143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

stucture should be replaced by structure.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index ec930ee2c847..4cde6dd5c019 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -266,7 +266,7 @@ static int s3fwrn5_fw_complete_update_mode(struct s3fwr=
n5_fw_info *fw_info)
 }
 =

 /*
- * Firmware header stucture:
+ * Firmware header structure:
  *
  * 0x00 - 0x0B : Date and time string (w/o NUL termination)
  * 0x10 - 0x13 : Firmware version
-- =

2.17.1

--===============1151747925436262143==--

