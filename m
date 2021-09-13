Content-Type: multipart/mixed; boundary="===============2002040445414285095=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 06/15] nfc: pn533: use dev_err() instead of pr_err()
Date: Mon, 13 Sep 2021 15:20:26 +0200
Message-ID: <20210913132035.242870-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2002040445414285095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Print error message with reference to a device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/pn533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index c5f127fe2d45..da180335422c 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -2171,7 +2171,7 @@ void pn533_recv_frame(struct pn533 *dev, struct sk_bu=
ff *skb, int status)
 	}
 =

 	if (skb =3D=3D NULL) {
-		pr_err("NULL Frame -> link is dead\n");
+		dev_err(dev->dev, "NULL Frame -> link is dead\n");
 		goto sched_wq;
 	}
 =

-- =

2.30.2

--===============2002040445414285095==--

