Content-Type: multipart/mixed; boundary="===============0895597203910000587=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 3/3] selftests: Add the NCI testcase reading T4T Tag
Date: Mon, 16 Aug 2021 10:44:24 +0200
Message-ID: <44581a43-daff-b05e-ee5a-45969ccb3d8c@canonical.com>
In-Reply-To: <20210816040600.175813-4-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0895597203910000587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/08/2021 06:06, bongsu.jeon2(a)gmail.com wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> Add the NCI testcase reading T4T Tag that has NFC TEST plain text.
> the virtual device application acts as T4T Tag in this testcase.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  tools/testing/selftests/nci/nci_dev.c | 384 +++++++++++++++++++++++---
>  1 file changed, 345 insertions(+), 39 deletions(-)
> =

> diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selfte=
sts/nci/nci_dev.c
> index 34e76c7fa1fe..65d887dc5ccc 100644
> --- a/tools/testing/selftests/nci/nci_dev.c
> +++ b/tools/testing/selftests/nci/nci_dev.c
> @@ -57,6 +57,29 @@ const __u8 nci_init_rsp_v2[] =3D {0x40, 0x01, 0x1c, 0x=
00, 0x1a, 0x7e, 0x06,
>  const __u8 nci_rf_disc_map_rsp[] =3D {0x41, 0x00, 0x01, 0x00};
>  const __u8 nci_rf_disc_rsp[] =3D {0x41, 0x03, 0x01, 0x00};
>  const __u8 nci_rf_deact_rsp[] =3D {0x41, 0x06, 0x01, 0x00};
> +const __u8 nci_rf_deact_ntf[] =3D {0x61, 0x06, 0x02, 0x00, 0x00};
> +const __u8 nci_rf_activate_ntf[] =3D {0x61, 0x05, 0x1D, 0x01, 0x02, 0x04=
, 0x00,
> +				     0xFF, 0xFF, 0x0C, 0x44, 0x03, 0x07, 0x04,
> +				     0x62, 0x26, 0x11, 0x80, 0x1D, 0x80, 0x01,
> +				     0x20, 0x00, 0x00, 0x00, 0x06, 0x05, 0x75,
> +				     0x77, 0x81, 0x02, 0x80};
> +const __u8 nci_t4t_select_cmd[] =3D {0x00, 0x00, 0x0C, 0x00, 0xA4, 0x04,=
 0x00,
> +				    0x07, 0xD2, 0x76, 0x00, 0x00, 0x85, 0x01, 0x01};
> +const __u8 nci_t4t_select_cmd2[] =3D {0x00, 0x00, 0x07, 0x00, 0xA4, 0x00=
, 0x0C, 0x02,
> +				     0xE1, 0x03};
> +const __u8 nci_t4t_select_cmd3[] =3D {0x00, 0x00, 0x07, 0x00, 0xA4, 0x00=
, 0x0C, 0x02,
> +				     0xE1, 0x04};
> +const __u8 nci_t4t_read_cmd[] =3D {0x00, 0x00, 0x05, 0x00, 0xB0, 0x00, 0=
x00, 0x0F};
> +const __u8 nci_t4t_read_rsp[] =3D {0x00, 0x00, 0x11, 0x00, 0x0F, 0x20, 0=
x00, 0x3B,
> +				  0x00, 0x34, 0x04, 0x06, 0xE1, 0x04, 0x08, 0x00,
> +				  0x00, 0x00, 0x90, 0x00};
> +const __u8 nci_t4t_read_cmd2[] =3D {0x00, 0x00, 0x05, 0x00, 0xB0, 0x00, =
0x00, 0x02};
> +const __u8 nci_t4t_read_rsp2[] =3D {0x00, 0x00, 0x04, 0x00, 0x0F, 0x90, =
0x00};
> +const __u8 nci_t4t_read_cmd3[] =3D {0x00, 0x00, 0x05, 0x00, 0xB0, 0x00, =
0x02, 0x0F};
> +const __u8 nci_t4t_read_rsp3[] =3D {0x00, 0x00, 0x11, 0xD1, 0x01, 0x0B, =
0x54, 0x02,
> +				   0x65, 0x6E, 0x4E, 0x46, 0x43, 0x20, 0x54, 0x45,
> +				   0x53, 0x54, 0x90, 0x00};
> +const __u8 nci_t4t_rsp_ok[] =3D {0x00, 0x00, 0x02, 0x90, 0x00};
>  =

>  struct msgtemplate {
>  	struct nlmsghdr n;
> @@ -87,7 +110,7 @@ static int create_nl_socket(void)
>  =

>  static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, __u32 nlmsg_pid,
>  			   __u8 genl_cmd, int nla_num, __u16 nla_type[],
> -			   void *nla_data[], int nla_len[])
> +			   void *nla_data[], int nla_len[], __u16 flags)
>  {
>  	struct sockaddr_nl nladdr;
>  	struct msgtemplate msg;
> @@ -98,7 +121,7 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type, _=
_u32 nlmsg_pid,
>  =

>  	msg.n.nlmsg_len =3D NLMSG_LENGTH(GENL_HDRLEN);
>  	msg.n.nlmsg_type =3D nlmsg_type;
> -	msg.n.nlmsg_flags =3D NLM_F_REQUEST;
> +	msg.n.nlmsg_flags =3D flags;
>  	msg.n.nlmsg_seq =3D 0;
>  	msg.n.nlmsg_pid =3D nlmsg_pid;
>  	msg.g.cmd =3D genl_cmd;
> @@ -108,12 +131,12 @@ static int send_cmd_mt_nla(int sd, __u16 nlmsg_type=
, __u32 nlmsg_pid,
>  	for (cnt =3D 0; cnt < nla_num; cnt++) {
>  		na =3D (struct nlattr *)(GENLMSG_DATA(&msg) + prv_len);
>  		na->nla_type =3D nla_type[cnt];
> -		na->nla_len =3D nla_len[cnt] + NLA_HDRLEN;
> +		na->nla_len =3D NLMSG_ALIGN(nla_len[cnt] + NLA_HDRLEN);
>  =

>  		if (nla_len > 0)
>  			memcpy(NLA_DATA(na), nla_data[cnt], nla_len[cnt]);
>  =

> -		msg.n.nlmsg_len +=3D NLMSG_ALIGN(na->nla_len);
> +		msg.n.nlmsg_len +=3D na->nla_len;
>  		prv_len =3D na->nla_len;
>  	}
>  =

> @@ -146,11 +169,11 @@ static int send_get_nfc_family(int sd, __u32 pid)
>  	nla_get_family_data =3D family_name;
>  =

>  	return send_cmd_mt_nla(sd, GENL_ID_CTRL, pid, CTRL_CMD_GETFAMILY,
> -				1, &nla_get_family_type,
> -				&nla_get_family_data, &nla_get_family_len);
> +				1, &nla_get_family_type, &nla_get_family_data,
> +				&nla_get_family_len, NLM_F_REQUEST);
>  }
>  =

