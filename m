Content-Type: multipart/mixed; boundary="===============6201065531825576316=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 33/73] npp: use proper format for integers (-Wformat)
Date: Mon, 19 Jul 2021 13:07:39 +0200
Message-ID: <20210719110819.27340-34-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6201065531825576316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from plugins/npp.c:36:
    plugins/npp.c: In function =E2=80=98npp_push=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%zd=E2=80=99 expects=
 argument of type =E2=80=98signed size_t=E2=80=99, but argument 4 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    plugins/npp.c:185:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
      185 |  DBG("Sending %zd bytes", frame_length);
          |  ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/npp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/npp.c b/plugins/npp.c
index 6bed302b4a8f..5c9d2e0cd003 100644
--- a/plugins/npp.c
+++ b/plugins/npp.c
@@ -182,7 +182,7 @@ static int npp_push(int fd, uint32_t adapter_idx, uint3=
2_t target_idx,
 	entry->ndef_length =3D GINT_TO_BE(ndef->length);
 	memcpy(entry->ndef, ndef->data, ndef->length);
 =

-	DBG("Sending %zd bytes", frame_length);
+	DBG("Sending %zu bytes", frame_length);
 =

 	err =3D send(fd, frame, frame_length, MSG_DONTWAIT);
 =

-- =

2.27.0

--===============6201065531825576316==--

