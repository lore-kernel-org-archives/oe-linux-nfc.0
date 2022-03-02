Content-Type: multipart/mixed; boundary="===============0633712360752035925=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [RESEND PATCH v2 0/6] nfc: llcp: few cleanups/improvements
Date: Wed, 02 Mar 2022 20:25:17 +0100
Message-ID: <20220302192523.57444-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0633712360752035925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

These are improvements, not fixing any experienced issue, just looking corr=
ect
to me from the code point of view.

Changes since v1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. Split from the fix.

Testing
=3D=3D=3D=3D=3D=3D=3D
Under QEMU only. The NFC/LLCP code was not really tested on a device.

Best regards,
Krzysztof

Krzysztof Kozlowski (6):
  nfc: llcp: nullify llcp_sock->dev on connect() error paths
  nfc: llcp: simplify llcp_sock_connect() error paths
  nfc: llcp: use centralized exiting of bind on errors
  nfc: llcp: use test_bit()
  nfc: llcp: protect nfc_llcp_sock_unlink() calls
  nfc: llcp: Revert "NFC: Keep socket alive until the DISC PDU is
    actually sent"

 net/nfc/llcp.h      |  1 -
 net/nfc/llcp_core.c |  9 +--------
 net/nfc/llcp_sock.c | 49 ++++++++++++++++++++++-----------------------
 3 files changed, 25 insertions(+), 34 deletions(-)

-- =

2.32.0

--===============0633712360752035925==--

