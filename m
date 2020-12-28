Content-Type: multipart/mixed; boundary="===============2410807435092507323=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next] net: nfc: nci: Change the NCI close sequence
Date: Mon, 28 Dec 2020 10:46:31 +0900
Message-ID: <20201228014631.5557-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2410807435092507323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

Change the NCI close sequence because the NCI Command timer should be
deleted after flushing the NCI command work queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 net/nfc/nci/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index e64727e1a72f..79bebf4b0796 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -579,11 +579,11 @@ static int nci_close_device(struct nci_dev *ndev)
 =

 	clear_bit(NCI_INIT, &ndev->flags);
 =

-	del_timer_sync(&ndev->cmd_timer);
-
 	/* Flush cmd wq */
 	flush_workqueue(ndev->cmd_wq);
 =

+	del_timer_sync(&ndev->cmd_timer);
+
 	/* Clear flags */
 	ndev->flags =3D 0;
 =

-- =

2.17.1

--===============2410807435092507323==--

