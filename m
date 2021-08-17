Content-Type: multipart/mixed; boundary="===============4134567180324308238=="
MIME-Version: 1.0
From: bongsu.jeon2@gmail.com
To: linux-nfc@lists.01.org
Subject: [PATCH v2 net-next 5/8] selftests: nci: Fix the wrong condition
Date: Tue, 17 Aug 2021 06:28:15 -0700
Message-ID: <20210817132818.8275-6-bongsu.jeon2@gmail.com>
In-Reply-To: <20210817132818.8275-1-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4134567180324308238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Bongsu Jeon <bongsu.jeon@samsung.com>

memcpy should be executed only in case nla_len's value is greater than 0.

Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
---
 tools/testing/selftests/nci/nci_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftest=
s/nci/nci_dev.c
index cf47505a6b35..a1786cef73bc 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -110,7 +110,7 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __=
u32 nlmsg_pid,
 		na->nla_type =3D nla_type[cnt];
 		na->nla_len =3D nla_len[cnt] + NLA_HDRLEN;
 =

-		if (nla_len > 0)
+		if (nla_len[cnt] > 0)
 			memcpy(NLA_DATA(na), nla_data[cnt], nla_len[cnt]);
 =

 		prv_len =3D NLA_ALIGN(nla_len[cnt]) + NLA_HDRLEN;
-- =

2.32.0

--===============4134567180324308238==--

