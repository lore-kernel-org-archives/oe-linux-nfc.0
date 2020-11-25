Content-Type: multipart/mixed; boundary="===============7668205809201221605=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next v2] net/nfc/nci: Support NCI 2.x initial sequence
Date: Wed, 25 Nov 2020 21:33:48 +0900
Message-ID: <CACwDmQAZ48JrM3AuiKwuSdhcpfo_d2_P0B+mtd4Mshfa3WUVpA@mail.gmail.com>
In-Reply-To: <20201124144353.7c759cae@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7668205809201221605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 9:03 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 23 Nov 2020 19:12:08 +0900 Bongsu Jeon wrote:
> > implement the NCI 2.x initial sequence to support NCI 2.x NFCC.
> > Since NCI 2.0, CORE_RESET and CORE_INIT sequence have been changed.
> > If NFCEE supports NCI 2.x, then NCI 2.x initial sequence will work.
> >
> > In NCI 1.0, Initial sequence and payloads are as below:
> > (DH)                     (NFCC)
> >  |  -- CORE_RESET_CMD --> |
> >  |  <-- CORE_RESET_RSP -- |
> >  |  -- CORE_INIT_CMD -->  |
> >  |  <-- CORE_INIT_RSP --  |
> >  CORE_RESET_RSP payloads are Status, NCI version, Configuration Status.
> >  CORE_INIT_CMD payloads are empty.
> >  CORE_INIT_RSP payloads are Status, NFCC Features,
> >     Number of Supported RF Interfaces, Supported RF Interface,
> >     Max Logical Connections, Max Routing table Size,
> >     Max Control Packet Payload Size, Max Size for Large Parameters,
> >     Manufacturer ID, Manufacturer Specific Information.
> >
> > In NCI 2.0, Initial Sequence and Parameters are as below:
> > (DH)                     (NFCC)
> >  |  -- CORE_RESET_CMD --> |
> >  |  <-- CORE_RESET_RSP -- |
> >  |  <-- CORE_RESET_NTF -- |
> >  |  -- CORE_INIT_CMD -->  |
> >  |  <-- CORE_INIT_RSP --  |
> >  CORE_RESET_RSP payloads are Status.
> >  CORE_RESET_NTF payloads are Reset Trigger,
> >     Configuration Status, NCI Version, Manufacturer ID,
> >     Manufacturer Specific Information Length,
> >     Manufacturer Specific Information.
> >  CORE_INIT_CMD payloads are Feature1, Feature2.
> >  CORE_INIT_RSP payloads are Status, NFCC Features,
> >     Max Logical Connections, Max Routing Table Size,
> >     Max Control Packet Payload Size,
> >     Max Data Packet Payload Size of the Static HCI Connection,
> >     Number of Credits of the Static HCI Connection,
> >     Max NFC-V RF Frame Size, Number of Supported RF Interfaces,
> >     Supported RF Interfaces.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
>
> NFC folks, looks like when the NFC core got orphaned it lost all links
> in MAINTAINERS. Should we add the L: linux-nfc(a)lists.01.org so that
> there is a better chance that someone knowledgeable will provide
> reviews?
>
> Also if anyone is up for it feel free to add your M: or R: entries!
>

Okay. It's better. I will add linux-nfc(a)lists.01.org when I resend the
new version.

