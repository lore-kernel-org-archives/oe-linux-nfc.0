Content-Type: multipart/mixed; boundary="===============0425466358602981389=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH 0/7] nfc: llcp: fix and improvements
Date: Sat, 15 Jan 2022 13:26:43 +0100
Message-ID: <20220115122650.128182-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0425466358602981389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Patch #1:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Syzbot reported an easily reproducible NULL pointer dereference which I was
struggling to analyze:
https://syzkaller.appspot.com/bug?extid=3D7f23bcddf626e0593a39

Although direct fix is obvious, I could not actually find the exact race
condition scenario leading to it.  The patch fixes the issue - at least und=
er
my QEMU - however all this code looks racy, so I have a feeling I am plumbi=
ng
one leak without fixing root cause.

Therefore I would appreciate some more thoughts on first commit.

The rest of patches:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
These are improvements, rebased on top of #1, although should be independen=
t.
They do not fix any experienced issue, just look correct to me from the code
point of view.

Testing
=3D=3D=3D=3D=3D=3D=3D
Under QEMU only. The NFC/LLCP code was not really tested on a device.

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  nfc: llcp: fix NULL error pointer dereference on sendmsg() after
    failed bind()
  nfc: llcp: nullify llcp_sock->dev on connect() error paths
  nfc: llcp: simplify llcp_sock_connect() error paths
  nfc: llcp: use centralized exiting of bind on errors
  nfc: llcp: use test_bit()
  nfc: llcp: protect nfc_llcp_sock_unlink() calls
  nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is
    actually sent"

 net/nfc/llcp.h      |  1 -
 net/nfc/llcp_core.c |  9 +-------
 net/nfc/llcp_sock.c | 54 ++++++++++++++++++++++++---------------------
 3 files changed, 30 insertions(+), 34 deletions(-)

-- =

2.32.0

--===============0425466358602981389==--

