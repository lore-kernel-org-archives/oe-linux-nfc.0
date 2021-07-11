Content-Type: multipart/mixed; boundary="===============3495469260668207557=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 30/34] se: use proper format for integers (-Wformat)
Date: Sun, 11 Jul 2021 22:23:47 +0200
Message-ID: <20210711202351.18363-18-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210711202102.18094-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3495469260668207557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Properly print signed and unsigned integers.  This fixes warnings like:

    In file included from se/plugins/nfc.c:37:
    se/plugins/nfc.c: In function =E2=80=98nfc_netlink_event_se=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%d=E2=80=99 expects =
argument of type =E2=80=98int=E2=80=99, but argument 4 has type =E2=80=98ui=
nt32_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    se/plugins/nfc.c:200:2: note: in expansion of macro =E2=80=98DBG=E2=80=
=99
      200 |  DBG("NFC %d SE %d", nfc_idx, se_idx);
          |  ^~~

    se/plugins/nfc.c:270:2: note: in expansion of macro =E2=80=98DBG=E2=80=
=99
      270 |  DBG("NFC %d SE %d APDU len %zd", nfc_idx, se_idx, apdu_len);
          |  ^~~
    ./include/near/log.h:45:14: error: format =E2=80=98%zd=E2=80=99 expects=
 argument of type =E2=80=98signed size_t=E2=80=99, but argument 6 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~

    In file included from se/../src/near.h:36,
                     from se/seel.h:29,
                     from se/se.c:34:
    se/se.c: In function =E2=80=98io_cb=E2=80=99:
    ./include/near/log.h:45:14: error: format =E2=80=98%zd=E2=80=99 expects=
 argument of type =E2=80=98signed size_t=E2=80=99, but argument 4 has type =
=E2=80=98size_t=E2=80=99 {aka =E2=80=98long unsigned int=E2=80=99} [-Werror=
=3Dformat=3D]
       45 |   near_debug("%s:%s() " fmt, \
          |              ^~~~~~~~~~
    se/se.c:119:2: note: in expansion of macro =E2=80=98DBG=E2=80=99
      119 |  DBG("%zd %d", apdu_length, err);
          |  ^~~
    se/se.c: In function =E2=80=98se_path=E2=80=99:
    se/se.c:250:43: error: format =E2=80=98%d=E2=80=99 expects argument of =
type =E2=80=98int=E2=80=99, but argument 6 has type =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} [-Werror=3Dformat=3D]
      250 |  return g_strdup_printf("%s/se/%s%d_%s_se%d", SEEL_PATH,
          |                                          ~^
          |                                           |
          |                                           int
          |                                          %d
      251 |      ctrl, ctrl_idx, type, se_idx);
          |                            ~~~~~~
          |                            |
          |                            uint32_t {aka unsigned int}

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 se/ace.c           | 34 +++++++++++++++++-----------------
 se/apdu.c          |  8 ++++----
 se/plugins/nfc.c   |  8 ++++----
 se/plugins/tizen.c |  2 +-
 se/se.c            |  6 +++---
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/se/ace.c b/se/ace.c
index ef0e7e15fbf7..f8d492f423af 100644
--- a/se/ace.c
+++ b/se/ace.c
@@ -126,7 +126,7 @@ static void dump_rule(gpointer data, gpointer user_data)
 		for (i =3D 0; i < rule->aid_len; i++)
 			sprintf(aid + (3 * i), "%02X ", rule->aid[i]);
 		aid[3 * i] =3D 0;
