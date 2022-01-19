Content-Type: multipart/mixed; boundary="===============8338098369214616788=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 0/1] nfc: llcp: a fix after syzbot report
Date: Wed, 19 Jan 2022 08:48:15 +0100
Message-ID: <20220119074816.6505-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8338098369214616788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

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

Testing
=3D=3D=3D=3D=3D=3D=3D
Under QEMU only. The NFC/LLCP code was not really tested on a device.

Best regards,
Krzysztof

Krzysztof Kozlowski (1):
  nfc: llcp: fix NULL error pointer dereference on sendmsg() after
    failed bind()

 net/nfc/llcp_sock.c | 5 +++++
 1 file changed, 5 insertions(+)

-- =

2.32.0

--===============8338098369214616788==--

