Content-Type: multipart/mixed; boundary="===============6135362564576682353=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 02/12] nfc: mei_phy: constify buffer passed to mei_nfc_send()
Date: Thu, 29 Jul 2021 12:40:12 +0200
Message-ID: <20210729104022.47761-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210729104022.47761-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6135362564576682353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The buffer passed to mei_nfc_send() can be const for correctness and
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/mei_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/mei_phy.c b/drivers/nfc/mei_phy.c
index 41146bb99474..f9cca885beec 100644
--- a/drivers/nfc/mei_phy.c
+++ b/drivers/nfc/mei_phy.c
@@ -202,7 +202,7 @@ static int mei_nfc_connect(struct nfc_mei_phy *phy)
 	return r;
 }
 =

-static int mei_nfc_send(struct nfc_mei_phy *phy, u8 *buf, size_t length)
+static int mei_nfc_send(struct nfc_mei_phy *phy, const u8 *buf, size_t len=
gth)
 {
 	struct mei_nfc_hdr *hdr;
 	u8 *mei_buf;
-- =

2.27.0

--===============6135362564576682353==--

