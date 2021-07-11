Content-Type: multipart/mixed; boundary="===============5219754325308576539=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 20/34] nfctype3: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:37 +0200
Message-ID: <20210711202351.18363-8-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5219754325308576539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from plugins/nfctype3.c:36:
    plugins/nfctype3.c: In function =E2=80=98data_recv=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%zd=E2=80=99 expects=
 argument of type =E2=80=98signed size_t=E2=80=99, but argument 4 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    plugins/nfctype3.c:249:3: note: in expansion of macro =E2=80=98DBG=E2=
=80=99
      249 |   DBG("Done reading %zd bytes at %p", data_length, nfc_data);
          |   ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/nfctype3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/nfctype3.c b/plugins/nfctype3.c
index d4fbed0dfc2f..c0502f15d9f2 100644
--- a/plugins/nfctype3.c
+++ b/plugins/nfctype3.c
@@ -246,7 +246,7 @@ static int data_recv(uint8_t *resp, int length, void *d=
ata)
 =

 		tag->current_block =3D 0;
 =

-		DBG("Done reading %zd bytes at %p", data_length, nfc_data);
+		DBG("Done reading %zu bytes at %p", data_length, nfc_data);
 		records =3D near_ndef_parse_msg(nfc_data, data_length, NULL);
 		near_tag_add_records(tag->tag, records, tag->cb, 0);
 =

-- =

2.27.0

--===============5219754325308576539==--

