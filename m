Content-Type: multipart/mixed; boundary="===============7023795003475663703=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 03/12] nfc: port100: correct kerneldoc for structure
Date: Fri, 28 May 2021 08:41:51 -0400
Message-ID: <20210528124200.79655-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7023795003475663703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The port100_in_rf_setting structure does not contain valid kerneldoc
docummentation, unlike the port100_tg_rf_setting structure.  Correct the
kerneldoc to fix W=3D1 warnings:

    warning: This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/port100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 8e4d355dc3ae..4df926cc37d0 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -94,7 +94,7 @@ struct port100;
 typedef void (*port100_send_async_complete_t)(struct port100 *dev, void *a=
rg,
 					      struct sk_buff *resp);
 =

-/**
+/*
  * Setting sets structure for in_set_rf command
  *
  * @in_*_set_number: Represent the entry indexes in the port-100 RF Base T=
able.
@@ -145,7 +145,7 @@ static const struct port100_in_rf_setting in_rf_setting=
s[] =3D {
 };
 =

 /**
- * Setting sets structure for tg_set_rf command
+ * struct port100_tg_rf_setting - Setting sets structure for tg_set_rf com=
mand
  *
  * @tg_set_number: Represents the entry index in the port-100 RF Base Tabl=
e.
  *                 This table contains multiple RF setting sets required f=
or RF
-- =

2.27.0

--===============7023795003475663703==--

