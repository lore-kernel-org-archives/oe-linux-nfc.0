Content-Type: multipart/mixed; boundary="===============0603367211507633560=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
Date: Tue, 19 Jan 2021 05:55:22 +0900
Message-ID: <20210118205522.317087-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0603367211507633560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Fix the code because NCI_CORE_INIT_CMD includes two parameters in NCI2.0
but there is no parameters in NCI1.x.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 net/nfc/nci/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index e64727e1a72f..02a1f13f0798 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -508,7 +508,7 @@ static int nci_open_device(struct nci_dev *ndev)
 		};
 		unsigned long opt =3D 0;
 =

-		if (!(ndev->nci_ver & NCI_VER_2_MASK))
+		if (ndev->nci_ver & NCI_VER_2_MASK)
 			opt =3D (unsigned long)&nci_init_v2_cmd;
 =

 		rc =3D __nci_request(ndev, nci_init_req, opt,
-- =

2.25.1

--===============0603367211507633560==--

