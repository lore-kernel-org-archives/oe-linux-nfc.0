Content-Type: multipart/mixed; boundary="===============1025615465400463268=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH stable v5.4+] NFC: add necessary privilege flags in netlink layer
Date: Mon, 15 Nov 2021 18:35:51 +0100
Message-ID: <20211115173553.521371-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1025615465400463268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Lin Ma <linma@zju.edu.cn>

commit aedddb4e45b34426cfbfa84454b6f203712733c5 upstream.

The CAP_NET_ADMIN checks are needed to prevent attackers faking a
device under NCIUARTSETDRIVER and exploit privileged commands.

This patch add GENL_ADMIN_PERM flags in genl_ops to fulfill the check.
Except for commands like NFC_CMD_GET_DEVICE, NFC_CMD_GET_TARGET,
NFC_CMD_LLC_GET_PARAMS, and NFC_CMD_GET_SE, which are mainly information-
read operations.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/netlink.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index 99b06a16b808..f8bfe068108e 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1672,31 +1672,37 @@ static const struct genl_ops nfc_genl_ops[] =3D {
 		.cmd =3D NFC_CMD_DEV_UP,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_dev_up,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DEV_DOWN,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_dev_down,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_START_POLL,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_start_poll,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_STOP_POLL,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_stop_poll,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DEP_LINK_UP,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_dep_link_up,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DEP_LINK_DOWN,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_dep_link_down,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_GET_TARGET,
@@ -1713,26 +1719,31 @@ static const struct genl_ops nfc_genl_ops[] =3D {
 		.cmd =3D NFC_CMD_LLC_SET_PARAMS,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_llc_set_params,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_LLC_SDREQ,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_llc_sdreq,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_FW_DOWNLOAD,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_fw_download,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_ENABLE_SE,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_enable_se,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DISABLE_SE,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_disable_se,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_GET_SE,
@@ -1744,21 +1755,25 @@ static const struct genl_ops nfc_genl_ops[] =3D {
 		.cmd =3D NFC_CMD_SE_IO,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_se_io,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_ACTIVATE_TARGET,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_activate_target,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_VENDOR,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_vendor_cmd,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DEACTIVATE_TARGET,
 		.validate =3D GENL_DONT_VALIDATE_STRICT | GENL_DONT_VALIDATE_DUMP,
 		.doit =3D nfc_genl_deactivate_target,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 };
 =

-- =

2.32.0

--===============1025615465400463268==--

