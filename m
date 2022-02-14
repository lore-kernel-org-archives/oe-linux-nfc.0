Content-Type: multipart/mixed; boundary="===============7533094855696385057=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH] Revert "include: Add a copy of the NFC kernel header"
Date: Mon, 14 Feb 2022 13:31:08 +0100
Message-ID: <20220214123110.27056-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7533094855696385057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This reverts commit fb7664e2995f2b5bed4b93c7c82aab14c2485eb8 and changes
several other files to match the scope of revert (using back system
header, instead of local copy).

The reverted commit argued it is better to miss header updates than not
being able to run the neard daemon at all.  It's not correct.  The
/usr/include/linux/nfc.h header does not affect the runnability of
daemon but the build stage.  The daemon, once compiled, will be able to
run even if nfc.h system header changes.

However in case of any important differences in nfc.h, it is better to
fail early during build time, than later during runtime because of
differences of ABI (structures or functions) between kernel and
user-space.

Rely back on system/kernel header, to avoid manual synchronisation.
This will also force us to keep the neard updated if kernel header
changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Makefile.am                 |   2 +-
 include/nfc_copy.h          | 317 ------------------------------------
 plugins/handover.c          |   2 +-
 plugins/llcp-validation.c   |   3 +-
 plugins/mifare.c            |   2 +-
 plugins/nfctype1.c          |   2 +-
 plugins/nfctype2.c          |   2 +-
 plugins/nfctype3.c          |   2 +-
 plugins/nfctype4.c          |   2 +-
 plugins/nfctype5.c          |   2 +-
 plugins/npp.c               |   2 +-
 plugins/p2p.c               |   2 +-
 plugins/phdc.c              |   2 +-
 plugins/snep-validation.c   |   2 +-
 plugins/snep.c              |   2 +-
 se/plugins/nfc.c            |   2 +-
 src/near.h                  |   2 +-
 src/snep.c                  |   2 +-
 tools/nfctool/adapter.c     |   3 +-
 tools/nfctool/llcp-decode.c |   3 +-
 tools/nfctool/main.c        |   3 +-
 tools/nfctool/netlink.c     |   3 +-
 tools/nfctool/snep-decode.c |   3 +-
 tools/nfctool/sniffer.c     |   3 +-
 tools/snep-send.c           |   2 +-
 25 files changed, 24 insertions(+), 348 deletions(-)
 delete mode 100644 include/nfc_copy.h

diff --git a/Makefile.am b/Makefile.am
index 26aa4ca82e80..4cb5e06faee6 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -8,7 +8,7 @@ pkgincludedir =3D ${includedir}/near
 pkginclude_HEADERS =3D include/types.h include/log.h include/plugin.h \
 			include/tag.h include/adapter.h include/ndef.h \
 			include/tlv.h include/setting.h include/device.h \
-			include/nfc_copy.h include/snep.h
+			include/snep.h
 =

 nodist_include_HEADERS =3D include/version.h
 =

