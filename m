Content-Type: multipart/mixed; boundary="===============6158371908148183273=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 19/34] nfctype2: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:36 +0200
Message-ID: <20210711202351.18363-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6158371908148183273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from plugins/nfctype2.c:36:
    plugins/nfctype2.c: In function =E2=80=98data_recv=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 4 has type =E2=80=98ui=
nt32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    plugins/nfctype2.c:195:2: note: in expansion of macro =E2=80=98DBG=E2=
=80=99
      195 |  DBG("adapter %d", adapter_idx);
          |  ^~~

    plugins/nfctype2.c: In function =E2=80=98nfctype2_write=E2=80=99:
    plugins/nfctype2.c:458:43: error: format =E2=80=98%zd=E2=80=99 expects =
argument of type =E2=80=98signed size_t=E2=80=99, but argument 2 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
      458 |     near_error("Not enough space on tag %zd %zd",
          |                                         ~~^
          |                                           |
          |                                           long int
          |                                         %ld
      459 |       ndef->length,
          |       ~~~~~~~~~~~~
          |           |
          |           size_t {aka long unsigned int}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/nfctype2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/plugins/nfctype2.c b/plugins/nfctype2.c
index dec9615b69af..3618ca177363 100644
--- a/plugins/nfctype2.c
+++ b/plugins/nfctype2.c
@@ -192,7 +192,7 @@ static int data_recv(uint8_t *resp, int length, void *d=
ata)
 	cmd.cmd =3D CMD_READ;
 	cmd.block =3D DATA_BLOCK_START + tag->current_block;
 =

-	DBG("adapter %d", adapter_idx);
+	DBG("adapter %u", adapter_idx);
 =

 	return near_adapter_send(adapter_idx,
 				(uint8_t *) &cmd, CMD_READ_SIZE,
@@ -341,7 +341,7 @@ static int nfctype2_read(uint32_t adapter_idx,
 			cb, tgt_subtype);
 =

 	default:
-		DBG("Unknown Tag Type 2 subtype %d", tgt_subtype);
+		DBG("Unknown Tag Type 2 subtype %u", tgt_subtype);
 		return -1;
 	}
 }
@@ -455,7 +455,7 @@ static int nfctype2_write(uint32_t adapter_idx, uint32_=
t target_idx,
 		 */
 		if (near_tag_get_memory_layout(tag) =3D=3D NEAR_TAG_MEMORY_STATIC) {
 			if ((ndef->length + 3) > near_tag_get_data_length(tag)) {
-				near_error("Not enough space on tag %zd %zd",
+				near_error("Not enough space on tag %zu %zu",
 						ndef->length,
 						near_tag_get_data_length(tag));
 				err =3D -ENOSPC;
@@ -471,7 +471,7 @@ static int nfctype2_write(uint32_t adapter_idx, uint32_=
t target_idx,
 		return mifare_write(adapter_idx, target_idx, ndef,
 				cb, tgt_subtype);
 	default:
-		DBG("Unknown TAG Type 2 subtype %d", tgt_subtype);
+		DBG("Unknown TAG Type 2 subtype %u", tgt_subtype);
 		err =3D -EINVAL;
 		goto out_err;
 	}
@@ -533,7 +533,7 @@ static int nfctype2_check_presence(uint32_t adapter_idx=
, uint32_t target_idx,
 							cb, tgt_subtype);
 =

 	default:
-		DBG("Unknown TAG Type 2 subtype %d", tgt_subtype);
+		DBG("Unknown TAG Type 2 subtype %u", tgt_subtype);
 =

 		return -1;
 	}
@@ -586,7 +586,7 @@ static int nfctype2_format(uint32_t adapter_idx, uint32=
_t target_idx,
 	tgt_subtype =3D near_tag_get_subtype(adapter_idx, target_idx);
 =

 	if (tgt_subtype !=3D NEAR_TAG_NFC_T2_MIFARE_ULTRALIGHT) {
-		DBG("Unknown Tag Type 2 subtype %d", tgt_subtype);
+		DBG("Unknown Tag Type 2 subtype %u", tgt_subtype);
 		return -1;
 	}
 =

-- =

2.27.0

--===============6158371908148183273==--