> -static int get_family_id(int sd, __u32 pid)
> +static int get_family_id(int sd, __u32 pid, __u32 *event_group)
>  {
>  	struct {
>  		struct nlmsghdr n;
> @@ -158,8 +181,9 @@ static int get_family_id(int sd, __u32 pid)
>  		char buf[512];
>  	} ans;
>  	struct nlattr *na;
> -	int rep_len;
> +	int resp_len;

Here and in other places - all these renames rep_len->resp_len do not
look like related to the commit, so please split these to separate commit.
>  	__u16 id;
> +	int len;
>  	int rc;
>  =

>  	rc =3D send_get_nfc_family(sd, pid);
> @@ -167,17 +191,49 @@ static int get_family_id(int sd, __u32 pid)
>  	if (rc < 0)
>  		return 0;
>  =

> -	rep_len =3D recv(sd, &ans, sizeof(ans), 0);
> +	resp_len =3D recv(sd, &ans, sizeof(ans), 0);
>  =

> -	if (ans.n.nlmsg_type =3D=3D NLMSG_ERROR || rep_len < 0 ||
> -	    !NLMSG_OK(&ans.n, rep_len))
> +	if (ans.n.nlmsg_type =3D=3D NLMSG_ERROR || resp_len < 0 ||
> +	    !NLMSG_OK(&ans.n, resp_len))
>  		return 0;
>  =

> +	len =3D 0;
> +	resp_len =3D GENLMSG_PAYLOAD(&ans.n);
>  	na =3D (struct nlattr *)GENLMSG_DATA(&ans);
> -	na =3D (struct nlattr *)((char *)na + NLA_ALIGN(na->nla_len));
> -	if (na->nla_type =3D=3D CTRL_ATTR_FAMILY_ID)
> -		id =3D *(__u16 *)NLA_DATA(na);
>  =

> +	while (len < resp_len) {
> +		len +=3D NLA_ALIGN(na->nla_len);
> +		if (na->nla_type =3D=3D CTRL_ATTR_FAMILY_ID) {
> +			id =3D *(__u16 *)NLA_DATA(na);
> +		} else if (na->nla_type =3D=3D CTRL_ATTR_MCAST_GROUPS) {
> +			struct nlattr *nested_na;
> +			struct nlattr *group_na;
> +			int group_attr_len;
> +			int group_attr;
> +
> +			nested_na =3D (struct nlattr *)((char *)na + NLA_HDRLEN);
> +			group_na =3D (struct nlattr *)((char *)nested_na + NLA_HDRLEN);
> +			group_attr_len =3D 0;
> +
> +			for (group_attr =3D CTRL_ATTR_MCAST_GRP_UNSPEC;
> +				group_attr < CTRL_ATTR_MCAST_GRP_MAX; group_attr++) {
> +				if (group_na->nla_type =3D=3D CTRL_ATTR_MCAST_GRP_ID) {
> +					*event_group =3D *(__u32 *)((char *)group_na +
> +								  NLA_HDRLEN);
> +					break;
> +				}
> +
> +				group_attr_len +=3D NLA_ALIGN(group_na->nla_len) +
> +						  NLA_HDRLEN;
> +				if (group_attr_len >=3D nested_na->nla_len)
> +					break;
> +
> +				group_na =3D (struct nlattr *)((char *)group_na +
> +							     NLA_ALIGN(group_na->nla_len));
> +			}
> +		}
> +		na =3D (struct nlattr *)(GENLMSG_DATA(&ans) + len);
> +	}
>  	return id;
>  }
>  =

> @@ -189,12 +245,13 @@ static int send_cmd_with_idx(int sd, __u16 nlmsg_ty=
pe, __u32 nlmsg_pid,
>  	int nla_len =3D 4;
>  =

>  	return send_cmd_mt_nla(sd, nlmsg_type, nlmsg_pid, genl_cmd, 1,
> -				&nla_type, &nla_data, &nla_len);
> +				&nla_type, &nla_data, &nla_len, NLM_F_REQUEST);
>  }
>  =

> -static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id, struc=
t msgtemplate *msg)
> +static int get_nci_devid(int sd, __u16 fid, __u32 pid, int dev_id,
> +			 struct msgtemplate *msg)

Does not look related.

Best regards,
Krzysztof
--===============0895597203910000587==--