> >  #define NCI_OP_CORE_INIT_CMD         nci_opcode_pack(NCI_GID_CORE, 0x0=
1)
> > +/* To support NCI 2.x */
> > +struct nci_core_init_v2_cmd {
> > +     unsigned char   feature1;
> > +     unsigned char   feature2;
> > +} __packed;
>
> No need for this to be packed.
>
> >  #define NCI_OP_CORE_SET_CONFIG_CMD   nci_opcode_pack(NCI_GID_CORE, 0x0=
2)
> >  struct set_config_param {
> > @@ -316,6 +326,11 @@ struct nci_core_reset_rsp {
> >       __u8    config_status;
> >  } __packed;
> >
> > +/* To support NCI ver 2.x */
> > +struct nci_core_reset_rsp_nci_ver2 {
> > +     unsigned char   status;
> > +} __packed;
>
> ditto
>

Okay I will fix it.

> >  #define NCI_OP_CORE_INIT_RSP         nci_opcode_pack(NCI_GID_CORE, 0x0=
1)
> >  struct nci_core_init_rsp_1 {
> >       __u8    status;
> > @@ -334,6 +349,20 @@ struct nci_core_init_rsp_2 {
> >       __le32  manufact_specific_info;
> >  } __packed;
> >
> > +/* To support NCI ver 2.x */
> > +struct nci_core_init_rsp_nci_ver2 {
> > +     unsigned char   status;
> > +     __le32  nfcc_features;
> > +     unsigned char   max_logical_connections;
> > +     __le16  max_routing_table_size;
> > +     unsigned char   max_ctrl_pkt_payload_len;
> > +     unsigned char   max_data_pkt_hci_payload_len;
> > +     unsigned char   number_of_hci_credit;
> > +     __le16  max_nfc_v_frame_size;
> > +     unsigned char   num_supported_rf_interfaces;
> > +     unsigned char   supported_rf_interfaces[];
> > +} __packed;
> > +
> >  #define NCI_OP_CORE_SET_CONFIG_RSP   nci_opcode_pack(NCI_GID_CORE, 0x0=
2)
> >  struct nci_core_set_config_rsp {
> >       __u8    status;
> > @@ -372,6 +401,16 @@ struct nci_nfcee_discover_rsp {
> >  /* --------------------------- */
> >  /* ---- NCI Notifications ---- */
> >  /* --------------------------- */
> > +#define NCI_OP_CORE_RESET_NTF                nci_opcode_pack(NCI_GID_C=
ORE, 0x00)
> > +struct nci_core_reset_ntf {
> > +     unsigned char   reset_trigger;
> > +     unsigned char   config_status;
> > +     unsigned char   nci_ver;
> > +     unsigned char   manufact_id;
> > +     unsigned char   manufacturer_specific_len;
> > +     __le32  manufact_specific_info;
> > +} __packed;
> > +
> >  #define NCI_OP_CORE_CONN_CREDITS_NTF nci_opcode_pack(NCI_GID_CORE, 0x0=
6)
> >  struct conn_credit_entry {
> >       __u8    conn
> > diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
> > index 4953ee5146e1..68889faadda2 100644
> > --- a/net/nfc/nci/core.c
> > +++ b/net/nfc/nci/core.c
> > @@ -165,7 +165,14 @@ static void nci_reset_req(struct nci_dev *ndev, un=
signed long opt)
> >
> >  static void nci_init_req(struct nci_dev *ndev, unsigned long opt)
> >  {
> > -     nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
> > +     struct nci_core_init_v2_cmd *cmd =3D (struct nci_core_init_v2_cmd=
 *)opt;
> > +
> > +     if (!cmd) {
> > +             nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
> > +     } else {
> > +             /* if nci version is 2.0, then use the feature parameters=
 */
> > +             nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, sizeof(struct nc=
i_core_init_v2_cmd), cmd);
>
> Please wrap this line.
>

Sorry, Could you explain it in detail?

> > +     }
>
> Parenthesis unnecessary.
>

Ok. I will fix it.

> >  }
> >
> >  static void nci_init_complete_req(struct nci_dev *ndev, unsigned long =
opt)
>
> > +static unsigned char nci_core_init_rsp_packet_v2(struct nci_dev *ndev,=
 struct sk_buff *skb)
> > +{
> > +     struct nci_core_init_rsp_nci_ver2 *rsp =3D (void *)skb->data;
> > +     unsigned char rf_interface_idx =3D 0;
> > +     unsigned char rf_extension_cnt =3D 0;
> > +     unsigned char *supported_rf_interface =3D rsp->supported_rf_inter=
faces;
> > +
> > +     pr_debug("status %x\n", rsp->status);
> > +
> > +     if (rsp->status !=3D NCI_STATUS_OK)
> > +             return rsp->status;
> > +
> > +     ndev->nfcc_features =3D __le32_to_cpu(rsp->nfcc_features);
> > +     ndev->num_supported_rf_interfaces =3D rsp->num_supported_rf_inter=
faces;
> > +
> > +     if (ndev->num_supported_rf_interfaces >
> > +         NCI_MAX_SUPPORTED_RF_INTERFACES) {
> > +             ndev->num_supported_rf_interfaces =3D
> > +                     NCI_MAX_SUPPORTED_RF_INTERFACES;
> > +     }
>
> brackets unnecessary unnecessary
>
> also:
>
>         ndev->num_supported_rf_interfaces =3D
>                 min(ndev->num_supported_rf_interfaces,
>                     NCI_MAX_SUPPORTED_RF_INTERFACES);
>

Okay. I will fix it.
Thanks for reviewing this code.

> > +     while (rf_interface_idx < ndev->num_supported_rf_interfaces) {
> > +             ndev->supported_rf_interfaces[rf_interface_idx++] =3D *su=
pported_rf_interface++;
> > +
> > +             /* skip rf extension parameters */
> > +             rf_extension_cnt =3D *supported_rf_interface++;
> > +             supported_rf_interface +=3D rf_extension_cnt;
> > +     }
--===============7668205809201221605==--

