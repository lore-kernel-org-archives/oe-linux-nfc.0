Content-Type: multipart/mixed; boundary="===============5826843353542475089=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 30/73] mifare: use proper format for integers (-Wformat)
Date: Mon, 19 Jul 2021 13:07:36 +0200
Message-ID: <20210719110819.27340-31-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5826843353542475089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    plugins/mifare.c: In function =E2=80=98mifare_read=E2=80=99:
    plugins/mifare.c:836:33: error: format =E2=80=98%d=E2=80=99 expects arg=
ument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=80=98unsig=
ned int=E2=80=99 [-Werror=3Dformat=3D]
      836 |   near_error("Mifare tag type [%d] not supported.", tgt_subtype=
);
          |                                ~^                   ~~~~~~~~~~~
          |                                 |                   |
          |                                 int                 unsigned int
          |                                %d

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/mifare.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/plugins/mifare.c b/plugins/mifare.c
index 3d376526735d..a4e4ba443995 100644
--- a/plugins/mifare.c
+++ b/plugins/mifare.c
@@ -833,7 +833,7 @@ int mifare_read(uint32_t adapter_idx, uint32_t target_i=
dx,
 	case NEAR_TAG_NFC_T2_MIFARE_CLASSIC_4K:
 		break;
 	default:
-		near_error("Mifare tag type [%d] not supported.", tgt_subtype);
+		near_error("Mifare tag type [%u] not supported.", tgt_subtype);
 		return -1;
 	}
 =

@@ -900,7 +900,7 @@ int mifare_check_presence(uint32_t adapter_idx, uint32_=
t target_idx,
 	case NEAR_TAG_NFC_T2_MIFARE_CLASSIC_4K:
 		break;
 	default:
-		near_error("Mifare tag type %d not supported.", tgt_subtype);
+		near_error("Mifare tag type %u not supported.", tgt_subtype);
 		return -1;
 	}
 =

@@ -1228,7 +1228,7 @@ static int writing_not_permitted(void *data)
 		}
 	}
 =

-	DBG("TAG writable sectors' size: [%d].", new_tag_size);
+	DBG("TAG writable sectors' size: [%u].", new_tag_size);
 =

 	/* Check if there's enough space on tag */
 	if (new_tag_size < mf_ck->ndef->length) {
@@ -1293,7 +1293,7 @@ int mifare_write(uint32_t adapter_idx, uint32_t targe=
t_idx,
 	case NEAR_TAG_NFC_T2_MIFARE_CLASSIC_4K:
 		break;
 	default:
-		near_error("Mifare tag type %d not supported.", tgt_subtype);
+		near_error("Mifare tag type %u not supported.", tgt_subtype);
 		return -1;
 	}
 =

-- =

2.27.0

--===============5826843353542475089==--

