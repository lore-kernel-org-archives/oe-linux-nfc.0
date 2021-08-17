Content-Type: multipart/mixed; boundary="===============5436468270689962756=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 8/8] selftests: nci: Add the NCI testcase reading T4T Tag
Date: Tue, 17 Aug 2021 06:28:18 -0700
Message-ID: <20210817132818.8275-9-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5436468270689962756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Add the NCI testcase reading T4T Tag that has NFC TEST in plain text.
the virtual device application acts as T4T Tag in this testcase.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 292 +++++++++++++++++++++++++-
 1 file changed, 287 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftest=
s/nci/nci_dev.c
index a68b14642c20..e1bf55dabdf6 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -57,6 +57,29 @@ const __u8 nci_init_rsp_v2[] =3D {0x40, 0x01, 0x1c, 0x00=
, 0x1a, 0x7e, 0x06,
 const __u8 nci_rf_disc_map_rsp[] =3D {0x41, 0x00, 0x01, 0x00};
 const __u8 nci_rf_disc_rsp[] =3D {0x41, 0x03, 0x01, 0x00};
 const __u8 nci_rf_deact_rsp[] =3D {0x41, 0x06, 0x01, 0x00};
+const __u8 nci_rf_deact_ntf[] =3D {0x61, 0x06, 0x02, 0x00, 0x00};
+const __u8 nci_rf_activate_ntf[] =3D {0x61, 0x05, 0x1D, 0x01, 0x02, 0x04, =
0x00,
+				     0xFF, 0xFF, 0x0C, 0x44, 0x03, 0x07, 0x04,
+				     0x62, 0x26, 0x11, 0x80, 0x1D, 0x80, 0x01,
+				     0x20, 0x00, 0x00, 0x00, 0x06, 0x05, 0x75,
+				     0x77, 0x81, 0x02, 0x80};
+const __u8 nci_t4t_select_cmd[] =3D {0x00, 0x00, 0x0C, 0x00, 0xA4, 0x04, 0=
x00,
+				    0x07, 0xD2, 0x76, 0x00, 0x00, 0x85, 0x01, 0x01};
+const __u8 nci_t4t_select_cmd2[] =3D {0x00, 0x00, 0x07, 0x00, 0xA4, 0x00, =
0x0C, 0x02,
+				     0xE1, 0x03};
+const __u8 nci_t4t_select_cmd3[] =3D {0x00, 0x00, 0x07, 0x00, 0xA4, 0x00, =
0x0C, 0x02,
+				     0xE1, 0x04};
+const __u8 nci_t4t_read_cmd[] =3D {0x00, 0x00, 0x05, 0x00, 0xB0, 0x00, 0x0=
0, 0x0F};
+const __u8 nci_t4t_read_rsp[] =3D {0x00, 0x00, 0x11, 0x00, 0x0F, 0x20, 0x0=
0, 0x3B,
+				  0x00, 0x34, 0x04, 0x06, 0xE1, 0x04, 0x08, 0x00,
+				  0x00, 0x00, 0x90, 0x00};
+const __u8 nci_t4t_read_cmd2[] =3D {0x00, 0x00, 0x05, 0x00, 0xB0, 0x00, 0x=
00, 0x02};
+const __u8 nci_t4t_read_rsp2[] =3D {0x00, 0x00, 0x04, 0x00, 0x0F, 0x90, 0x=
00};
+const __u8 nci_t4t_read_cmd3[] =3D {0x00, 0x00, 0x05, 0x00, 0xB0, 0x00, 0x=
02, 0x0F};
+const __u8 nci_t4t_read_rsp3[] =3D {0x00, 0x00, 0x11, 0xD1, 0x01, 0x0B, 0x=
54, 0x02,
+				   0x65, 0x6E, 0x4E, 0x46, 0x43, 0x20, 0x54, 0x45,
+				   0x53, 0x54, 0x90, 0x00};
+const __u8 nci_t4t_rsp_ok[] =3D {0x00, 0x00, 0x02, 0x90, 0x00};
 =

 struct msgtemplate {
 	struct nlmsghdr n;
@@ -150,7 +173,7 @@ static int send_get_nfc_family(int sd, __u32 pid)
 				&nla_get_family_len, NLM_F_REQUEST);
 }
 =

