Content-Type: multipart/mixed; boundary="===============8645865172663529486=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 3/8] selftests: nci: Fix the typo
Date: Tue, 17 Aug 2021 06:28:13 -0700
Message-ID: <20210817132818.8275-4-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8645865172663529486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Fix typo: rep_len -> resp_len

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftest=
s/nci/nci_dev.c
index 34e76c7fa1fe..b4d85eeb5fd1 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -158,7 +158,7 @@ static int get_family_id(int sd, __u32 pid)
 		char buf[512];
 	} ans;
 	struct nlattr *na;
-	int rep_len;
+	int resp_len;
 	__u16 id;
 	int rc;
 =

@@ -167,10 +167,10 @@ static int get_family_id(int sd, __u32 pid)
 	if (rc < 0)
 		return 0;
 =

-	rep_len =3D recv(sd, &ans, sizeof(ans), 0);
+	resp_len =3D recv(sd, &ans, sizeof(ans), 0);
 =

-	if (ans.n.nlmsg_type =3D=3D NLMSG_ERROR || rep_len < 0 ||
-	    !NLMSG_OK(&ans.n, rep_len))
+	if (ans.n.nlmsg_type =3D=3D NLMSG_ERROR || resp_len < 0 ||
+	    !NLMSG_OK(&ans.n, resp_len))
 		return 0;
 =

 	na =3D (struct nlattr *)GENLMSG_DATA(&ans);
@@ -194,7 +194,7 @@ static int send_cmd_with_idx(int sd, __u16 nlmsg_type, =
__u32 nlmsg_pid,
 =

 static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id, struct =
msgtemplate *msg)
 {
-	int rc, rep_len;
+	int rc, resp_len;
 =

 	rc =3D send_cmd_with_idx(sd, fid, pid, NFC_CMD_GET_DEVICE, dev_id);
 	if (rc < 0) {
@@ -202,14 +202,14 @@ static int get_nci_devid(int sd, __u16 fid, __u32 pid=
, int dev_id, struct msgtem
 		goto error;
 	}
 =

-	rep_len =3D recv(sd, msg, sizeof(*msg), 0);
-	if (rep_len < 0) {
+	resp_len =3D recv(sd, msg, sizeof(*msg), 0);
+	if (resp_len < 0) {
 		rc =3D -2;
 		goto error;
 	}
 =

 	if (msg->n.nlmsg_type =3D=3D NLMSG_ERROR ||
-	    !NLMSG_OK(&msg->n, rep_len)) {
+	    !NLMSG_OK(&msg->n, resp_len)) {
 		rc =3D -3;
 		goto error;
 	}
@@ -222,21 +222,21 @@ static int get_nci_devid(int sd, __u16 fid, __u32 pid=
, int dev_id, struct msgtem
 static __u8 get_dev_enable_state(struct msgtemplate *msg)
 {
 	struct nlattr *na;
-	int rep_len;
+	int resp_len;
 	int len;
 =

-	rep_len =3D GENLMSG_PAYLOAD(&msg->n);
+	resp_len =3D GENLMSG_PAYLOAD(&msg->n);
 	na =3D (struct nlattr *)GENLMSG_DATA(msg);
 	len =3D 0;
 =

-	while (len < rep_len) {
+	while (len < resp_len) {
 		len +=3D NLA_ALIGN(na->nla_len);
 		if (na->nla_type =3D=3D NFC_ATTR_DEVICE_POWERED)
 			return *(char *)NLA_DATA(na);
 		na =3D (struct nlattr *)(GENLMSG_DATA(msg) + len);
 	}
 =

-	return rep_len;
+	return resp_len;
 }
 =

 FIXTURE(NCI) {
-- =

2.32.0

--===============8645865172663529486==--

