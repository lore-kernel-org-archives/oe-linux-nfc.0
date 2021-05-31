Content-Type: multipart/mixed; boundary="===============8435417804484596251=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH] nfc: fix NULL ptr dereference in llcp_sock_getname() after failed connect
Date: Mon, 31 May 2021 09:21:38 +0200
Message-ID: <20210531072138.5219-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8435417804484596251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

It's possible to trigger NULL pointer dereference by local unprivileged
user, when calling getsockname() after failed bind() (e.g. the bind
fails because LLCP_SAP_MAX used as SAP):

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  CPU: 1 PID: 426 Comm: llcp_sock_getna Not tainted 5.13.0-rc2-next-2021052=
1+ #9
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1 04/0=
1/2014
  Call Trace:
   llcp_sock_getname+0xb1/0xe0
   __sys_getpeername+0x95/0xc0
   ? lockdep_hardirqs_on_prepare+0xd5/0x180
   ? syscall_enter_from_user_mode+0x1c/0x40
   __x64_sys_getpeername+0x11/0x20
   do_syscall_64+0x36/0x70
   entry_SYSCALL_64_after_hwframe+0x44/0xae

This can be reproduced with Syzkaller C repro (bind followed by
getpeername):
https://syzkaller.appspot.com/x/repro.c?x=3D14def446e00000

Cc: <stable@vger.kernel.org>
Fixes: d646960f7986 ("NFC: Initial LLCP support")
Reported-by: syzbot+80fb126e7f7d8b1a5914(a)syzkaller.appspotmail.com
Reported-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Not extensively tested yet but fixes this particular issue.

Reason for resend:
1. Keep it public.
---
 net/nfc/llcp_sock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 53dbe733f998..6cfd30fc0798 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -110,6 +110,7 @@ static int llcp_sock_bind(struct socket *sock, struct s=
ockaddr *addr, int alen)
 	if (!llcp_sock->service_name) {
 		nfc_llcp_local_put(llcp_sock->local);
 		llcp_sock->local =3D NULL;
+		llcp_sock->dev =3D NULL;
 		ret =3D -ENOMEM;
 		goto put_dev;
 	}
@@ -119,6 +120,7 @@ static int llcp_sock_bind(struct socket *sock, struct s=
ockaddr *addr, int alen)
 		llcp_sock->local =3D NULL;
 		kfree(llcp_sock->service_name);
 		llcp_sock->service_name =3D NULL;
+		llcp_sock->dev =3D NULL;
 		ret =3D -EADDRINUSE;
 		goto put_dev;
 	}
-- =

2.27.0

--===============8435417804484596251==--