-static int get_family_id(int sd, __u32 pid)
+static int get_family_id(int sd, __u32 pid, __u32 *event_group)
 {
 	struct {
 		struct nlmsghdr n;
@@ -160,6 +183,7 @@ static int get_family_id(int sd, __u32 pid)
 	struct nlattr *na;
 	int resp_len;
 	__u16 id;
+	int len;
 	int rc;
 =

 	rc =3D send_get_nfc_family(sd, pid);
@@ -173,11 +197,43 @@ static int get_family_id(int sd, __u32 pid)
 	    !NLMSG_OK(&ans.n, resp_len))
 		return 0;
 =

+	len =3D 0;
+	resp_len =3D GENLMSG_PAYLOAD(&ans.n);
 	na =3D (struct nlattr *)GENLMSG_DATA(&ans);
-	na =3D (struct nlattr *)((char *)na + NLA_ALIGN(na->nla_len));
-	if (na->nla_type =3D=3D CTRL_ATTR_FAMILY_ID)
-		id =3D *(__u16 *)NLA_DATA(na);
 =

+	while (len < resp_len) {
+		len +=3D NLA_ALIGN(na->nla_len);
+		if (na->nla_type =3D=3D CTRL_ATTR_FAMILY_ID) {
+			id =3D *(__u16 *)NLA_DATA(na);
+		} else if (na->nla_type =3D=3D CTRL_ATTR_MCAST_GROUPS) {
+			struct nlattr *nested_na;
+			struct nlattr *group_na;
+			int group_attr_len;
+			int group_attr;
+
+			nested_na =3D (struct nlattr *)((char *)na + NLA_HDRLEN);
+			group_na =3D (struct nlattr *)((char *)nested_na + NLA_HDRLEN);
+			group_attr_len =3D 0;
+
+			for (group_attr =3D CTRL_ATTR_MCAST_GRP_UNSPEC;
+				group_attr < CTRL_ATTR_MCAST_GRP_MAX; group_attr++) {
+				if (group_na->nla_type =3D=3D CTRL_ATTR_MCAST_GRP_ID) {
+					*event_group =3D *(__u32 *)((char *)group_na +
+								  NLA_HDRLEN);
+					break;
+				}
+
+				group_attr_len +=3D NLA_ALIGN(group_na->nla_len) +
+						  NLA_HDRLEN;
+				if (group_attr_len >=3D nested_na->nla_len)
+					break;
+
+				group_na =3D (struct nlattr *)((char *)group_na +
+							     NLA_ALIGN(group_na->nla_len));
+			}
+		}
+		na =3D (struct nlattr *)(GENLMSG_DATA(&ans) + len);
+	}
 	return id;
 }
 =

@@ -347,6 +403,7 @@ FIXTURE_SETUP(NCI)
 {
 	struct msgtemplate msg;
 	pthread_t thread_t;
+	__u32 event_group;
 	int status;
 	int rc;
 =

@@ -358,12 +415,16 @@ FIXTURE_SETUP(NCI)
 	ASSERT_NE(self->sd, -1);
 =

 	self->pid =3D getpid();
-	self->fid =3D get_family_id(self->sd, self->pid);
+	self->fid =3D get_family_id(self->sd, self->pid, &event_group);
 	ASSERT_NE(self->fid, -1);
 =

 	self->virtual_nci_fd =3D open("/dev/virtual_nci", O_RDWR);
 	ASSERT_GT(self->virtual_nci_fd, -1);
 =

+	rc =3D setsockopt(self->sd, SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, &event_g=
roup,
+			sizeof(event_group));
+	ASSERT_NE(rc, -1);
+
 	rc =3D ioctl(self->virtual_nci_fd, IOCTL_GET_NCIDEV_IDX, &self->dev_idex);
 	ASSERT_EQ(rc, 0);
 =

@@ -574,6 +635,227 @@ TEST_F(NCI, start_poll)
 	EXPECT_EQ(status, 0);
 }
 =

