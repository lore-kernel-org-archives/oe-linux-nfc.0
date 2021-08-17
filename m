Content-Type: multipart/mixed; boundary="===============3985366296118821116=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 7/8] selftests: nci: Extract the start/stop discovery function
Date: Tue, 17 Aug 2021 06:28:17 -0700
Message-ID: <20210817132818.8275-8-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3985366296118821116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

To reuse the start/stop discovery code in other testcase, extract the code.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 53 +++++++++++++++++++--------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftest=
s/nci/nci_dev.c
index 2b90379523c6..a68b14642c20 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -517,38 +517,61 @@ static void *virtual_poll_stop(void *data)
 	return (void *)-1;
 }
 =

-TEST_F(NCI, start_poll)
+int start_polling(int dev_idx, int proto, int virtual_fd, int sd, int fid,=
 int pid)
 {
 	__u16 nla_start_poll_type[2] =3D {NFC_ATTR_DEVICE_INDEX,
 					 NFC_ATTR_PROTOCOLS};
-	void *nla_start_poll_data[2] =3D {&self->dev_idex, &self->proto};
+	void *nla_start_poll_data[2] =3D {&dev_idx, &proto};
 	int nla_start_poll_len[2] =3D {4, 4};
 	pthread_t thread_t;
 	int status;
 	int rc;
 =

 	rc =3D pthread_create(&thread_t, NULL, virtual_poll_start,
-			    (void *)&self->virtual_nci_fd);
-	ASSERT_GT(rc, -1);
+			    (void *)&virtual_fd);
+	if (rc < 0)
+		return rc;
 =

-	rc =3D send_cmd_mt_nla(self->sd, self->fid, self->pid, NFC_CMD_START_POLL=
, 2,
-			     nla_start_poll_type, nla_start_poll_data,
-			     nla_start_poll_len, NLM_F_REQUEST);
-	EXPECT_EQ(rc, 0);
+	rc =3D send_cmd_mt_nla(sd, fid, pid, NFC_CMD_START_POLL, 2, nla_start_pol=
l_type,
+			     nla_start_poll_data, nla_start_poll_len, NLM_F_REQUEST);
+	if (rc !=3D 0)
+		return rc;
 =

 	pthread_join(thread_t, (void **)&status);
-	ASSERT_EQ(status, 0);
+	return status;
+}
+
+int stop_polling(int dev_idx, int virtual_fd, int sd, int fid, int pid)
+{
+	pthread_t thread_t;
+	int status;
+	int rc;
 =

 	rc =3D pthread_create(&thread_t, NULL, virtual_poll_stop,
-			    (void *)&self->virtual_nci_fd);
-	ASSERT_GT(rc, -1);
+			    (void *)&virtual_fd);
+	if (rc < 0)
+		return rc;
 =

-	rc =3D send_cmd_with_idx(self->sd, self->fid, self->pid,
-			       NFC_CMD_STOP_POLL, self->dev_idex);
-	EXPECT_EQ(rc, 0);
+	rc =3D send_cmd_with_idx(sd, fid, pid,
+			       NFC_CMD_STOP_POLL, dev_idx);
+	if (rc !=3D 0)
+		return rc;
 =

 	pthread_join(thread_t, (void **)&status);
-	ASSERT_EQ(status, 0);
+	return status;
+}
+
+TEST_F(NCI, start_poll)
+{
+	int status;
+
+	status =3D start_polling(self->dev_idex, self->proto, self->virtual_nci_f=
d,
+			       self->sd, self->fid, self->pid);
+	EXPECT_EQ(status, 0);
+
+	status =3D stop_polling(self->dev_idex, self->virtual_nci_fd, self->sd,
+			      self->fid, self->pid);
+	EXPECT_EQ(status, 0);
 }
 =

 TEST_F(NCI, deinit)
-- =

2.32.0

--===============3985366296118821116==--

