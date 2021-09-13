Content-Type: multipart/mixed; boundary="===============0300545085246796106=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [PATCH v2 02/15] nfc: do not break pr_debug() call into separate lines
Date: Mon, 13 Sep 2021 15:20:22 +0200
Message-ID: <20210913132035.242870-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210913132035.242870-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0300545085246796106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove unneeded line break between pr_debug and arguments.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 net/nfc/hci/llc_shdlc.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/net/nfc/hci/llc_shdlc.c b/net/nfc/hci/llc_shdlc.c
index 78b2ceb8ae6e..e90f70385813 100644
--- a/net/nfc/hci/llc_shdlc.c
+++ b/net/nfc/hci/llc_shdlc.c
@@ -201,8 +201,7 @@ static void llc_shdlc_reset_t2(struct llc_shdlc *shdlc,=
 int y_nr)
 			del_timer_sync(&shdlc->t2_timer);
 			shdlc->t2_active =3D false;
 =

-			pr_debug
-			    ("All sent frames acked. Stopped T2(retransmit)\n");
+			pr_debug("All sent frames acked. Stopped T2(retransmit)\n");
 		}
 	} else {
 		skb =3D skb_peek(&shdlc->ack_pending_q);
@@ -211,8 +210,7 @@ static void llc_shdlc_reset_t2(struct llc_shdlc *shdlc,=
 int y_nr)
 			  msecs_to_jiffies(SHDLC_T2_VALUE_MS));
 		shdlc->t2_active =3D true;
 =

-		pr_debug
-		    ("Start T2(retransmit) for remaining unacked sent frames\n");
+		pr_debug("Start T2(retransmit) for remaining unacked sent frames\n");
 	}
 }
 =

@@ -518,12 +516,11 @@ static void llc_shdlc_handle_send_queue(struct llc_sh=
dlc *shdlc)
 	unsigned long time_sent;
 =

 	if (shdlc->send_q.qlen)
-		pr_debug
-		    ("sendQlen=3D%d ns=3D%d dnr=3D%d rnr=3D%s w_room=3D%d unackQlen=3D%d=
\n",
-		     shdlc->send_q.qlen, shdlc->ns, shdlc->dnr,
-		     shdlc->rnr =3D=3D false ? "false" : "true",
-		     shdlc->w - llc_shdlc_w_used(shdlc->ns, shdlc->dnr),
-		     shdlc->ack_pending_q.qlen);
+		pr_debug("sendQlen=3D%d ns=3D%d dnr=3D%d rnr=3D%s w_room=3D%d unackQlen=
=3D%d\n",
+			 shdlc->send_q.qlen, shdlc->ns, shdlc->dnr,
+			 shdlc->rnr =3D=3D false ? "false" : "true",
+			 shdlc->w - llc_shdlc_w_used(shdlc->ns, shdlc->dnr),
+			 shdlc->ack_pending_q.qlen);
 =

 	while (shdlc->send_q.qlen && shdlc->ack_pending_q.qlen < shdlc->w &&
 	       (shdlc->rnr =3D=3D false)) {
@@ -641,8 +638,7 @@ static void llc_shdlc_sm_work(struct work_struct *work)
 		llc_shdlc_handle_send_queue(shdlc);
 =

 		if (shdlc->t1_active && timer_pending(&shdlc->t1_timer) =3D=3D 0) {
-			pr_debug
-			    ("Handle T1(send ack) elapsed (T1 now inactive)\n");
+			pr_debug("Handle T1(send ack) elapsed (T1 now inactive)\n");
 =

 			shdlc->t1_active =3D false;
 			r =3D llc_shdlc_send_s_frame(shdlc, S_FRAME_RR,
@@ -652,8 +648,7 @@ static void llc_shdlc_sm_work(struct work_struct *work)
 		}
 =

 		if (shdlc->t2_active && timer_pending(&shdlc->t2_timer) =3D=3D 0) {
-			pr_debug
-			    ("Handle T2(retransmit) elapsed (T2 inactive)\n");
+			pr_debug("Handle T2(retransmit) elapsed (T2 inactive)\n");
 =

 			shdlc->t2_active =3D false;
 =

-- =

2.30.2

--===============0300545085246796106==--

