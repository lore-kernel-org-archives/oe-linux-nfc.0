Content-Type: multipart/mixed; boundary="===============0322755419179548849=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH v2 2/6] nfc: llcp: simplify llcp_sock_connect() error paths
Date: Wed, 02 Mar 2022 20:25:19 +0100
Message-ID: <20220302192523.57444-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0322755419179548849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The llcp_sock_connect() error paths were using a mixed way of central
exit (goto) and cleanup

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index e92440c0c4c7..fdf0856182c6 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -712,10 +712,8 @@ static int llcp_sock_connect(struct socket *sock, stru=
ct sockaddr *_addr,
 	llcp_sock->local =3D nfc_llcp_local_get(local);
 	llcp_sock->ssap =3D nfc_llcp_get_local_ssap(local);
 	if (llcp_sock->ssap =3D=3D LLCP_SAP_MAX) {
-		nfc_llcp_local_put(llcp_sock->local);
-		llcp_sock->local =3D NULL;
 		ret =3D -ENOMEM;
-		goto put_dev;
+		goto sock_llcp_put_local;
 	}
 =

 	llcp_sock->reserved_ssap =3D llcp_sock->ssap;
@@ -760,11 +758,13 @@ static int llcp_sock_connect(struct socket *sock, str=
uct sockaddr *_addr,
 =

 sock_llcp_release:
 	nfc_llcp_put_ssap(local, llcp_sock->ssap);
+
+sock_llcp_put_local:
 	nfc_llcp_local_put(llcp_sock->local);
 	llcp_sock->local =3D NULL;
+	llcp_sock->dev =3D NULL;
 =

 put_dev:
-	llcp_sock->dev =3D NULL;
 	nfc_put_device(dev);
 =

 error:
-- =

2.32.0

--===============0322755419179548849==--

