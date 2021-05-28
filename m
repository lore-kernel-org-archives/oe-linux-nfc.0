Content-Type: multipart/mixed; boundary="===============2505950448820958220=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 01/12] nfc: fdp: correct kerneldoc for structure
Date: Fri, 28 May 2021 08:41:49 -0400
Message-ID: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2505950448820958220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since structure comments are not kerneldoc, remove the double ** to fix
W=3D1 warnings:

    warning: This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index fe0719ed81a0..125d71c27b8b 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -149,7 +149,7 @@ static void fdp_nci_send_patch_cb(struct nci_dev *ndev)
 	wake_up(&info->setup_wq);
 }
 =

-/**
+/*
  * Register a packet sent counter and a callback
  *
  * We have no other way of knowing when all firmware packets were sent out
@@ -167,7 +167,7 @@ static void fdp_nci_set_data_pkt_counter(struct nci_dev=
 *ndev,
 	info->data_pkt_counter_cb =3D cb;
 }
 =

-/**
+/*
  * The device is expecting a stream of packets. All packets need to
  * have the PBF flag set to 0x0 (last packet) even if the firmware
  * file is segmented and there are multiple packets. If we give the
-- =

2.27.0

--===============2505950448820958220==--

