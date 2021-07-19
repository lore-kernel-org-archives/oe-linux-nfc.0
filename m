Content-Type: multipart/mixed; boundary="===============7785975588385998261=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH v2 56/73] unit: fix memory leaks in test-ndef-build
Date: Mon, 19 Jul 2021 13:08:02 +0200
Message-ID: <20210719110819.27340-57-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7785975588385998261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

test-ndef-build.c was not freeing the ndef records it got leading to
memory leaks.  Report by valgrind:

  (24 direct, 15 indirect) bytes in 1 blocks are definitely lost in loss re=
cord 24 of 38
    at 0x483ED99: calloc (in /usr/lib/x86_64-linux-gnu/valgrind/vgpreload_m=
emcheck-amd64-linux.so)
    by 0x11C176: ndef_message_alloc_complete.constprop.0 (ndef.c:1654)
    by 0x11FEC5: ndef_message_alloc (ndef.c:1760)
    by 0x11FEC5: near_ndef_prepare_text_record (ndef.c:3142)
    by 0x121676: test_ndef_text_build (test-ndef-build.c:63)
    by 0x48ECDCD: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ECBCA: ??? (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0.6600.1)
    by 0x48ED2B9: g_test_run_suite (in /usr/lib/x86_64-linux-gnu/libglib-2.=
0.so.0.6600.1)
    by 0x48ED2D4: g_test_run (in /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0=
.6600.1)
    by 0x10F5A1: main (test-ndef-build.c:113)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 unit/test-ndef-build.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/unit/test-ndef-build.c b/unit/test-ndef-build.c
index 44dce4bf9aef..54b502f4a40b 100644
--- a/unit/test-ndef-build.c
+++ b/unit/test-ndef-build.c
@@ -65,6 +65,8 @@ static void test_ndef_text_build(void)
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(text));
 	g_assert_cmpmem(ndef->data, ARRAY_SIZE(text), text, ARRAY_SIZE(text));
+
+	near_ndef_msg_free(ndef);
 }
 =

 static void test_ndef_wsc_with_passphrase_build(void)
@@ -76,6 +78,8 @@ static void test_ndef_wsc_with_passphrase_build(void)
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(wsc));
 	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc), wsc, ARRAY_SIZE(wsc));
+
+	near_ndef_msg_free(ndef);
 }
 =

 static void test_ndef_wsc_with_out_passphrase_build(void)
@@ -87,6 +91,8 @@ static void test_ndef_wsc_with_out_passphrase_build(void)
 	g_assert(ndef);
 	g_assert_cmpuint(ndef->length, =3D=3D, ARRAY_SIZE(wsc_wo));
 	g_assert_cmpmem(ndef->data, ARRAY_SIZE(wsc_wo), wsc_wo, ARRAY_SIZE(wsc_wo=
));
+
+	near_ndef_msg_free(ndef);
 }
 =

 static void test_ndef_wsc_with_out_ssid_build(void)
-- =

2.27.0

--===============7785975588385998261==--

