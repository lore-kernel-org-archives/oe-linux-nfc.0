Content-Type: multipart/mixed; boundary="===============8338359026716699434=="
MIME-Version: 1.0
From: Lin Ma <linma@zju.edu.cn>
To: linux-nfc@lists.01.org
Subject: [PATCH] NFC: NULL out conn_info reference when conn is closed
Date: Wed, 13 Oct 2021 12:30:52 +0800
Message-ID: <20211013043052.16379-1-linma@zju.edu.cn>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8338359026716699434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The nci_core_conn_close_rsp_packet() function will release the conn_info
with given conn_id. However, this reference of this object may still held
by other places like ndev->rf_conn_info in routine:
.. -> nci_recv_frame()
     -> nci_rx_work()
       -> nci_rsp_packet()
         -> nci_rf_disc_rsp_packet()
           -> devm_kzalloc()
              ndev->rf_conn_info =3D conn_info;

or ndev->hci_dev->conn_info in routine:
.. -> nci_recv_frame()
     -> nci_rx_work()
       -> nci_rsp_packet()
         -> nci_core_conn_create_rsp_packet()
           -> devm_kzalloc()
              ndev->hci_dev->conn_info =3D conn_info;

If these two places are not NULL out, potential UAF can be exploited by
the attacker when emulating an UART NFC device. This patch compares the
deallocating object with the two places and writes NULL to prevent that.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/nfc/nci/rsp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/nfc/nci/rsp.c b/net/nfc/nci/rsp.c
index a2e72c003805..99de76e5e855 100644
--- a/net/nfc/nci/rsp.c
+++ b/net/nfc/nci/rsp.c
@@ -334,6 +334,14 @@ static void nci_core_conn_close_rsp_packet(struct nci_=
dev *ndev,
 							 ndev->cur_conn_id);
 		if (conn_info) {
 			list_del(&conn_info->list);
+			/* Other places held conn_info like
+			 * ndev->hci_dev->conn_info, ndev->rf_conn_info
+			 * need to be NULL out.
+			 */
+			if (ndev->hci_dev->conn_info =3D=3D conn_info)
+				ndev->hci_dev->conn_info =3D NULL;
+			if (ndev->rf_conn_info =3D=3D conn_info)
+				ndev->rf_conn_info =3D NULL;
 			devm_kfree(&ndev->nfc_dev->dev, conn_info);
 		}
 	}
-- =

2.33.0

--===============8338359026716699434==--

