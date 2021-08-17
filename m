Content-Type: multipart/mixed; boundary="===============1154938185703815013=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 4/8] selftests: nci: Fix the code for next nlattr offset
Date: Tue, 17 Aug 2021 06:28:14 -0700
Message-ID: <20210817132818.8275-5-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1154938185703815013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

nlattr could have a padding for 4 bytes alignment. So next nla's offset
should be calculated with a padding.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftest=
s/nci/nci_dev.c
index b4d85eeb5fd1..cf47505a6b35 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -113,8 +113,8 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __=
u32 nlmsg_pid,
 		if (nla_len > 0)
 			memcpy(NLA_DATA(na), nla_data[cnt], nla_len[cnt]);
 =

-		msg.n.nlmsg_len +=3D NLMSG_ALIGN(na->nla_len);
-		prv_len =3D na->nla_len;
+		prv_len =3D NLA_ALIGN(nla_len[cnt]) + NLA_HDRLEN;
+		msg.n.nlmsg_len +=3D prv_len;
 	}
 =

 	buf =3D (char *)&msg;
-- =

2.32.0

--===============1154938185703815013==--

