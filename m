Content-Type: multipart/mixed; boundary="===============8845446014974508838=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 12/16] snep-send: fix near_ndef_message memory leak
Date: Wed, 14 Jul 2021 13:05:14 +0200
Message-ID: <20210714110518.104655-13-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210714110518.104655-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8845446014974508838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The result of near_ndef_prepare_text_record() should be freed, otherwise
it leaks making ASAN and valgrind unhappy.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 tools/snep-send.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/snep-send.c b/tools/snep-send.c
index 5bb153210d30..53f53250b1ae 100644
--- a/tools/snep-send.c
+++ b/tools/snep-send.c
@@ -91,6 +91,7 @@ int main(int argc, char *argv[])
 	frame =3D g_try_malloc0(frame_length);
 	if (!frame) {
 		close(fd);
+		near_ndef_msg_free(ndef);
 		near_error("Could not allocate SNEP frame");
 		return -1;
 	}
@@ -100,6 +101,7 @@ int main(int argc, char *argv[])
 	frame->length =3D GUINT_TO_BE(ndef->length);
 =

 	memcpy(frame->ndef, ndef->data, ndef->length);
+	near_ndef_msg_free(ndef);
 =

 	len =3D send(fd, (uint8_t *)frame, frame_length, 0);
 	if (len < 0) {
-- =

2.27.0

--===============8845446014974508838==--

