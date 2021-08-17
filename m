Content-Type: multipart/mixed; boundary="===============2747988403876621141=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 6/8] selftests: nci: Add the flags parameter for the send_cmd_mt_nla
Date: Tue, 17 Aug 2021 06:28:16 -0700
Message-ID: <20210817132818.8275-7-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2747988403876621141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

To reuse the send_cmd_mt_nla for NLM_F_REQUEST and NLM_F_DUMP flag,
add the flags parameter to the function.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftest=
s/nci/nci_dev.c
index a1786cef73bc..2b90379523c6 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -87,7 +87,7 @@ static int create_nl_socket(void)
 =

 static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
 			   __u8 genl_cmd, int nla_num, __u16 nla_type[],
-			   void *nla_data[], int nla_len[])
+			   void *nla_data[], int nla_len[], __u16 flags)
 {
 	struct sockaddr_nl nladdr;
 	struct msgtemplate msg;
@@ -98,7 +98,7 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __u3=
2 nlmsg_pid,
 =

 	msg.n.nlmsg_len =3D NLMSG_LENGTH(GENL_HDRLEN);
 	msg.n.nlmsg_type =3D nlmsg_type;
-	msg.n.nlmsg_flags =3D NLM_F_REQUEST;
+	msg.n.nlmsg_flags =3D flags;
 	msg.n.nlmsg_seq =3D 0;
 	msg.n.nlmsg_pid =3D nlmsg_pid;
 	msg.g.cmd =3D genl_cmd;
@@ -146,8 +146,8 @@ static int send_get_nfc_family(int sd, __u32 pid)
 	nla_get_family_data =3D family_name;
 =

 	return send_cmd_mt_nla(sd, GENL_ID_CTRL, pid, CTRL_CMD_GETFAMILY,
-				1, &nla_get_family_type,
-				&nla_get_family_data, &nla_get_family_len);
+				1, &nla_get_family_type, &nla_get_family_data,
+				&nla_get_family_len, NLM_F_REQUEST);
 }
 =

 static int get_family_id(int sd, __u32 pid)
@@ -189,7 +189,7 @@ static int send_cmd_with_idx(int sd, __u16 nlmsg_type, =
__u32 nlmsg_pid,
 	int nla_len =3D 4;
 =

 	return send_cmd_mt_nla(sd, nlmsg_type, nlmsg_pid, genl_cmd, 1,
-				&nla_type, &nla_data, &nla_len);
+				&nla_type, &nla_data, &nla_len, NLM_F_REQUEST);
 }
 =

 static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id, struct =
msgtemplate *msg)
@@ -531,9 +531,9 @@ TEST_F(NCI, start_poll)
 			    (void *)&self->virtual_nci_fd);
 	ASSERT_GT(rc, -1);
 =

-	rc =3D send_cmd_mt_nla(self->sd, self->fid, self->pid,
-			     NFC_CMD_START_POLL, 2, nla_start_poll_type,
-			     nla_start_poll_data, nla_start_poll_len);
+	rc =3D send_cmd_mt_nla(self->sd, self->fid, self->pid, NFC_CMD_START_POLL=
, 2,
+			     nla_start_poll_type, nla_start_poll_data,
+			     nla_start_poll_len, NLM_F_REQUEST);
 	EXPECT_EQ(rc, 0);
 =

 	pthread_join(thread_t, (void **)&status);
-- =

2.32.0

--===============2747988403876621141==--

