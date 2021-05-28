Content-Type: multipart/mixed; boundary="===============1341160521890981135=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 12/12] nfc: st95hf: mark ACPI and OF device ID tables as maybe unused
Date: Fri, 28 May 2021 08:42:00 -0400
Message-ID: <20210528124200.79655-12-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210528124200.79655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1341160521890981135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The driver can match either via OF or ACPI ID tables.  If one
configuration is disabled, the table will be unused:

    drivers/nfc/st95hf/core.c:1059:34: warning:
        =E2=80=98st95hf_spi_of_match=E2=80=99 defined but not used [-Wunuse=
d-const-variable=3D]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/st95hf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 88924be8decb..0d99181b6ce3 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1056,7 +1056,7 @@ static const struct spi_device_id st95hf_id[] =3D {
 };
 MODULE_DEVICE_TABLE(spi, st95hf_id);
 =

-static const struct of_device_id st95hf_spi_of_match[] =3D {
+static const struct of_device_id st95hf_spi_of_match[] __maybe_unused =3D {
         { .compatible =3D "st,st95hf" },
         { },
 };
-- =

2.27.0

--===============1341160521890981135==--

