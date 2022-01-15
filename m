Content-Type: multipart/mixed; boundary="===============3264918214421230002=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 4/7] nfc: llcp: use centralized exiting of bind on errors
Date: Sat, 15 Jan 2022 13:26:47 +0100
Message-ID: <20220115122650.128182-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3264918214421230002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Coding style encourages centralized exiting of functions, so rewrite
llcp_sock_bind() error paths to use such pattern.  This reduces the
duplicated cleanup code, make success path visually shorter and also
cleans up the errors in proper order (in reversed way from
initialization).

No functional impact expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index fdf0856182c6..c9d5c427f035 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -108,21 +108,13 @@ static int llcp_sock_bind(struct socket *sock, struct=
 sockaddr *addr, int alen)
 					  llcp_sock->service_name_len,
 					  GFP_KERNEL);
 	if (!llcp_sock->service_name) {
-		nfc_llcp_local_put(llcp_sock->local);
-		llcp_sock->local =3D NULL;
-		llcp_sock->dev =3D NULL;
 		ret =3D -ENOMEM;
-		goto put_dev;
+		goto sock_llcp_put_local;
 	}
 	llcp_sock->ssap =3D nfc_llcp_get_sdp_ssap(local, llcp_sock);
 	if (llcp_sock->ssap =3D=3D LLCP_SAP_MAX) {
-		nfc_llcp_local_put(llcp_sock->local);
-		llcp_sock->local =3D NULL;
-		kfree(llcp_sock->service_name);
-		llcp_sock->service_name =3D NULL;
-		llcp_sock->dev =3D NULL;
 		ret =3D -EADDRINUSE;
-		goto put_dev;
+		goto free_service_name;
 	}
 =

 	llcp_sock->reserved_ssap =3D llcp_sock->ssap;
@@ -132,6 +124,19 @@ static int llcp_sock_bind(struct socket *sock, struct =
sockaddr *addr, int alen)
 	pr_debug("Socket bound to SAP %d\n", llcp_sock->ssap);
 =

 	sk->sk_state =3D LLCP_BOUND;
+	nfc_put_device(dev);
+	release_sock(sk);
+
+	return 0;
+
+free_service_name:
+	kfree(llcp_sock->service_name);
+	llcp_sock->service_name =3D NULL;
+
+sock_llcp_put_local:
+	nfc_llcp_local_put(llcp_sock->local);
+	llcp_sock->local =3D NULL;
+	llcp_sock->dev =3D NULL;
 =

 put_dev:
 	nfc_put_device(dev);
-- =

2.32.0

--===============3264918214421230002==--

