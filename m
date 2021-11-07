Content-Type: multipart/mixed; boundary="===============4800295084234966471=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH] nfc: port100: lower verbosity of cancelled URB messages
Date: Sun, 07 Nov 2021 15:14:00 +0100
Message-ID: <20211107141400.523651-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4800295084234966471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It is not an error to receive an URB with -ENOENT because it can come
from regular user operations, e.g. pressing CTRL+C when running nfctool
from neard.  Make it a debugging message, not an error.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/port100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 16ceb763594f..d7db1a0e6be1 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -624,7 +624,7 @@ static void port100_recv_response(struct urb *urb)
 		break; /* success */
 	case -ECONNRESET:
 	case -ENOENT:
-		nfc_err(&dev->interface->dev,
+		nfc_dbg(&dev->interface->dev,
 			"The urb has been canceled (status %d)\n", urb->status);
 		goto sched_wq;
 	case -ESHUTDOWN:
@@ -678,7 +678,7 @@ static void port100_recv_ack(struct urb *urb)
 		break; /* success */
 	case -ECONNRESET:
 	case -ENOENT:
-		nfc_err(&dev->interface->dev,
+		nfc_dbg(&dev->interface->dev,
 			"The urb has been stopped (status %d)\n", urb->status);
 		goto sched_wq;
 	case -ESHUTDOWN:
@@ -942,7 +942,7 @@ static void port100_send_complete(struct urb *urb)
 		break; /* success */
 	case -ECONNRESET:
 	case -ENOENT:
-		nfc_err(&dev->interface->dev,
+		nfc_dbg(&dev->interface->dev,
 			"The urb has been stopped (status %d)\n", urb->status);
 		break;
 	case -ESHUTDOWN:
-- =

2.32.0

--===============4800295084234966471==--

