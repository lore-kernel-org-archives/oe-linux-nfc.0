Content-Type: multipart/mixed; boundary="===============1684561641103694580=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH] adapter: use sockaddr_storage to solve uninitialized sa_data access
Date: Sun, 10 Oct 2021 12:18:15 +0200
Message-ID: <20211010101815.17964-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1684561641103694580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On x86_64 valgrind complains when reading a tag:

    neard[15754]: src/tag.c:tag_initialize()
    neard[15754]: src/tag.c:set_tag_type() protocol 0x8 sens_res 0x0 sel_re=
s 0x0
    neard[15754]: src/tag.c:set_tag_type() tag type 0x3
    neard[15754]: src/tag.c:__near_tag_add() connection 0x513aeb0
    neard[15754]: src/adapter.c:near_adapter_connect() idx 0
    =3D=3D15754=3D=3D Syscall param socketcall.connect(serv_addr.sa_data) p=
oints to uninitialised byte(s)
    =3D=3D15754=3D=3D    at 0x4B45057: connect (connect.c:26)
    =3D=3D15754=3D=3D    by 0x1306D8: near_adapter_connect (adapter.c:1068)
    =3D=3D15754=3D=3D    by 0x130BB3: adapter_add_tag (adapter.c:754)
    =3D=3D15754=3D=3D    by 0x130BB3: __near_adapter_add_target (adapter.c:=
841)
    =3D=3D15754=3D=3D    by 0x13462D: get_targets_handler (netlink.c:574)
    =3D=3D15754=3D=3D    by 0x4A11DF0: nl_recvmsgs_report (in /usr/lib/x86_=
64-linux-gnu/libnl-3.so.200.26.0)
    =3D=3D15754=3D=3D    by 0x4A122CC: nl_recvmsgs (in /usr/lib/x86_64-linu=
x-gnu/libnl-3.so.200.26.0)
    =3D=3D15754=3D=3D    by 0x134262: __nl_send_msg (netlink.c:151)
    =3D=3D15754=3D=3D    by 0x13494E: nfc_netlink_event_targets_found.isra.=
0 (netlink.c:627)
    =3D=3D15754=3D=3D    by 0x134DB4: nfc_netlink_event (netlink.c:780)
    =3D=3D15754=3D=3D    by 0x4A11DF0: nl_recvmsgs_report (in /usr/lib/x86_=
64-linux-gnu/libnl-3.so.200.26.0)
    =3D=3D15754=3D=3D    by 0x4A122CC: nl_recvmsgs (in /usr/lib/x86_64-linu=
x-gnu/libnl-3.so.200.26.0)
    =3D=3D15754=3D=3D    by 0x13483B: __nfc_netlink_event (netlink.c:837)
    =3D=3D15754=3D=3D    by 0x13483B: __nfc_netlink_event (netlink.c:821)
    =3D=3D15754=3D=3D  Address 0x1ffefffa82 is on thread 1's stack
    =3D=3D15754=3D=3D  in frame #1, created by near_adapter_connect (adapte=
r.c:1038)
    =3D=3D15754=3D=3D
    neard[15754]: src/tag.c:__near_tag_read() type 0x3
    neard[15754]: src/adapter.c:__near_adapter_stop_check_presence()
    neard[15754]: src/tag.c:__near_tag_read() driver type 0x1
    neard[15754]: src/tag.c:__near_tag_read() driver type 0x2
    neard[15754]: src/tag.c:__near_tag_read() driver type 0x3

Due to alignment the actual sizeof(sockaddr_nfc) is 16 bytes, but only
first 14 bytes are initialized.  Valgrind complains about remaining two
bytes.  Solve it by using more generic storage - sockaddr_storage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/adapter.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index e0ab8c5d6055..a0042b9dce87 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -1036,9 +1036,10 @@ static gboolean adapter_recv_event(GIOChannel *chann=
el, GIOCondition condition,
 =

 int near_adapter_connect(uint32_t idx, uint32_t target_idx, uint8_t protoc=
ol)
 {
+	struct sockaddr_storage addr_storage =3D {};
 	struct near_adapter *adapter;
+	struct sockaddr_nfc *addr;
 	struct near_tag *tag;
-	struct sockaddr_nfc addr;
 	int err, sock;
 =

 	DBG("idx %u", idx);
@@ -1059,12 +1060,13 @@ int near_adapter_connect(uint32_t idx, uint32_t tar=
get_idx, uint8_t protocol)
 	if (sock =3D=3D -1)
 		return -errno;
 =

-	addr.sa_family =3D AF_NFC;
-	addr.dev_idx =3D idx;
-	addr.target_idx =3D target_idx;
-	addr.nfc_protocol =3D protocol;
+	addr =3D (struct sockaddr_nfc *)&addr_storage;
+	addr->sa_family =3D AF_NFC;
+	addr->dev_idx =3D idx;
+	addr->target_idx =3D target_idx;
+	addr->nfc_protocol =3D protocol;
 =

-	err =3D connect(sock, (struct sockaddr *) &addr, sizeof(addr));
+	err =3D connect(sock, (struct sockaddr *) addr, sizeof(*addr));
 	if (err) {
 		close(sock);
 		return -errno;
-- =

2.30.2

--===============1684561641103694580==--

