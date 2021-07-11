Content-Type: multipart/mixed; boundary="===============1361242159504454261=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 29/34] netlink: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:46 +0200
Message-ID: <20210711202351.18363-17-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1361242159504454261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    src/netlink.c: In function =E2=80=98nfc_netlink_event_tm_deactivated=E2=
=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 4 has type =E2=80=98ui=
nt32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    src/netlink.c:759:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
      759 |  DBG("%d", idx);
          |  ^~~
    src/netlink.c: In function =E2=80=98nfc_netlink_event=E2=80=99:
    src/netlink.c:772:54: error: format =E2=80=98%d=E2=80=99 expects argume=
nt of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=80=98__u32=E2=
=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
      772 |   near_error("WARNING: Wrong netlink message sender %d",
          |                                                     ~^
          |                                                      |
          |                                                      int
          |                                                     %d
      773 |         src->nl_pid);
          |         ~~~~~~~~~~~
          |            |
          |            __u32 {aka unsigned int}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/netlink.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/src/netlink.c b/src/netlink.c
index 3c77999a05f2..a3b206aeaa88 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -567,7 +567,7 @@ static int get_targets_handler(struct nl_msg *n, void *=
arg)
 		iso15693_uid_len =3D 0;
 	}
 =

-	DBG("target idx %d proto 0x%x sens_res 0x%x sel_res 0x%x NFCID len %d",
+	DBG("target idx %u proto 0x%x sens_res 0x%x sel_res 0x%x NFCID len %d",
 	    target_idx, protocols, sens_res, sel_res, nfcid_len);
 	DBG("\tiso15693_uid_len %d", iso15693_uid_len);
 =

@@ -607,7 +607,7 @@ static int nfc_netlink_event_targets_found(struct genlm=
sghdr *gnlh)
 =

 	adapter_idx =3D nla_get_u32(attr[NFC_ATTR_DEVICE_INDEX]);
 =

-	DBG("adapter %d", adapter_idx);
+	DBG("adapter %u", adapter_idx);
 =

 	msg =3D nlmsg_alloc();
 	if (!msg)
@@ -653,7 +653,7 @@ static int nfc_netlink_event_target_lost(struct genlmsg=
hdr *gnlh)
 	adapter_idx =3D nla_get_u32(attr[NFC_ATTR_DEVICE_INDEX]);
 	target_idx =3D nla_get_u32(attr[NFC_ATTR_TARGET_INDEX]);
 =

-	DBG("adapter %d target %d", adapter_idx, target_idx);
+	DBG("adapter %u target %u", adapter_idx, target_idx);
 =

 	return __near_adapter_remove_target(adapter_idx, target_idx);
 }
@@ -690,7 +690,7 @@ static int nfc_netlink_event_dep_up(struct genlmsghdr *=
gnlh)
 =

 		target_idx =3D nla_get_u32(attrs[NFC_ATTR_TARGET_INDEX]);
 =

-		DBG("%d %d", idx, target_idx);
+		DBG("%u %u", idx, target_idx);
 =

 		return __near_adapter_set_dep_state(idx, true);
 	} else {
@@ -735,7 +735,7 @@ static int nfc_netlink_event_tm_activated(struct genlms=
ghdr *gnlh)
 =

 	idx =3D nla_get_u32(attrs[NFC_ATTR_DEVICE_INDEX]);
 =

-	DBG("%d", idx);
+	DBG("%u", idx);
 =

 	return __near_adapter_add_device(idx, NULL, 0);
 }
@@ -756,7 +756,7 @@ static int nfc_netlink_event_tm_deactivated(struct genl=
msghdr *gnlh)
 =

 	idx =3D nla_get_u32(attrs[NFC_ATTR_DEVICE_INDEX]);
 =

-	DBG("%d", idx);
+	DBG("%u", idx);
 =

 	return __near_adapter_remove_device(idx);
 }
@@ -769,8 +769,8 @@ static int nfc_netlink_event(struct nl_msg *n, void *ar=
g)
 	DBG("event 0x%x", gnlh->cmd);
 =

 	if (src->nl_pid) {
-		near_error("WARNING: Wrong netlink message sender %d",
-								src->nl_pid);
+		near_error("WARNING: Wrong netlink message sender %u",
+			   src->nl_pid);
 		return NL_SKIP;
 	}
 =

-- =

2.27.0

--===============1361242159504454261==--

