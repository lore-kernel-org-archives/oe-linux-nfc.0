Content-Type: multipart/mixed; boundary="===============3571736309817162475=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v3 0/7] nfc: constify pointed data - missed part
Date: Fri, 30 Jul 2021 16:41:55 +0200
Message-ID: <20210730144202.255890-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3571736309817162475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

This was previously sent [1] but got lost. It was a prerequisite to part tw=
o of NFC const [2].

Changes since v2:
1. Drop patch previously 7/8 which cases new warnings "warning: Using
   plain integer as NULL pointer".

Changes since v1:
1. Add patch 1/8 fixing up nfcmrvl_spi_parse_dt()

[1] https://lore.kernel.org/lkml/20210726145224.146006-1-krzysztof.kozlowsk=
i(a)canonical.com/
[2] https://lore.kernel.org/linux-nfc/20210729104022.47761-1-krzysztof.kozl=
owski(a)canonical.com/T/#m199fbdde180fa005a10addf28479fcbdc6263eab

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  nfc: mrvl: correct nfcmrvl_spi_parse_dt() device_node argument
  nfc: annotate af_nfc_exit() as __exit
  nfc: hci: annotate nfc_llc_init() as __init
  nfc: constify several pointers to u8, char and sk_buff
  nfc: constify local pointer variables
  nfc: nci: constify several pointers to u8, sk_buff and other structs
  nfc: hci: cleanup unneeded spaces

 drivers/nfc/nfcmrvl/spi.c  |  2 +-
 drivers/nfc/pn544/pn544.c  |  4 +-
 include/net/nfc/nci_core.h | 14 +++---
 include/net/nfc/nfc.h      |  4 +-
 net/nfc/af_nfc.c           |  2 +-
 net/nfc/core.c             |  6 +--
 net/nfc/hci/core.c         |  8 ++--
 net/nfc/hci/llc.c          |  2 +-
 net/nfc/hci/llc_shdlc.c    | 10 ++---
 net/nfc/llcp.h             |  8 ++--
 net/nfc/llcp_commands.c    | 46 +++++++++++---------
 net/nfc/llcp_core.c        | 44 ++++++++++---------
 net/nfc/nci/core.c         | 48 +++++++++++----------
 net/nfc/nci/data.c         | 12 +++---
 net/nfc/nci/hci.c          | 38 ++++++++---------
 net/nfc/nci/ntf.c          | 87 ++++++++++++++++++++------------------
 net/nfc/nci/rsp.c          | 48 +++++++++++----------
 net/nfc/nci/spi.c          |  2 +-
 net/nfc/netlink.c          |  2 +-
 net/nfc/nfc.h              |  2 +-
 20 files changed, 206 insertions(+), 183 deletions(-)

-- =

2.27.0

--===============3571736309817162475==--