diff --git a/include/nfc_copy.h b/include/nfc_copy.h
deleted file mode 100644
index f6e3c8c9c744..000000000000
--- a/include/nfc_copy.h
+++ /dev/null
@@ -1,317 +0,0 @@
-/*
- * Copyright (C) 2011 Instituto Nokia de Tecnologia
- *
- * Authors:
- *    Lauro Ramos Venancio <lauro.venancio@openbossa.org>
- *    Aloisio Almeida Jr <aloisio.almeida@openbossa.org>
- *
- * Permission to use, copy, modify, and/or distribute this software for any
- * purpose with or without fee is hereby granted, provided that the above
- * copyright notice and this permission notice appear in all copies.
- *
- * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
- * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
- * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
- * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
- * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
- * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
- */
-
-#ifndef __LINUX_NFC_H
-#define __LINUX_NFC_H
-
-#include <linux/types.h>
-#include <linux/socket.h>
-
-#define NFC_GENL_NAME "nfc"
-#define NFC_GENL_VERSION 1
-
-#define NFC_GENL_MCAST_EVENT_NAME "events"
-
-/**
- * enum nfc_commands - supported nfc commands
- *
- * @NFC_CMD_UNSPEC: unspecified command
- *
- * @NFC_CMD_GET_DEVICE: request information about a device (requires
- *	%NFC_ATTR_DEVICE_INDEX) or dump request to get a list of all nfc devices
- * @NFC_CMD_DEV_UP: turn on the nfc device
- *	(requires %NFC_ATTR_DEVICE_INDEX)
- * @NFC_CMD_DEV_DOWN: turn off the nfc device
- *	(requires %NFC_ATTR_DEVICE_INDEX)
- * @NFC_CMD_START_POLL: start polling for targets using the given protocols
- *	(requires %NFC_ATTR_DEVICE_INDEX and %NFC_ATTR_PROTOCOLS)
- * @NFC_CMD_STOP_POLL: stop polling for targets (requires
- *	%NFC_ATTR_DEVICE_INDEX)
- * @NFC_CMD_GET_TARGET: dump all targets found by the previous poll (requi=
res
- *	%NFC_ATTR_DEVICE_INDEX)
- * @NFC_EVENT_TARGETS_FOUND: event emitted when a new target is found
- *	(it sends %NFC_ATTR_DEVICE_INDEX)
- * @NFC_EVENT_DEVICE_ADDED: event emitted when a new device is registred
- *	(it sends %NFC_ATTR_DEVICE_NAME, %NFC_ATTR_DEVICE_INDEX and
- *	%NFC_ATTR_PROTOCOLS)
- * @NFC_EVENT_DEVICE_REMOVED: event emitted when a device is removed
- *	(it sends %NFC_ATTR_DEVICE_INDEX)
- * @NFC_EVENT_TM_ACTIVATED: event emitted when the adapter is activated in
- *      target mode.
- * @NFC_EVENT_DEVICE_DEACTIVATED: event emitted when the adapter is deacti=
vated
- *      from target mode.
- * @NFC_CMD_LLC_GET_PARAMS: request LTO, RW, and MIUX parameters for a dev=
ice
- * @NFC_CMD_LLC_SET_PARAMS: set one or more of LTO, RW, and MIUX parameter=
s for
- *	a device. LTO must be set before the link is up otherwise -EINPROGRESS
- *	is returned. RW and MIUX can be set at anytime and will be passed in
- *	subsequent CONNECT and CC messages.
- *	If one of the passed parameters is wrong none is set and -EINVAL is
- *	returned.
- * @NFC_CMD_ENABLE_SE: Enable the physical link to a specific secure eleme=
nt.
- *	Once enabled a secure element will handle card emulation mode, i.e.
- *	starting a poll from a device which has a secure element enabled means
- *	we want to do SE based card emulation.
- * @NFC_CMD_DISABLE_SE: Disable the physical link to a specific secure ele=
ment.
- * @NFC_CMD_FW_DOWNLOAD: Request to Load/flash firmware, or event to inform
- *	that some firmware was loaded
- * @NFC_EVENT_SE_ADDED: Event emitted when a new secure element is discove=
red.
- *	This typically will be sent whenever a new NFC controller with either
- *	an embedded SE or an UICC one connected to it through SWP.
- * @NFC_EVENT_SE_REMOVED: Event emitted when a secure element is removed f=
rom
- *	the system, as a consequence of e.g. an NFC controller being unplugged.
- * @NFC_EVENT_SE_CONNECTIVITY: This event is emitted whenever a secure ele=
ment
- *	is requesting connectivity access. For example a UICC SE may need to
- *	talk with a sleeping modem and will notify this need by sending this
- *	event. It is then up to userspace to decide if it will wake the modem
- *	up or not.
- * @NFC_EVENT_SE_TRANSACTION: This event is sent when an application runni=
ng on
- *	a specific SE notifies us about the end of a transaction. The parameter
- *	for this event is the application ID (AID).
- * @NFC_CMD_GET_SE: Dump all discovered secure elements from an NFC contro=
ller.
- * @NFC_CMD_SE_IO: Send/Receive APDUs to/from the selected secure element.
- * @NFC_CMD_ACTIVATE_TARGET: Request NFC controller to reactivate target.
- * @NFC_CMD_VENDOR: Vendor specific command, to be implemented directly
- *	from the driver in order to support hardware specific operations.
- * @NFC_CMD_DEACTIVATE_TARGET: Request NFC controller to deactivate target.
- */
-enum nfc_commands {
-	NFC_CMD_UNSPEC,
-	NFC_CMD_GET_DEVICE,
-	NFC_CMD_DEV_UP,
-	NFC_CMD_DEV_DOWN,
-	NFC_CMD_DEP_LINK_UP,
-	NFC_CMD_DEP_LINK_DOWN,
-	NFC_CMD_START_POLL,
-	NFC_CMD_STOP_POLL,
-	NFC_CMD_GET_TARGET,
-	NFC_EVENT_TARGETS_FOUND,
-	NFC_EVENT_DEVICE_ADDED,
-	NFC_EVENT_DEVICE_REMOVED,
-	NFC_EVENT_TARGET_LOST,
-	NFC_EVENT_TM_ACTIVATED,
-	NFC_EVENT_TM_DEACTIVATED,
-	NFC_CMD_LLC_GET_PARAMS,
-	NFC_CMD_LLC_SET_PARAMS,
-	NFC_CMD_ENABLE_SE,
-	NFC_CMD_DISABLE_SE,
-	NFC_CMD_LLC_SDREQ,
-	NFC_EVENT_LLC_SDRES,
-	NFC_CMD_FW_DOWNLOAD,
-	NFC_EVENT_SE_ADDED,
-	NFC_EVENT_SE_REMOVED,
-	NFC_EVENT_SE_CONNECTIVITY,
-	NFC_EVENT_SE_TRANSACTION,
-	NFC_CMD_GET_SE,
-	NFC_CMD_SE_IO,
-	NFC_CMD_ACTIVATE_TARGET,
-	NFC_CMD_VENDOR,
-	NFC_CMD_DEACTIVATE_TARGET,
-/* private: internal use only */
-	__NFC_CMD_AFTER_LAST
-};
-#define NFC_CMD_MAX (__NFC_CMD_AFTER_LAST - 1)
-
-/**
- * enum nfc_attrs - supported nfc attributes
- *
- * @NFC_ATTR_UNSPEC: unspecified attribute
- *
- * @NFC_ATTR_DEVICE_INDEX: index of nfc device
- * @NFC_ATTR_DEVICE_NAME: device name, max 8 chars
- * @NFC_ATTR_PROTOCOLS: nfc protocols - bitwise or-ed combination from
- *	NFC_PROTO_*_MASK constants
- * @NFC_ATTR_TARGET_INDEX: index of the nfc target
- * @NFC_ATTR_TARGET_SENS_RES: NFC-A targets extra information such as NFCID
- * @NFC_ATTR_TARGET_SEL_RES: NFC-A targets extra information (useful if the
- *	target is not NFC-Forum compliant)
- * @NFC_ATTR_TARGET_NFCID1: NFC-A targets identifier, max 10 bytes
- * @NFC_ATTR_TARGET_SENSB_RES: NFC-B targets extra information, max 12 byt=
es
- * @NFC_ATTR_TARGET_SENSF_RES: NFC-F targets extra information, max 18 byt=
es
- * @NFC_ATTR_COMM_MODE: Passive or active mode
- * @NFC_ATTR_RF_MODE: Initiator or target
- * @NFC_ATTR_IM_PROTOCOLS: Initiator mode protocols to poll for
- * @NFC_ATTR_TM_PROTOCOLS: Target mode protocols to listen for
- * @NFC_ATTR_LLC_PARAM_LTO: Link TimeOut parameter
- * @NFC_ATTR_LLC_PARAM_RW: Receive Window size parameter
- * @NFC_ATTR_LLC_PARAM_MIUX: MIU eXtension parameter
- * @NFC_ATTR_SE: Available Secure Elements
- * @NFC_ATTR_FIRMWARE_NAME: Free format firmware version
- * @NFC_ATTR_SE_INDEX: Secure element index
- * @NFC_ATTR_SE_TYPE: Secure element type (UICC or EMBEDDED)
- * @NFC_ATTR_FIRMWARE_DOWNLOAD_STATUS: Firmware download operation status
- * @NFC_ATTR_APDU: Secure element APDU
- * @NFC_ATTR_TARGET_ISO15693_DSFID: ISO 15693 Data Storage Format Identifi=
er
- * @NFC_ATTR_TARGET_ISO15693_UID: ISO 15693 Unique Identifier
- * @NFC_ATTR_SE_PARAMS: Parameters data from an evt_transaction
- * @NFC_ATTR_VENDOR_ID: NFC manufacturer unique ID, typically an OUI
- * @NFC_ATTR_VENDOR_SUBCMD: Vendor specific sub command
- * @NFC_ATTR_VENDOR_DATA: Vendor specific data, to be optionally passed
- *	to a vendor specific command implementation
- */
-enum nfc_attrs {
-	NFC_ATTR_UNSPEC,
-	NFC_ATTR_DEVICE_INDEX,
-	NFC_ATTR_DEVICE_NAME,
-	NFC_ATTR_PROTOCOLS,
-	NFC_ATTR_TARGET_INDEX,
-	NFC_ATTR_TARGET_SENS_RES,
-	NFC_ATTR_TARGET_SEL_RES,
-	NFC_ATTR_TARGET_NFCID1,
-	NFC_ATTR_TARGET_SENSB_RES,
-	NFC_ATTR_TARGET_SENSF_RES,
-	NFC_ATTR_COMM_MODE,
-	NFC_ATTR_RF_MODE,
-	NFC_ATTR_DEVICE_POWERED,
-	NFC_ATTR_IM_PROTOCOLS,
-	NFC_ATTR_TM_PROTOCOLS,
-	NFC_ATTR_LLC_PARAM_LTO,
-	NFC_ATTR_LLC_PARAM_RW,
-	NFC_ATTR_LLC_PARAM_MIUX,
-	NFC_ATTR_SE,
-	NFC_ATTR_LLC_SDP,
-	NFC_ATTR_FIRMWARE_NAME,
-	NFC_ATTR_SE_INDEX,
-	NFC_ATTR_SE_TYPE,
-	NFC_ATTR_SE_AID,
-	NFC_ATTR_FIRMWARE_DOWNLOAD_STATUS,
-	NFC_ATTR_SE_APDU,
-	NFC_ATTR_TARGET_ISO15693_DSFID,
-	NFC_ATTR_TARGET_ISO15693_UID,
-	NFC_ATTR_SE_PARAMS,
-	NFC_ATTR_VENDOR_ID,
-	NFC_ATTR_VENDOR_SUBCMD,
-	NFC_ATTR_VENDOR_DATA,
-/* private: internal use only */
-	__NFC_ATTR_AFTER_LAST
-};
-#define NFC_ATTR_MAX (__NFC_ATTR_AFTER_LAST - 1)
-
-enum nfc_sdp_attr {
-	NFC_SDP_ATTR_UNSPEC,
-	NFC_SDP_ATTR_URI,
-	NFC_SDP_ATTR_SAP,
-/* private: internal use only */
-	__NFC_SDP_ATTR_AFTER_LAST
-};
-#define NFC_SDP_ATTR_MAX (__NFC_SDP_ATTR_AFTER_LAST - 1)
-
-#define NFC_DEVICE_NAME_MAXSIZE		8
-#define NFC_NFCID1_MAXSIZE		10
-#define NFC_NFCID2_MAXSIZE		8
-#define NFC_NFCID3_MAXSIZE		10
-#define NFC_SENSB_RES_MAXSIZE		12
-#define NFC_SENSF_RES_MAXSIZE		18
-#define NFC_ATR_REQ_MAXSIZE		64
-#define NFC_ATR_RES_MAXSIZE		64
-#define NFC_ATR_REQ_GB_MAXSIZE		48
-#define NFC_ATR_RES_GB_MAXSIZE		47
-#define NFC_GB_MAXSIZE			48
-#define NFC_FIRMWARE_NAME_MAXSIZE	32
-#define NFC_ISO15693_UID_MAXSIZE	8
-
-/* NFC protocols */
-#define NFC_PROTO_JEWEL		1
-#define NFC_PROTO_MIFARE	2
-#define NFC_PROTO_FELICA	3
-#define NFC_PROTO_ISO14443	4
-#define NFC_PROTO_NFC_DEP	5
-#define NFC_PROTO_ISO14443_B	6
-#define NFC_PROTO_ISO15693	7
-
-#define NFC_PROTO_MAX		8
-
-/* NFC communication modes */
-#define NFC_COMM_ACTIVE  0
-#define NFC_COMM_PASSIVE 1
-
-/* NFC RF modes */
-#define NFC_RF_INITIATOR 0
-#define NFC_RF_TARGET    1
-#define NFC_RF_NONE      2
-
-/* NFC protocols masks used in bitsets */
-#define NFC_PROTO_JEWEL_MASK      (1 << NFC_PROTO_JEWEL)
-#define NFC_PROTO_MIFARE_MASK     (1 << NFC_PROTO_MIFARE)
-#define NFC_PROTO_FELICA_MASK	  (1 << NFC_PROTO_FELICA)
-#define NFC_PROTO_ISO14443_MASK	  (1 << NFC_PROTO_ISO14443)
-#define NFC_PROTO_NFC_DEP_MASK	  (1 << NFC_PROTO_NFC_DEP)
-#define NFC_PROTO_ISO14443_B_MASK (1 << NFC_PROTO_ISO14443_B)
-#define NFC_PROTO_ISO15693_MASK	  (1 << NFC_PROTO_ISO15693)
-
-/* NFC Secure Elements */
-#define NFC_SE_UICC     0x1
-#define NFC_SE_EMBEDDED 0x2
-
-#define NFC_SE_DISABLED 0x0
-#define NFC_SE_ENABLED  0x1
-
-struct sockaddr_nfc {
-	sa_family_t sa_family;
-	__u32 dev_idx;
-	__u32 target_idx;
-	__u32 nfc_protocol;
-};
-
-#define NFC_LLCP_MAX_SERVICE_NAME 63
-struct sockaddr_nfc_llcp {
-	sa_family_t sa_family;
-	__u32 dev_idx;
-	__u32 target_idx;
-	__u32 nfc_protocol;
-	__u8 dsap; /* Destination SAP, if known */
-	__u8 ssap; /* Source SAP to be bound to */
-	char service_name[NFC_LLCP_MAX_SERVICE_NAME]; /* Service name URI */;
-	size_t service_name_len;
-};
-
-/* NFC socket protocols */
-#define NFC_SOCKPROTO_RAW	0
-#define NFC_SOCKPROTO_LLCP	1
-#define NFC_SOCKPROTO_MAX	2
-
-#define NFC_HEADER_SIZE 1
-
-/**
- * Pseudo-header info for raw socket packets
- * First byte is the adapter index
- * Second byte contains flags
- *  - 0x01 - Direction (0=3DRX, 1=3DTX)
- *  - 0x02-0x04 - Payload type (000=3DLLCP, 001=3DNCI, 010=3DHCI, 011=3DDi=
gital,
- *                              100=3DProprietary)
- *  - 0x05-0x80 - Reserved
- **/
-#define NFC_RAW_HEADER_SIZE	2
-#define NFC_DIRECTION_RX		0x00
-#define NFC_DIRECTION_TX		0x01
-
-#define RAW_PAYLOAD_LLCP 0
-#define RAW_PAYLOAD_NCI	1
-#define RAW_PAYLOAD_HCI	2
-#define RAW_PAYLOAD_DIGITAL	3
-#define RAW_PAYLOAD_PROPRIETARY	4
-
-/* socket option names */
-#define NFC_LLCP_RW		0
-#define NFC_LLCP_MIUX		1
-#define NFC_LLCP_REMOTE_MIU	2
-#define NFC_LLCP_REMOTE_LTO	3
-#define NFC_LLCP_REMOTE_RW	4
-
-#endif /*__LINUX_NFC_H */
diff --git a/plugins/handover.c b/plugins/handover.c
index 5e46087ae532..7e0668daf07e 100644
--- a/plugins/handover.c
+++ b/plugins/handover.c
@@ -30,8 +30,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/types.h>
 #include <near/log.h>
 #include <near/adapter.h>
