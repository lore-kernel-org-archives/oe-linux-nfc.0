Content-Type: multipart/mixed; boundary="===============6583057487316096206=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 05/15] nfc: pn533: drop unneeded debug prints
Date: Mon, 13 Sep 2021 15:20:25 +0200
Message-ID: <20210913132035.242870-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6583057487316096206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/i2c.c   | 4 ----
 drivers/nfc/pn533/pn533.c | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index e6bf8cfe3aa7..f5610b6b9894 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -128,7 +128,6 @@ static int pn533_i2c_read(struct pn533_i2c_phy *phy, st=
ruct sk_buff **skb)
 static irqreturn_t pn533_i2c_irq_thread_fn(int irq, void *data)
 {
 	struct pn533_i2c_phy *phy =3D data;
-	struct i2c_client *client;
 	struct sk_buff *skb =3D NULL;
 	int r;
 =

@@ -137,9 +136,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, voi=
d *data)
 		return IRQ_NONE;
 	}
 =

-	client =3D phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
-
 	if (phy->hard_fault !=3D 0)
 		return IRQ_HANDLED;
 =

diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index 2f3f3fe9a0ba..c5f127fe2d45 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1235,8 +1235,6 @@ static void pn533_listen_mode_timer(struct timer_list=
 *t)
 {
 	struct pn533 *dev =3D from_timer(dev, t, listen_timer);
 =

-	dev_dbg(dev->dev, "Listen mode timeout\n");
-
 	dev->cancel_listen =3D 1;
 =

 	pn533_poll_next_mod(dev);
-- =

2.30.2

--===============6583057487316096206==--