+int get_taginfo(int dev_idx, int sd, int fid, int pid)
+{
+	struct {
+		struct nlmsghdr n;
+		struct genlmsghdr g;
+		char buf[512];
+	} ans;
+
+	struct nlattr *na;
+	__u32 protocol;
+	int targetidx;
+	__u8 sel_res;
+	int resp_len;
+	int len;
+
+	__u16 tagid_type;
+	void *tagid_type_data;
+	int tagid_len;
+
+	tagid_type =3D NFC_ATTR_DEVICE_INDEX;
+	tagid_type_data =3D &dev_idx;
+	tagid_len =3D 4;
+
+	send_cmd_mt_nla(sd, fid, pid, NFC_CMD_GET_TARGET, 1, &tagid_type,
+			&tagid_type_data, &tagid_len, NLM_F_REQUEST | NLM_F_DUMP);
+	resp_len =3D recv(sd, &ans, sizeof(ans), 0);
+	if (ans.n.nlmsg_type =3D=3D NLMSG_ERROR || resp_len < 0 ||
+	    !NLMSG_OK(&ans.n, resp_len))
+		return -1;
+
+	resp_len =3D GENLMSG_PAYLOAD(&ans.n);
+	na =3D (struct nlattr *)GENLMSG_DATA(&ans);
+
+	len =3D 0;
+	targetidx =3D -1;
+	protocol =3D -1;
+	sel_res =3D -1;
+
+	while (len < resp_len) {
+		len +=3D NLA_ALIGN(na->nla_len);
+
+		if (na->nla_type =3D=3D NFC_ATTR_TARGET_INDEX)
+			targetidx =3D *(int *)((char *)na + NLA_HDRLEN);
+		else if (na->nla_type =3D=3D NFC_ATTR_TARGET_SEL_RES)
+			sel_res =3D *(__u8 *)((char *)na + NLA_HDRLEN);
+		else if (na->nla_type =3D=3D NFC_ATTR_PROTOCOLS)
+			protocol =3D *(__u32 *)((char *)na + NLA_HDRLEN);
+
+		na =3D (struct nlattr *)(GENLMSG_DATA(&ans) + len);
+	}
+
+	if (targetidx =3D=3D -1 || sel_res !=3D 0x20 || protocol !=3D NFC_PROTO_I=
SO14443_MASK)
+		return -1;
+
+	return targetidx;
+}
+
+int connect_socket(int dev_idx, int target_idx)
+{
+	struct sockaddr_nfc addr;
+	int sock;
+	int err =3D 0;
+
+	sock =3D socket(AF_NFC, SOCK_SEQPACKET, NFC_SOCKPROTO_RAW);
+	if (sock =3D=3D -1)
+		return -1;
+
+	addr.sa_family =3D AF_NFC;
+	addr.dev_idx =3D dev_idx;
+	addr.target_idx =3D target_idx;
+	addr.nfc_protocol =3D NFC_PROTO_ISO14443;
+
+	err =3D connect(sock, (struct sockaddr *)&addr, sizeof(addr));
+	if (err) {
+		close(sock);
+		return -1;
+	}
+
+	return sock;
+}
+
+int connect_tag(int dev_idx, int virtual_fd, int sd, int fid, int pid)
+{
+	struct genlmsghdr *genlhdr;
+	struct nlattr *na;
+	char evt_data[255];
+	int target_idx;
+	int resp_len;
+	int evt_dev;
+
+	write(virtual_fd, nci_rf_activate_ntf, sizeof(nci_rf_activate_ntf));
+	resp_len =3D recv(sd, evt_data, sizeof(evt_data), 0);
+	if (resp_len < 0)
+		return -1;
+
+	genlhdr =3D (struct genlmsghdr *)((struct nlmsghdr *)evt_data + 1);
+	na =3D (struct nlattr *)(genlhdr + 1);
+	evt_dev =3D *(int *)((char *)na + NLA_HDRLEN);
+	if (dev_idx !=3D evt_dev)
+		return -1;
+
+	target_idx =3D get_taginfo(dev_idx, sd, fid, pid);
+	if (target_idx =3D=3D -1)
+		return -1;
+	return connect_socket(dev_idx, target_idx);
+}
+
+int read_write_nci_cmd(int nfc_sock, int virtual_fd, const __u8 *cmd, __u3=
2 cmd_len,
+		       const __u8 *rsp, __u32 rsp_len)
+{
+	char buf[256];
+	unsigned int len;
+
+	send(nfc_sock, &cmd[3], cmd_len - 3, 0);
+	len =3D read(virtual_fd, buf, cmd_len);
+	if (len < 0 || memcmp(buf, cmd, cmd_len))
+		return -1;
+
+	write(virtual_fd, rsp, rsp_len);
+	len =3D recv(nfc_sock, buf, rsp_len - 2, 0);
+	if (len < 0 || memcmp(&buf[1], &rsp[3], rsp_len - 3))
+		return -1;
+
+	return 0;
+}
+
+int read_tag(int nfc_sock, int virtual_fd)
+{
+	if (read_write_nci_cmd(nfc_sock, virtual_fd, nci_t4t_select_cmd,
+			       sizeof(nci_t4t_select_cmd), nci_t4t_rsp_ok,
+			       sizeof(nci_t4t_rsp_ok)))
+		return -1;
+
+	if (read_write_nci_cmd(nfc_sock, virtual_fd, nci_t4t_select_cmd2,
+			       sizeof(nci_t4t_select_cmd2), nci_t4t_rsp_ok,
+			       sizeof(nci_t4t_rsp_ok)))
+		return -1;
+
+	if (read_write_nci_cmd(nfc_sock, virtual_fd, nci_t4t_read_cmd,
+			       sizeof(nci_t4t_read_cmd), nci_t4t_read_rsp,
+			       sizeof(nci_t4t_read_rsp)))
+		return -1;
+
+	if (read_write_nci_cmd(nfc_sock, virtual_fd, nci_t4t_select_cmd3,
+			       sizeof(nci_t4t_select_cmd3), nci_t4t_rsp_ok,
+			       sizeof(nci_t4t_rsp_ok)))
+		return -1;
+
+	if (read_write_nci_cmd(nfc_sock, virtual_fd, nci_t4t_read_cmd2,
+			       sizeof(nci_t4t_read_cmd2), nci_t4t_read_rsp2,
+			       sizeof(nci_t4t_read_rsp2)))
+		return -1;
+
+	return read_write_nci_cmd(nfc_sock, virtual_fd, nci_t4t_read_cmd3,
+				  sizeof(nci_t4t_read_cmd3), nci_t4t_read_rsp3,
+				  sizeof(nci_t4t_read_rsp3));
+}
+
+static void *virtual_deactivate_proc(void *data)
+{
+	int virtual_fd;
+	char buf[256];
+	int deactcmd_len;
+	int len;
+
+	virtual_fd =3D *(int *)data;
+	deactcmd_len =3D sizeof(nci_rf_deact_cmd);
+	len =3D read(virtual_fd, buf, deactcmd_len);
+	if (len !=3D deactcmd_len || memcmp(buf, nci_rf_deact_cmd, deactcmd_len))
+		return (void *)-1;
+
+	write(virtual_fd, nci_rf_deact_rsp, sizeof(nci_rf_deact_rsp));
+	write(virtual_fd, nci_rf_deact_ntf, sizeof(nci_rf_deact_ntf));
+
+	return (void *)0;
+}
+
+int disconnect_tag(int nfc_sock, int virtual_fd)
+{
+	pthread_t thread_t;
+	char buf[256];
+	int status;
+	int len;
+
+	send(nfc_sock, &nci_t4t_select_cmd3[3], sizeof(nci_t4t_select_cmd3) - 3, =
0);
+	len =3D read(virtual_fd, buf, sizeof(nci_t4t_select_cmd3));
+	if (len < 0 || memcmp(buf, nci_t4t_select_cmd3, sizeof(nci_t4t_select_cmd=
3)))
+		return -1;
+
+	len =3D recv(nfc_sock, buf, sizeof(nci_t4t_rsp_ok), 0);
+	if (len !=3D -1)
+		return -1;
+
+	status =3D pthread_create(&thread_t, NULL, virtual_deactivate_proc,
+				(void *)&virtual_fd);
+
+	close(nfc_sock);
+	pthread_join(thread_t, (void **)&status);
+	return status;
+}
+
+TEST_F(NCI, t4t_tag_read)
+{
+	int nfc_sock;
+	int status;
+
+	status =3D start_polling(self->dev_idex, self->proto, self->virtual_nci_f=
d,
+			       self->sd, self->fid, self->pid);
+	EXPECT_EQ(status, 0);
+
+	nfc_sock =3D connect_tag(self->dev_idex, self->virtual_nci_fd, self->sd,
+			       self->fid, self->pid);
+	ASSERT_GT(nfc_sock, -1);
+
+	status =3D read_tag(nfc_sock, self->virtual_nci_fd);
+	ASSERT_EQ(status, 0);
+
+	status =3D disconnect_tag(nfc_sock, self->virtual_nci_fd);
+	EXPECT_EQ(status, 0);
+}
+
 TEST_F(NCI, deinit)
 {
 	struct msgtemplate msg;
-- =

2.32.0

--===============5436468270689962756==--