diff --git a/plugins/llcp-validation.c b/plugins/llcp-validation.c
index 853e2abf5788..811b43fac85c 100644
--- a/plugins/llcp-validation.c
+++ b/plugins/llcp-validation.c
@@ -28,8 +28,7 @@
 #include <stdbool.h>
 #include <string.h>
 #include <sys/socket.h>
-
-#include <near/nfc_copy.h>
+#include <linux/nfc.h>
 =

 #include <near/plugin.h>
 #include <near/log.h>
diff --git a/plugins/mifare.c b/plugins/mifare.c
index f42007d5dfd7..cb20d7f115ec 100644
--- a/plugins/mifare.c
+++ b/plugins/mifare.c
@@ -30,8 +30,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/nfctype1.c b/plugins/nfctype1.c
index 7173c8ffa9c9..77c70c0397aa 100644
--- a/plugins/nfctype1.c
+++ b/plugins/nfctype1.c
@@ -31,8 +31,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/nfctype2.c b/plugins/nfctype2.c
index 3618ca177363..ac9f2de4b71c 100644
--- a/plugins/nfctype2.c
+++ b/plugins/nfctype2.c
@@ -30,8 +30,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/nfctype3.c b/plugins/nfctype3.c
index c0502f15d9f2..9428bebbb382 100644
--- a/plugins/nfctype3.c
+++ b/plugins/nfctype3.c
@@ -30,8 +30,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/nfctype4.c b/plugins/nfctype4.c
index eae6c64aa354..4160e9d071c0 100644
--- a/plugins/nfctype4.c
+++ b/plugins/nfctype4.c
@@ -32,8 +32,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/nfctype5.c b/plugins/nfctype5.c
index eef2afe9f6d0..9dfb97819cbd 100644
--- a/plugins/nfctype5.c
+++ b/plugins/nfctype5.c
@@ -23,8 +23,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/npp.c b/plugins/npp.c
index 5c9d2e0cd003..e7027a1d4a5b 100644
--- a/plugins/npp.c
+++ b/plugins/npp.c
@@ -30,8 +30,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/p2p.c b/plugins/p2p.c
index cf3e0accaf33..d6eb8b9ca15f 100644
--- a/plugins/p2p.c
+++ b/plugins/p2p.c
@@ -32,8 +32,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/phdc.c b/plugins/phdc.c
index 5068e65978e8..c624fab369d9 100644
--- a/plugins/phdc.c
+++ b/plugins/phdc.c
@@ -27,8 +27,8 @@
 #include <stdbool.h>
 #include <string.h>
 #include <sys/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/dbus.h>
 #include <near/log.h>
 #include <near/device.h>
