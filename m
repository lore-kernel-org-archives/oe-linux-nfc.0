Content-Type: multipart/mixed; boundary="===============1315137518951952228=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 02/11] nfc: mei_phy: drop ftrace-like debugging messages
Date: Fri, 28 May 2021 10:53:21 -0400
Message-ID: <20210528145330.125055-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1315137518951952228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that the kernel has ftrace, any debugging calls that just do "made
it to this function!" and "leaving this function!" can be removed.
Better to use standard debugging tools.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/mei_phy.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/nfc/mei_phy.c b/drivers/nfc/mei_phy.c
index 0f43bb389566..e56cea716cd2 100644
--- a/drivers/nfc/mei_phy.c
+++ b/drivers/nfc/mei_phy.c
@@ -98,8 +98,6 @@ static int mei_nfc_if_version(struct nfc_mei_phy *phy)
 	size_t if_version_length;
 	int bytes_recv, r;
 =

-	pr_info("%s\n", __func__);
-
 	memset(&cmd, 0, sizeof(struct mei_nfc_cmd));
 	cmd.hdr.cmd =3D MEI_NFC_CMD_MAINTENANCE;
 	cmd.hdr.data_size =3D 1;
@@ -146,8 +144,6 @@ static int mei_nfc_connect(struct nfc_mei_phy *phy)
 	size_t connect_length, connect_resp_length;
 	int bytes_recv, r;
 =

-	pr_info("%s\n", __func__);
-
 	connect_length =3D sizeof(struct mei_nfc_cmd) +
 			sizeof(struct mei_nfc_connect);
 =

@@ -320,8 +316,6 @@ static int nfc_mei_phy_enable(void *phy_id)
 	int r;
 	struct nfc_mei_phy *phy =3D phy_id;
 =

-	pr_info("%s\n", __func__);
-
 	if (phy->powered =3D=3D 1)
 		return 0;
 =

@@ -363,8 +357,6 @@ static void nfc_mei_phy_disable(void *phy_id)
 {
 	struct nfc_mei_phy *phy =3D phy_id;
 =

-	pr_info("%s\n", __func__);
-
 	mei_cldev_disable(phy->cldev);
 =

 	phy->powered =3D 0;
-- =

2.27.0

--===============1315137518951952228==--