-		DBG("  AID [%zd]: %s", rule->aid_len, aid);
+		DBG("  AID [%zu]: %s", rule->aid_len, aid);
 	}
 =

 	if (rule->hash_len =3D=3D 0) {
@@ -135,7 +135,7 @@ static void dump_rule(gpointer data, gpointer user_data)
 		for (i =3D 0; i < rule->hash_len; i++)
 			sprintf(hash + (3 * i), "%02X ", rule->hash[i]);
 		hash[3 * i] =3D 0;
-		DBG("  Hash [%zd]: %s", rule->hash_len, hash);
+		DBG("  Hash [%zu]: %s", rule->hash_len, hash);
 	}
 =

 	if (rule->apdu_rules_len =3D=3D 1) {
@@ -159,7 +159,7 @@ static void dump_rule(gpointer data, gpointer user_data)
 		n_rules =3D rule->apdu_rules_len /
 				sizeof(struct seel_ace_apdu_rule);
 =

-		DBG("  APDU rules (%zd)", n_rules);
+		DBG("  APDU rules (%zu)", n_rules);
 		for (i =3D 0; i < n_rules; i++) {
 			header =3D (uint8_t *)&apdu_rule->header;
 			mask =3D (uint8_t *)&apdu_rule->mask;
@@ -197,7 +197,7 @@ static int build_ref(struct seel_ace_rule *ace_rule,
 		switch (rule_ptr[0]) {
 		case AID_REF_DO:
 			do_length =3D rule_ptr[1];
-			DBG("AID_REF_DO %zd", do_length);
+			DBG("AID_REF_DO %zu", do_length);
 			rule_ptr +=3D 2;
 =

 			if (remaining < do_length)
@@ -216,7 +216,7 @@ static int build_ref(struct seel_ace_rule *ace_rule,
 =

 		case HASH_REF_DO:
 			do_length =3D rule_ptr[1];
-			DBG("HASH_REF_DO %zd", do_length);
+			DBG("HASH_REF_DO %zu", do_length);
 			rule_ptr +=3D 2;
 =

 			if (remaining < do_length)
@@ -254,7 +254,7 @@ static int build_ar(struct seel_ace_rule *ace_rule,
 		switch (rule_ptr[0]) {
 		case APDU_AR_DO:
 			do_length =3D rule_ptr[1];
-			DBG("APDU_AR_DO %zd", do_length);
+			DBG("APDU_AR_DO %zu", do_length);
 			rule_ptr +=3D 2;
 =

 			if (remaining < do_length)
@@ -274,7 +274,7 @@ static int build_ar(struct seel_ace_rule *ace_rule,
 =

 		case NFC_AR_DO:
 			do_length =3D rule_ptr[1];
-			DBG("NFC_AR_DO %zd", do_length);
+			DBG("NFC_AR_DO %zu", do_length);
 			rule_ptr +=3D 2;
 =

 			if (do_length !=3D 1)
@@ -316,7 +316,7 @@ static struct seel_ace_rule *build_rule(struct seel_ace=
 *ace,
 		switch (rule_ptr[0]) {
 		case REF_DO:
 			do_length =3D rule_ptr[1];
-			DBG("REF_DO %zd", do_length);
+			DBG("REF_DO %zu", do_length);
 			rule_ptr +=3D 2;
 =

 			err =3D build_ref(ace_rule, rule_ptr, do_length);
@@ -330,7 +330,7 @@ static struct seel_ace_rule *build_rule(struct seel_ace=
 *ace,
 =

 		case AR_DO:
 			do_length =3D rule_ptr[1];
-			DBG("AR_DO %zd", do_length);
+			DBG("AR_DO %zu", do_length);
 			rule_ptr +=3D 2;
 =

 			err =3D build_ar(ace_rule, rule_ptr, do_length);
@@ -378,7 +378,7 @@ static int build_ace_rules(struct seel_ace *ace,
 		remaining -=3D ref_ar_do_length + 2;
 		rule_ptr +=3D 2;
 =

-		DBG("REF_AR_DO %zd bytes", ref_ar_do_length);
+		DBG("REF_AR_DO %zu bytes", ref_ar_do_length);
 =

 		rule =3D build_rule(ace, rule_ptr, ref_ar_do_length);
 		if (!rule) {
@@ -412,7 +412,7 @@ static int ace_rule_length(uint8_t *apdu, size_t apdu_l=
ength,
 	if (length & 0x80) {
 		size_t _length =3D length & 0x7f, i, base;
 =

-		DBG("%zd", _length);
+		DBG("%zu", _length);
 =

 		if (apdu_length < 3 + _length)
 			return -EINVAL;
@@ -441,7 +441,7 @@ static void get_next_gp_data_cb(void *context,
 	struct seel_ace *ace  =3D context;
 	size_t payload_length;
 =

-	DBG("Current %zd Total %zd Got %zd",
+	DBG("Current %zu Total %zu Got %zu",
 		ace->current_rules_length, ace->rules_length, apdu_length);
 =

 	if (err)
@@ -523,7 +523,7 @@ static void get_all_gp_data_cb(void *context,
 	payload_length =3D apdu_length - GET_ALL_DATA_CMD_LEN -
 					length_length - APDU_STATUS_LEN;
 =

-	DBG("Received %zd bytes of payload", payload_length);
+	DBG("Received %zu bytes of payload", payload_length);
 =

 	if (payload_length < (size_t)rule_length) {
 		ace->rules_length =3D rule_length;
@@ -655,7 +655,7 @@ static struct seel_ace_rule *find_specific_rule(struct =
seel_ace *ace,
 {
 	GSList *list;
 =

-	DBG("%zd", aid_len);
+	DBG("%zu", aid_len);
 =

 	if (!hash || !aid)
 		return false;
@@ -684,7 +684,7 @@ static bool find_specific_rule_for_aid(struct seel_ace =
*ace,
 {
 	GSList *list;
 =

-	DBG("%zd", aid_len);
+	DBG("%zu", aid_len);
 =

 	if (!aid)
 		return false;
@@ -713,7 +713,7 @@ static struct seel_ace_rule *find_generic_rule_for_aid(=
struct seel_ace *ace,
 {
 	GSList *list;
 =

-	DBG("%zd", aid_len);
+	DBG("%zu", aid_len);
 =

 	if (!aid)
 		return false;
@@ -833,7 +833,7 @@ bool __seel_ace_apdu_allowed(struct seel_channel *chann=
el, uint8_t *hash,
 	uint8_t *aid;
 	size_t aid_len;
 =

-	DBG("%zd", apdu_len);
+	DBG("%zu", apdu_len);
 =

 	/* XXX Do we need to do some filtering on the basic channel ?*/
 	if (__seel_channel_is_basic(channel))
diff --git a/se/apdu.c b/se/apdu.c
index f5ba28f8046c..fe0e6319732b 100644
--- a/se/apdu.c
+++ b/se/apdu.c
@@ -131,7 +131,7 @@ struct seel_apdu *__seel_apdu_build(uint8_t *apdu, size=
_t length, uint8_t channe
 	}
 =

 	if (channel > 3) {
-		DBG("Invalid channel number %d", channel);
+		DBG("Invalid channel number %u", channel);
 		channel =3D 0;
 	}
 =

@@ -159,7 +159,7 @@ void __seel_apdu_dump(uint8_t *apdu, size_t length)
 		sprintf(str + (3 * i), "%02X ", apdu[i]);
 	str[3 * length] =3D 0;
 =

-	DBG("[%zd] %s", length, str);
+	DBG("[%zu] %s", length, str);
 =

 	g_free(str);
 }
@@ -188,7 +188,7 @@ struct seel_apdu *__seel_apdu_open_logical_channel(void)
 =

 struct seel_apdu *__seel_apdu_close_logical_channel(uint8_t channel)
 {
-	DBG("%d", channel);
+	DBG("%u", channel);
 =

 	return alloc_apdu(CLA_CHANNEL_STANDARD, 0, INS_MANAGE_CHANNEL, 0x80,
 							channel, 0, NULL, -1);
@@ -197,7 +197,7 @@ struct seel_apdu *__seel_apdu_close_logical_channel(uin=
t8_t channel)
 struct seel_apdu *__seel_apdu_select_aid(uint8_t channel,
 						uint8_t *aid, size_t aid_length)
 {
-	DBG("%zd", aid_length);
+	DBG("%zu", aid_length);
 =

 	if (aid_length < MIN_AID_LENGTH ||
 			aid_length > MAX_AID_LENGTH)
diff --git a/se/plugins/nfc.c b/se/plugins/nfc.c
index 75aba3b072f7..e2f54126119f 100644
--- a/se/plugins/nfc.c
+++ b/se/plugins/nfc.c
@@ -197,7 +197,7 @@ static int nfc_netlink_event_se(struct genlmsghdr *gnlh=
, bool add)
 	nfc_idx =3D nla_get_u32(attrs[NFC_ATTR_DEVICE_INDEX]);
 	se_idx =3D nla_get_u32(attrs[NFC_ATTR_SE_INDEX]);
 =

-	DBG("NFC %d SE %d", nfc_idx, se_idx);
+	DBG("NFC %u SE %u", nfc_idx, se_idx);
 =

 	if (add) {
 		uint8_t se_type, seel_se_type;
@@ -209,7 +209,7 @@ static int nfc_netlink_event_se(struct genlmsghdr *gnlh=
, bool add)
 =

 		se_type =3D nla_get_u8(attrs[NFC_ATTR_SE_TYPE]);
 		seel_se_type =3D nfc_se_type(se_type);
-		DBG("NFC SE type %d %d", se_type, seel_se_type);
+		DBG("NFC SE type %u %u", se_type, seel_se_type);
 =

 		return seel_manager_se_add(se_idx, nfc_idx, seel_se_type,
 						SEEL_CONTROLLER_NFC);
@@ -267,7 +267,7 @@ static int nfc_netlink_event_io(struct genlmsghdr *gnlh)
 		goto out;
 	}
 =

-	DBG("NFC %d SE %d APDU len %zd", nfc_idx, se_idx, apdu_len);
+	DBG("NFC %u SE %u APDU len %zu", nfc_idx, se_idx, apdu_len);
 =

 	nfc_state->ctx->cb(nfc_state->ctx->context, apdu, apdu_len, 0);
 =

@@ -550,7 +550,7 @@ static int nfc_transceive(uint8_t ctrl_idx, uint32_t se=
_idx,
 	void *hdr;
 	int err;
 =

-	DBG("%zd APDU %p", apdu_length, apdu);
+	DBG("%zu APDU %p", apdu_length, apdu);
 =

 	if (nfc_state->ctx)
 		return -EALREADY;
diff --git a/se/plugins/tizen.c b/se/plugins/tizen.c
index 6bdbc2473cee..e2ea4dec4212 100644
--- a/se/plugins/tizen.c
+++ b/se/plugins/tizen.c
@@ -375,7 +375,7 @@ static void tapi_transfer_apdu_reply(DBusPendingCall *c=
all, void *user_data)
 	if (apdu_length =3D=3D 0 || apdu =3D=3D NULL)
 		DBG("data is NULL");
 =

-	DBG("apdu_length %d", apdu_length);
+	DBG("apdu_length %u", apdu_length);
 =

 done:
 	ctx->cb(ctx->context, apdu, apdu_length, result);
diff --git a/se/se.c b/se/se.c
index 002498e63f7a..9a8b32ebe6d2 100644
--- a/se/se.c
+++ b/se/se.c
@@ -116,7 +116,7 @@ static void io_cb(void *context,
 	struct seel_se_ioreq *req =3D context;
 	struct seel_se *se =3D req->se;
 =

-	DBG("%zd %d", apdu_length, err);
+	DBG("%zu %d", apdu_length, err);
 =

 	/* Check response status */
 	if (!err)
@@ -247,7 +247,7 @@ static char *se_path(uint32_t se_idx, uint8_t ctrl_idx,
 	if (type =3D=3D NULL)
 		return NULL;
 =

-	return g_strdup_printf("%s/se/%s%d_%s_se%d", SEEL_PATH,
+	return g_strdup_printf("%s/se/%s%u_%s_se%u", SEEL_PATH,
 					ctrl, ctrl_idx, type, se_idx);
 }
 =

@@ -538,7 +538,7 @@ static void open_channel_cb(void *context,
 =

 	ctx->channel =3D apdu[0];
 =

-	DBG("Channel %d", ctx->channel);
+	DBG("Channel %u", ctx->channel);
 =

 	select_aid =3D __seel_apdu_select_aid(ctx->channel,
 						ctx->aid, ctx->aid_len);
-- =

2.27.0

--===============3495469260668207557==--

