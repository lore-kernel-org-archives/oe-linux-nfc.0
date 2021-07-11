Content-Type: multipart/mixed; boundary="===============1155623332019510319=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 26/34] device: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:43 +0200
Message-ID: <20210711202351.18363-14-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1155623332019510319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    src/device.c: In function =E2=80=98near_device_get_device=E2=80=99:
    src/device.c:85:33: error: format =E2=80=98%d=E2=80=99 expects argument=
 of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=98uint32_t=
=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       85 |  path =3D g_strdup_printf("%s/nfc%d/device%d", NFC_PATH,
          |                                ~^
          |                                 |
          |                                 int
          |                                %d
       86 |      adapter_idx, target_idx);
          |      ~~~~~~~~~~~
          |      |
          |      uint32_t {aka unsigned int}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/device.c b/src/device.c
index a6598e0ddd28..aeae7d39a290 100644
--- a/src/device.c
+++ b/src/device.c
@@ -82,7 +82,7 @@ struct near_device *near_device_get_device(uint32_t adapt=
er_idx,
 =

 	DBG("");
 =

-	path =3D g_strdup_printf("%s/nfc%d/device%d", NFC_PATH,
+	path =3D g_strdup_printf("%s/nfc%u/device%u", NFC_PATH,
 					adapter_idx, target_idx);
 	if (!path)
 		return NULL;
@@ -305,7 +305,7 @@ int near_device_add_records(struct near_device *device,=
 GList *records,
 	for (list =3D records; list; list =3D list->next) {
 		record =3D list->data;
 =

-		path =3D g_strdup_printf("%s/nfc%d/device%d/record%d",
+		path =3D g_strdup_printf("%s/nfc%u/device%u/record%u",
 					NFC_PATH, device->adapter_idx,
 					device->target_idx, device->n_records);
 =

@@ -342,7 +342,7 @@ struct near_device *__near_device_add(uint32_t adapter_=
idx, uint32_t target_idx,
 	if (!device)
 		return NULL;
 =

-	device->path =3D g_strdup_printf("%s/nfc%d/device%d", NFC_PATH,
+	device->path =3D g_strdup_printf("%s/nfc%u/device%u", NFC_PATH,
 					adapter_idx, target_idx);
 	if (!device->path) {
 		g_free(device);
-- =

2.27.0

--===============1155623332019510319==--

