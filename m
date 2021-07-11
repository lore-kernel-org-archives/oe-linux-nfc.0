Content-Type: multipart/mixed; boundary="===============7383588421825283893=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 23/34] p2p: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:40 +0200
Message-ID: <20210711202351.18363-11-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7383588421825283893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from plugins/p2p.c:38:
    plugins/p2p.c: In function =E2=80=98p2p_listener_event=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 4 has type =E2=80=98__=
u32=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    plugins/p2p.c:261:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
      261 |  DBG("target idx %d", client_addr.target_idx);
          |  ^~~

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 plugins/p2p.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/plugins/p2p.c b/plugins/p2p.c
index 13702ade3e14..cf3e0accaf33 100644
--- a/plugins/p2p.c
+++ b/plugins/p2p.c
@@ -256,9 +256,9 @@ static gboolean p2p_listener_event(GIOChannel *channel,=
 GIOCondition condition,
 		return FALSE;
 	}
 =

-	DBG("client dsap %d ssap %d",
+	DBG("client dsap %u ssap %u",
 		client_addr.dsap, client_addr.ssap);
-	DBG("target idx %d", client_addr.target_idx);
+	DBG("target idx %u", client_addr.target_idx);
 =

 	client_data =3D g_try_malloc0(sizeof(struct p2p_data));
 	if (!client_data) {
-- =

2.27.0

--===============7383588421825283893==--

