Content-Type: multipart/mixed; boundary="===============8302039388391629140=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH stable v4.4 - v4.14] NFC: add necessary privilege flags in netlink layer
Date: Mon, 15 Nov 2021 18:35:52 +0100
Message-ID: <20211115173553.521371-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211115173553.521371-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8302039388391629140==
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
[krzysztof: context changes and backport]
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---

Please apply for v4.4, v4.9 and v4.14.

 net/nfc/netlink.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/nfc/netlink.c b/net/nfc/netlink.c
index c90dc2fd13a7..20ea14791a9d 100644
--- a/net/nfc/netlink.c
+++ b/net/nfc/netlink.c
@@ -1639,31 +1639,37 @@ static const struct genl_ops nfc_genl_ops[] =3D {
 		.cmd =3D NFC_CMD_DEV_UP,
 		.doit =3D nfc_genl_dev_up,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DEV_DOWN,
 		.doit =3D nfc_genl_dev_down,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_START_POLL,
 		.doit =3D nfc_genl_start_poll,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_STOP_POLL,
 		.doit =3D nfc_genl_stop_poll,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DEP_LINK_UP,
 		.doit =3D nfc_genl_dep_link_up,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DEP_LINK_DOWN,
 		.doit =3D nfc_genl_dep_link_down,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_GET_TARGET,
@@ -1680,26 +1686,31 @@ static const struct genl_ops nfc_genl_ops[] =3D {
 		.cmd =3D NFC_CMD_LLC_SET_PARAMS,
 		.doit =3D nfc_genl_llc_set_params,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_LLC_SDREQ,
 		.doit =3D nfc_genl_llc_sdreq,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_FW_DOWNLOAD,
 		.doit =3D nfc_genl_fw_download,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_ENABLE_SE,
 		.doit =3D nfc_genl_enable_se,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_DISABLE_SE,
 		.doit =3D nfc_genl_disable_se,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_GET_SE,
@@ -1711,16 +1722,19 @@ static const struct genl_ops nfc_genl_ops[] =3D {
 		.cmd =3D NFC_CMD_SE_IO,
 		.doit =3D nfc_genl_se_io,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_ACTIVATE_TARGET,
 		.doit =3D nfc_genl_activate_target,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 	{
 		.cmd =3D NFC_CMD_VENDOR,
 		.doit =3D nfc_genl_vendor_cmd,
 		.policy =3D nfc_genl_policy,
+		.flags =3D GENL_ADMIN_PERM,
 	},
 };
 =

-- =

2.32.0

--===============8302039388391629140==--

