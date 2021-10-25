Content-Type: multipart/mixed; boundary="===============7089478520036682378=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH] nfc: port100: fix using -ERRNO as command type mask
Date: Mon, 25 Oct 2021 16:47:51 +0200
Message-ID: <20211025144751.555551-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7089478520036682378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

During probing, the driver tries to get a list (mask) of supported
command types in port100_get_command_type_mask() function.  The value
is u64 and 0 is treated as invalid mask (no commands supported).  The
function however returns also -ERRNO as u64 which will be interpret as
valid command mask.

Return 0 on every error case of port100_get_command_type_mask(), so the
probing will stop.

Cc: <stable@vger.kernel.org>
Fixes: 0347a6ab300a ("NFC: port100: Commands mechanism implementation")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/port100.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 1296148b4566..ec1630bfedf4 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1109,15 +1109,11 @@ static u64 port100_get_command_type_mask(struct por=
t100 *dev)
 =

 	skb =3D port100_alloc_skb(dev, 0);
 	if (!skb)
-		return -ENOMEM;
+		return 0;
 =

-	nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);
 	resp =3D port100_send_cmd_sync(dev, PORT100_CMD_GET_COMMAND_TYPE, skb);
-	if (IS_ERR(resp)) {
-		nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);
-		return PTR_ERR(resp);
-	}
-	nfc_err(&dev->interface->dev, "%s:%d\n", __func__, __LINE__);
+	if (IS_ERR(resp))
+		return 0;
 =

 	if (resp->len < 8)
 		mask =3D 0;
-- =

2.30.2

--===============7089478520036682378==--

