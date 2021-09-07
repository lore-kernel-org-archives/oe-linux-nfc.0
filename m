Content-Type: multipart/mixed; boundary="===============0815501442400958366=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 05/15] nfc: pn533: drop unneeded debug prints
Date: Tue, 07 Sep 2021 14:18:06 +0200
Message-ID: <20210907121816.37750-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210907121816.37750-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0815501442400958366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ftrace is a preferred and standard way to debug entering and exiting
functions so drop useless debug prints.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/pn533/i2c.c   | 1 -
 drivers/nfc/pn533/pn533.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
index e6bf8cfe3aa7..91d4a035eb63 100644
--- a/drivers/nfc/pn533/i2c.c
+++ b/drivers/nfc/pn533/i2c.c
@@ -138,7 +138,6 @@ static irqreturn_t pn533_i2c_irq_thread_fn(int irq, voi=
d *data)
 	}
 =

 	client =3D phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
 =

 	if (phy->hard_fault !=3D 0)
 		return IRQ_HANDLED;
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

--===============0815501442400958366==--

