Content-Type: multipart/mixed; boundary="===============7833306063690067749=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 15/16] nfctype5: fix returning uninitialized stack value in t5_tag_is_ti_pro()
Date: Sat, 10 Jul 2021 05:38:58 +0200
Message-ID: <20210710033859.3989-16-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7833306063690067749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The return value was not initialized so if tag was not matching, random
stack value (usually true) was returned instead of false.

This fixes clang warning:

    plugins/nfctype5.c:257:6: error: variable 'ret' is used uninitialized w=
henever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
            if ((uid[5] =3D=3D 0xc4) || (uid[5] =3D=3D 0xc5))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    plugins/nfctype5.c:261:9: note: uninitialized use occurs here
            return ret;
                   ^~~
    plugins/nfctype5.c:257:2: note: remove the 'if' if its condition is alw=
ays true
            if ((uid[5] =3D=3D 0xc4) || (uid[5] =3D=3D 0xc5))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    plugins/nfctype5.c:248:10: note: initialize the variable 'ret' to silen=
ce this warning
            bool ret;
                    ^
                     =3D false

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/nfctype5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/nfctype5.c b/plugins/nfctype5.c
index 3d2cdf030d4f..b7d240e519be 100644
--- a/plugins/nfctype5.c
+++ b/plugins/nfctype5.c
@@ -245,7 +245,7 @@ static bool t5_tag_is_ti_std(struct near_tag *tag)
 static bool t5_tag_is_ti_pro(struct near_tag *tag)
 {
 	uint8_t *uid;
-	bool ret;
+	bool ret =3D false;
 =

 	uid =3D near_tag_get_iso15693_uid(near_tag_get_adapter_idx(tag),
 					near_tag_get_target_idx(tag));
-- =

2.27.0

--===============7833306063690067749==--