diff --git a/plugins/snep-validation.c b/plugins/snep-validation.c
index 22619380c681..44ac5ff3523d 100644
--- a/plugins/snep-validation.c
+++ b/plugins/snep-validation.c
@@ -30,8 +30,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/plugins/snep.c b/plugins/snep.c
index 7557f78aa0df..97d96f5df355 100644
--- a/plugins/snep.c
+++ b/plugins/snep.c
@@ -30,8 +30,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/log.h>
 #include <near/types.h>
diff --git a/se/plugins/nfc.c b/se/plugins/nfc.c
index e2f54126119f..1b44406e9029 100644
--- a/se/plugins/nfc.c
+++ b/se/plugins/nfc.c
@@ -26,6 +26,7 @@
 =

 #include <sys/socket.h>
 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

 #include <glib.h>
 =

@@ -36,7 +37,6 @@
 =

 #include <near/log.h>
 #include <near/plugin.h>
-#include <near/nfc_copy.h>
 =

 #include "../manager.h"
 #include "../driver.h"
diff --git a/src/near.h b/src/near.h
index e7f7fa7672d2..76062a3a53d6 100644
--- a/src/near.h
+++ b/src/near.h
@@ -24,10 +24,10 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

 #include <glib.h>
 =

-#include <near/nfc_copy.h>
 #include <near/types.h>
 =

 struct near_adapter;
