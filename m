Content-Type: multipart/mixed; boundary="===============0967374670502653692=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH] nfc: fix potential NULL pointer deref in nfc_genl_dump_ses_done
Date: Thu, 09 Dec 2021 09:13:07 +0100
Message-ID: <20211209081307.57337-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0967374670502653692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The done() netlink callback nfc_genl_dump_ses_done() should check if
received argument is non-NULL, because its allocation could fail earlier
in dumpit() (nfc_genl_dump_ses()).

Fixes: ac22ac466a65 ("NFC: Add a GET_SE netlink API")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/netlink.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 334f63c9529e..5c706ed75b33 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1392,8 +1392,10 @@ static int nfc_genl_dump_ses_done(struct netlink_cal=
lback *cb)
 {
 	struct class_dev_iter *iter =3D (struct class_dev_iter *) cb->args[0];
 =

-	nfc_device_iter_exit(iter);
-	kfree(iter);
+	if (iter) {
+		nfc_device_iter_exit(iter);
+		kfree(iter);
+	}
 =

 	return 0;
 }
-- =

2.32.0

--===============0967374670502653692==--

