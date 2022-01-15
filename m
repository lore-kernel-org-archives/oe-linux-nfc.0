Content-Type: multipart/mixed; boundary="===============8709416094893419178=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 2/7] nfc: llcp: nullify llcp_sock->dev on connect() error paths
Date: Sat, 15 Jan 2022 13:26:45 +0100
Message-ID: <20220115122650.128182-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8709416094893419178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nullify the llcp_sock->dev on llcp_sock_connect() error paths,
symmetrically to the code llcp_sock_bind().  The non-NULL value of
llcp_sock->dev is used in a few places to check whether the socket is
still valid.

There was no particular issue observed with missing NULL assignment in
connect() error path, however an similar case - in the bind() error path
- was triggereable.  That one was fixed in commit 4ac06a1e013c ("nfc:
fix NULL ptr dereference in llcp_sock_getname() after failed connect"),
so the change here seems logical as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/llcp_sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 0b93a17b9f11..e92440c0c4c7 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -764,6 +764,7 @@ static int llcp_sock_connect(struct socket *sock, struc=
t sockaddr *_addr,
 	llcp_sock->local =3D NULL;
 =

 put_dev:
+	llcp_sock->dev =3D NULL;
 	nfc_put_device(dev);
 =

 error:
-- =

2.32.0

--===============8709416094893419178==--

