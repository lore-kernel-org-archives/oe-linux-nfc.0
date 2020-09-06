Content-Type: multipart/mixed; boundary="===============7371029041342993763=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 6/9] nfc: s3fwrn5: Constify s3fwrn5_fw_info when not modified
Date: Sun, 06 Sep 2020 17:36:51 +0200
Message-ID: <20200906153654.2925-7-krzk@kernel.org>
In-Reply-To: <20200906153654.2925-1-krzk@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7371029041342993763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Two functions accept pointer to struct s3fwrn5_fw_info but do not
modify the contents.  Make them const so the code is a little bit safer.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/nfc/s3fwrn5/firmware.c | 4 ++--
 drivers/nfc/s3fwrn5/firmware.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 69857f080704..ec930ee2c847 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -348,7 +348,7 @@ static int s3fwrn5_fw_get_base_addr(
 }
 =

 static inline bool
-s3fwrn5_fw_is_custom(struct s3fwrn5_fw_cmd_get_bootinfo_rsp *bootinfo)
+s3fwrn5_fw_is_custom(const struct s3fwrn5_fw_cmd_get_bootinfo_rsp *bootinf=
o)
 {
 	return !!bootinfo->hw_version[2];
 }
@@ -399,7 +399,7 @@ int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info)
 	return ret;
 }
 =

-bool s3fwrn5_fw_check_version(struct s3fwrn5_fw_info *fw_info, u32 version)
+bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 v=
ersion)
 {
 	struct s3fwrn5_fw_version *new =3D (void *) &fw_info->fw.version;
 	struct s3fwrn5_fw_version *old =3D (void *) &version;
diff --git a/drivers/nfc/s3fwrn5/firmware.h b/drivers/nfc/s3fwrn5/firmware.h
index cf1a83a5a525..3c83e6730d30 100644
--- a/drivers/nfc/s3fwrn5/firmware.h
+++ b/drivers/nfc/s3fwrn5/firmware.h
@@ -91,7 +91,7 @@ struct s3fwrn5_fw_info {
 =

 void s3fwrn5_fw_init(struct s3fwrn5_fw_info *fw_info, const char *fw_name);
 int s3fwrn5_fw_setup(struct s3fwrn5_fw_info *fw_info);
-bool s3fwrn5_fw_check_version(struct s3fwrn5_fw_info *fw_info, u32 version=
);
+bool s3fwrn5_fw_check_version(const struct s3fwrn5_fw_info *fw_info, u32 v=
ersion);
 int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info);
 void s3fwrn5_fw_cleanup(struct s3fwrn5_fw_info *fw_info);
 =

-- =

2.17.1

--===============7371029041342993763==--