diff --git a/src/snep.c b/src/snep.c
index d4692c522df3..333a6cb87c14 100644
--- a/src/snep.c
+++ b/src/snep.c
@@ -29,8 +29,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/plugin.h>
 #include <near/types.h>
 #include <near/adapter.h>
diff --git a/tools/nfctool/adapter.c b/tools/nfctool/adapter.c
index 5e076782e373..6c34479be540 100644
--- a/tools/nfctool/adapter.c
+++ b/tools/nfctool/adapter.c
@@ -24,10 +24,9 @@
 #include <errno.h>
 #include <string.h>
 #include <sys/socket.h>
+#include <linux/nfc.h>
 #include <glib.h>
 =

-#include <near/nfc_copy.h>
-
 #include "adapter.h"
 #include "nfctool.h"
 #include "netlink.h"
diff --git a/tools/nfctool/llcp-decode.c b/tools/nfctool/llcp-decode.c
index 3aa222f0f39e..b7b1d0b197ee 100644
--- a/tools/nfctool/llcp-decode.c
+++ b/tools/nfctool/llcp-decode.c
@@ -23,10 +23,9 @@
 #include <errno.h>
 #include <string.h>
 #include <netdb.h>
+#include <linux/nfc.h>
 #include <sys/time.h>
 =

