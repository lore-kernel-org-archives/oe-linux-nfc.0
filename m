Content-Type: multipart/mixed; boundary="===============5331361915325935129=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon@samsung.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next v2 3/3] nfc: s3fwrn5: Change the error code
Date: Tue, 17 Nov 2020 10:18:50 +0900
Message-ID: <20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
In-Reply-To: <CGME20201117011850epcms2p568af074144630cd0f02b3a7f7eff8d1a@epcms2p5>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5331361915325935129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 drivers/nfc/s3fwrn5/s3fwrn5.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/s3fwrn5.h b/drivers/nfc/s3fwrn5/s3fwrn5.h
index 9d5f34759225..bb8f936d13a2 100644
--- a/drivers/nfc/s3fwrn5/s3fwrn5.h
+++ b/drivers/nfc/s3fwrn5/s3fwrn5.h
@@ -44,7 +44,7 @@ static inline int s3fwrn5_set_mode(struct s3fwrn5_info *i=
nfo,
 	enum s3fwrn5_mode mode)
 {
 	if (!info->phy_ops->set_mode)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 =

 	info->phy_ops->set_mode(info->phy_id, mode);
 =

@@ -54,7 +54,7 @@ static inline int s3fwrn5_set_mode(struct s3fwrn5_info *i=
nfo,
 static inline enum s3fwrn5_mode s3fwrn5_get_mode(struct s3fwrn5_info *info)
 {
 	if (!info->phy_ops->get_mode)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 =

 	return info->phy_ops->get_mode(info->phy_id);
 }
@@ -62,7 +62,7 @@ static inline enum s3fwrn5_mode s3fwrn5_get_mode(struct s=
3fwrn5_info *info)
 static inline int s3fwrn5_set_wake(struct s3fwrn5_info *info, bool wake)
 {
 	if (!info->phy_ops->set_wake)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 =

 	info->phy_ops->set_wake(info->phy_id, wake);
 =

@@ -72,7 +72,7 @@ static inline int s3fwrn5_set_wake(struct s3fwrn5_info *i=
nfo, bool wake)
 static inline int s3fwrn5_write(struct s3fwrn5_info *info, struct sk_buff =
*skb)
 {
 	if (!info->phy_ops->write)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 =

 	return info->phy_ops->write(info->phy_id, skb);
 }
-- =

2.17.1

--===============5331361915325935129==--

