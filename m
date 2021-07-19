Content-Type: multipart/mixed; boundary="===============8293988398012979629=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 39/73] tag: use proper format for integers (-Wformat)
Date: Mon, 19 Jul 2021 13:07:45 +0200
Message-ID: <20210719110819.27340-40-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8293988398012979629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    src/tag.c: In function =E2=80=98near_tag_get_tag=E2=80=99:
    src/tag.c:99:33: error: format =E2=80=98%d=E2=80=99 expects argument of=
 type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=98uint32_t=E2=
=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       99 |  path =3D g_strdup_printf("%s/nfc%d/tag%d", NFC_PATH,
          |                                ~^
          |                                 |
          |                                 int
          |                                %d
      100 |      adapter_idx, target_idx);
          |      ~~~~~~~~~~~
          |      |
          |      uint32_t {aka unsigned int}

    In file included from src/near.h:36,
                     from src/tag.c:35:
    src/tag.c: In function =E2=80=98near_tag_set_nfcid=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%zd=E2=80=99 expects=
 argument of type =E2=80=98signed size_t=E2=80=99, but argument 4 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    src/tag.c:791:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
      791 |  DBG("NFCID len %zd", nfcid_len);
          |  ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 src/tag.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/tag.c b/src/tag.c
index 9eba4eefef35..520368b1552c 100644
--- a/src/tag.c
+++ b/src/tag.c
@@ -96,7 +96,7 @@ struct near_tag *near_tag_get_tag(uint32_t adapter_idx, u=
int32_t target_idx)
 	struct near_tag *tag;
 	char *path;
 =

-	path =3D g_strdup_printf("%s/nfc%d/tag%d", NFC_PATH,
+	path =3D g_strdup_printf("%s/nfc%u/tag%u", NFC_PATH,
 					adapter_idx, target_idx);
 	if (!path)
 		return NULL;
@@ -658,7 +658,7 @@ static int tag_initialize(struct near_tag *tag,
 {
 	DBG("");
 =

-	tag->path =3D g_strdup_printf("%s/nfc%d/tag%d", NFC_PATH,
+	tag->path =3D g_strdup_printf("%s/nfc%u/tag%u", NFC_PATH,
 					adapter_idx, target_idx);
 	if (!tag->path)
 		return -ENOMEM;
@@ -788,7 +788,7 @@ int near_tag_set_nfcid(uint32_t adapter_idx, uint32_t t=
arget_idx,
 {
 	struct near_tag *tag;
 =

-	DBG("NFCID len %zd", nfcid_len);
+	DBG("NFCID len %zu", nfcid_len);
 =

 	tag =3D near_tag_get_tag(adapter_idx, target_idx);
 	if (!tag)
@@ -881,7 +881,7 @@ int near_tag_add_records(struct near_tag *tag, GList *r=
ecords,
 	for (list =3D records; list; list =3D list->next) {
 		record =3D list->data;
 =

-		path =3D g_strdup_printf("%s/nfc%d/tag%d/record%d",
+		path =3D g_strdup_printf("%s/nfc%u/tag%u/record%u",
 					NFC_PATH, tag->adapter_idx,
 					tag->target_idx, tag->next_record);
 =

-- =

2.27.0

--===============8293988398012979629==--