-#include <near/nfc_copy.h>
-
 #include "nfctool.h"
 #include "sniffer.h"
 #include "ndef-decode.h"
diff --git a/tools/nfctool/main.c b/tools/nfctool/main.c
index 65a0c15a9465..8dffbe110894 100644
--- a/tools/nfctool/main.c
+++ b/tools/nfctool/main.c
@@ -28,11 +28,10 @@
 #include <errno.h>
 #include <string.h>
 #include <sys/socket.h>
+#include <linux/nfc.h>
 #include <glib.h>
-
 #include <netlink/genl/genl.h>
 =

-#include <near/nfc_copy.h>
 =

 #include "nfctool.h"
 #include "adapter.h"
diff --git a/tools/nfctool/netlink.c b/tools/nfctool/netlink.c
index 112b3cb09eb2..1ccca96aa06e 100644
--- a/tools/nfctool/netlink.c
+++ b/tools/nfctool/netlink.c
@@ -25,6 +25,7 @@
 =

 #include <errno.h>
 #include <sys/socket.h>
+#include <linux/nfc.h>
 =

 #include <netlink/netlink.h>
 #include <netlink/genl/genl.h>
@@ -33,8 +34,6 @@
 =

 #include <glib.h>
 =

-#include <near/nfc_copy.h>
-
 #include "nfctool.h"
 #include "netlink.h"
 #include "adapter.h"
