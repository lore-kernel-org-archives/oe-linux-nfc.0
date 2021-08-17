Content-Type: multipart/mixed; boundary="===============3150430551450671953=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 2/8] selftests: nci: Remove the polling code to read a NCI frame
Date: Tue, 17 Aug 2021 06:28:12 -0700
Message-ID: <20210817132818.8275-3-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3150430551450671953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Because the virtual NCI device uses Wait Queue, the virtual device
application doesn't need to poll the NCI frame.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/testing/selftests/nci/nci_dev.c | 33 +++++++++------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftest=
s/nci/nci_dev.c
index 57b505cb1561..34e76c7fa1fe 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -270,8 +270,7 @@ static void *virtual_dev_open(void *data)
 =

 	dev_fd =3D *(int *)data;
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_reset_cmd))
@@ -280,8 +279,7 @@ static void *virtual_dev_open(void *data)
 		goto error;
 	write(dev_fd, nci_reset_rsp, sizeof(nci_reset_rsp));
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_init_cmd))
@@ -290,8 +288,7 @@ static void *virtual_dev_open(void *data)
 		goto error;
 	write(dev_fd, nci_init_rsp, sizeof(nci_init_rsp));
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_rf_disc_map_cmd))
@@ -313,8 +310,7 @@ static void *virtual_dev_open_v2(void *data)
 =

 	dev_fd =3D *(int *)data;
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_reset_cmd))
@@ -324,8 +320,7 @@ static void *virtual_dev_open_v2(void *data)
 	write(dev_fd, nci_reset_rsp_v2, sizeof(nci_reset_rsp_v2));
 	write(dev_fd, nci_reset_ntf, sizeof(nci_reset_ntf));
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_init_cmd_v2))
@@ -334,8 +329,7 @@ static void *virtual_dev_open_v2(void *data)
 		goto error;
 	write(dev_fd, nci_init_rsp_v2, sizeof(nci_init_rsp_v2));
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_rf_disc_map_cmd))
@@ -402,8 +396,7 @@ static void *virtual_deinit(void *data)
 =

 	dev_fd =3D *(int *)data;
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_reset_cmd))
@@ -425,8 +418,7 @@ static void *virtual_deinit_v2(void *data)
 =

 	dev_fd =3D *(int *)data;
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_reset_cmd))
@@ -489,16 +481,14 @@ static void *virtual_poll_start(void *data)
 =

 	dev_fd =3D *(int *)data;
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_rf_discovery_cmd))
 		goto error;
 	if (memcmp(nci_rf_discovery_cmd, buf, len))
 		goto error;
-	write(dev_fd, nci_rf_disc_rsp, sizeof(nci_rf_disc_rsp))
-		;
+	write(dev_fd, nci_rf_disc_rsp, sizeof(nci_rf_disc_rsp));
 =

 	return (void *)0;
 error:
@@ -513,8 +503,7 @@ static void *virtual_poll_stop(void *data)
 =

 	dev_fd =3D *(int *)data;
 =

-	while ((len =3D read(dev_fd, buf, 258)) =3D=3D 0)
-		;
+	len =3D read(dev_fd, buf, 258);
 	if (len <=3D 0)
 		goto error;
 	if (len !=3D sizeof(nci_rf_deact_cmd))
-- =

2.32.0

--===============3150430551450671953==--

