Content-Type: multipart/mixed; boundary="===============4621999607913334106=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 5/6] nfc: llcp: protect nfc_llcp_sock_unlink() calls
Date: Wed, 19 Jan 2022 08:53:00 +0100
Message-ID: <20220119075301.7346-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220119075301.7346-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4621999607913334106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

nfc_llcp_sock_link() is called in all paths (bind/connect) as a last
action, still protected with lock_sock().  When cleaning up in
llcp_sock_release(), call nfc_llcp_sock_unlink() in a mirrored way:
earlier and still under the lock_sock().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 60985d1834a5..2d4cdce88a54 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -631,6 +631,11 @@ static int llcp_sock_release(struct socket *sock)
 		}
 	}
 =

+	if (sock->type =3D=3D SOCK_RAW)
+		nfc_llcp_sock_unlink(&local->raw_sockets, sk);
+	else
+		nfc_llcp_sock_unlink(&local->sockets, sk);
+
 	if (llcp_sock->reserved_ssap < LLCP_SAP_MAX)
 		nfc_llcp_put_ssap(llcp_sock->local, llcp_sock->ssap);
 =

@@ -643,11 +648,6 @@ static int llcp_sock_release(struct socket *sock)
 	if (sk->sk_state =3D=3D LLCP_DISCONNECTING)
 		return err;
 =

-	if (sock->type =3D=3D SOCK_RAW)
-		nfc_llcp_sock_unlink(&local->raw_sockets, sk);
-	else
-		nfc_llcp_sock_unlink(&local->sockets, sk);
-
 out:
 	sock_orphan(sk);
 	sock_put(sk);
-- =

2.32.0

--===============4621999607913334106==--