diff --git a/tools/nfctool/snep-decode.c b/tools/nfctool/snep-decode.c
index 6168c1529de2..7fe985c5c637 100644
--- a/tools/nfctool/snep-decode.c
+++ b/tools/nfctool/snep-decode.c
@@ -24,8 +24,7 @@
 #include <string.h>
 #include <netdb.h>
 #include <sys/time.h>
-
-#include <near/nfc_copy.h>
+#include <linux/nfc.h>
 =

 #include "nfctool.h"
 #include "sniffer.h"
diff --git a/tools/nfctool/sniffer.c b/tools/nfctool/sniffer.c
index 6a38a213c74d..488cfe543324 100644
--- a/tools/nfctool/sniffer.c
+++ b/tools/nfctool/sniffer.c
@@ -32,11 +32,10 @@
 #include <arpa/inet.h>
 #include <linux/tcp.h>
 #include <linux/ip.h>
+#include <linux/nfc.h>
 #include <errno.h>
 #include <glib.h>
 =

-#include <near/nfc_copy.h>
-
 #include "nfctool.h"
 #include "llcp-decode.h"
 #include "sniffer.h"
diff --git a/tools/snep-send.c b/tools/snep-send.c
index 53f53250b1ae..441d86a598b8 100644
--- a/tools/snep-send.c
+++ b/tools/snep-send.c
@@ -8,8 +8,8 @@
 #include <sys/socket.h>
 =

 #include <linux/socket.h>
+#include <linux/nfc.h>
 =

-#include <near/nfc_copy.h>
 #include <near/types.h>
 #include <near/ndef.h>
 =

-- =

2.32.0

--===============7533094855696385057==--

