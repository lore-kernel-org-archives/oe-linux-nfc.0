Content-Type: multipart/mixed; boundary="===============2181748986144185199=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: [PATCH net-next v2] net: nfc: nci: Change the NCI close sequence
Date: Thu, 31 Dec 2020 11:59:26 +0900
Message-ID: <20201231025926.2889-1-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2181748986144185199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

If there is a NCI command in work queue after closing the NCI device at =

nci_unregister_device, The NCI command timer starts at flush_workqueue
function and then NCI command timeout handler would be called 5 second =

after flushing the NCI command work queue and destroying the queue.
At that time, the timeout handler would try to use NCI command work queue
that is destroyed already. it will causes the problem. To avoid this =

abnormal situation, change the sequence to prevent the NCI command timeout
handler from being called after destroying the NCI command work queue.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---

Changes in v2:
 - Change the commit message.

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

--===============2181748986144185199==--

