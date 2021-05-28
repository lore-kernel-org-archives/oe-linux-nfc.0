Content-Type: multipart/mixed; boundary="===============1057594243128100662=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 11/11] nfc: st95hf: fix indentation to tabs
Date: Fri, 28 May 2021 10:56:51 -0400
Message-ID: <20210528145651.125648-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528145330.125055-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1057594243128100662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use tabs to indent instead of spaces. No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st95hf/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 0d99181b6ce3..2dc788c363fd 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1057,8 +1057,8 @@ static const struct spi_device_id st95hf_id[] =3D {
 MODULE_DEVICE_TABLE(spi, st95hf_id);
 =

 static const struct of_device_id st95hf_spi_of_match[] __maybe_unused =3D {
-        { .compatible =3D "st,st95hf" },
-        { },
+	{ .compatible =3D "st,st95hf" },
+	{},
 };
 MODULE_DEVICE_TABLE(of, st95hf_spi_of_match);
 =

-- =

2.27.0

--===============1057594243128100662==--

