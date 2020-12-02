Content-Type: multipart/mixed; boundary="===============7766415841687763455=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next v3] net/nfc/nci: Support NCI 2.x initial sequence
Date: Thu, 03 Dec 2020 07:18:49 +0900
Message-ID: <CACwDmQCvB0WSQ86igZXT9FAihqGbM4THXWXj-jRAzr6EhSDf7g@mail.gmail.com>
In-Reply-To: <20201130184845.304f54d3@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7766415841687763455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 1, 2020 at 11:48 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 27 Nov 2020 22:36:31 +0900 bongsu.jeon2(a)gmail.com wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
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
> >  static void nci_init_req(struct nci_dev *ndev, unsigned long opt)
> >  {
> > -     nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
> > +     struct nci_core_init_v2_cmd *cmd =3D (struct nci_core_init_v2_cmd=
 *)opt;
> > +
> > +     if (!cmd)
> > +             nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, 0, NULL);
> > +     else
> > +             /* if nci version is 2.0, then use the feature parameters=
 */
> > +             nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD,
> > +                          sizeof(struct nci_core_init_v2_cmd), cmd);
>
> This would be better written as:
>
>         u8 plen =3D 0;
>
>         if (opt)
>                 plen =3D sizeof(struct nci_core_init_v2_cmd);
>
>         nci_send_cmd(ndev, NCI_OP_CORE_INIT_CMD, plen, (void *)opt);
>
> > +
>
> unnecessary empty line
>
> >  }
> >
> >  static void nci_init_complete_req(struct nci_dev *ndev, unsigned long =
opt)
> > @@ -497,8 +505,18 @@ static int nci_open_device(struct nci_dev *ndev)
> >       }
> >
> >       if (!rc) {
> > -             rc =3D __nci_request(ndev, nci_init_req, 0,
> > -                                msecs_to_jiffies(NCI_INIT_TIMEOUT));
> > +             if (!(ndev->nci_ver & NCI_VER_2_MASK)) {
> > +                     rc =3D __nci_request(ndev, nci_init_req, 0,
> > +                                        msecs_to_jiffies(NCI_INIT_TIME=
OUT));
> > +             } else {
> > +                     struct nci_core_init_v2_cmd nci_init_v2_cmd;
> > +
> > +                     nci_init_v2_cmd.feature1 =3D NCI_FEATURE_DISABLE;
> > +                     nci_init_v2_cmd.feature2 =3D NCI_FEATURE_DISABLE;
> > +
> > +                     rc =3D __nci_request(ndev, nci_init_req, (unsigne=
d long)&nci_init_v2_cmd,
> > +                                        msecs_to_jiffies(NCI_INIT_TIME=
OUT));
> > +             }
>
> again please try to pull out the common code:
>
>         struct nci_core_init_v2_cmd nci_init_v2_cmd =3D {
>                 .feature1 =3D NCI_FEATURE_DISABLE;
>                 .feature2 =3D NCI_FEATURE_DISABLE;
>         };
>         unsigned long opt =3D 0;
>
>         if (ndev->nci_ver & NCI_VER_2_MASK)
>                 opt =3D (unsigned long)&nci_init_v2_cmd;
>
>         rc =3D __nci_request(ndev, nci_init_req, opt,
>                            msecs_to_jiffies(NCI_INIT_TIMEOUT));
>
>
> >       }
>
> > -static void nci_core_init_rsp_packet(struct nci_dev *ndev, struct sk_b=
uff *skb)
> > +static unsigned char nci_core_init_rsp_packet_v1(struct nci_dev *ndev,=
 struct sk_buff *skb)
> >  {
> >       struct nci_core_init_rsp_1 *rsp_1 =3D (void *) skb->data;
> >       struct nci_core_init_rsp_2 *rsp_2;
> > @@ -48,16 +51,14 @@ static void nci_core_init_rsp_packet(struct nci_dev=
 *ndev, struct sk_buff *skb)
> >       pr_debug("status 0x%x\n", rsp_1->status);
> >
> >       if (rsp_1->status !=3D NCI_STATUS_OK)
> > -             goto exit;
> > +             return rsp_1->status;
> >
> >       ndev->nfcc_features =3D __le32_to_cpu(rsp_1->nfcc_features);
> >       ndev->num_supported_rf_interfaces =3D rsp_1->num_supported_rf_int=
erfaces;
> >
> > -     if (ndev->num_supported_rf_interfaces >
> > -         NCI_MAX_SUPPORTED_RF_INTERFACES) {
> > -             ndev->num_supported_rf_interfaces =3D
> > -                     NCI_MAX_SUPPORTED_RF_INTERFACES;
> > -     }
> > +     ndev->num_supported_rf_interfaces =3D
> > +             min((int)ndev->num_supported_rf_interfaces,
> > +                 NCI_MAX_SUPPORTED_RF_INTERFACES);
> >
> >       memcpy(ndev->supported_rf_interfaces,
> >              rsp_1->supported_rf_interfaces,
> > @@ -77,6 +78,58 @@ static void nci_core_init_rsp_packet(struct nci_dev =
*ndev, struct sk_buff *skb)
> >       ndev->manufact_specific_info =3D
> >               __le32_to_cpu(rsp_2->manufact_specific_info);
> >
> > +     return NCI_STATUS_OK;
> > +}
> > +
> > +static unsigned char nci_core_init_rsp_packet_v2(struct nci_dev *ndev,=
 struct sk_buff *skb)
> > +{
> > +     struct nci_core_init_rsp_nci_ver2 *rsp =3D (void *)skb->data;
> > +     unsigned char rf_interface_idx =3D 0;
>
> Prefer the use of u8 type in the kernel
>
> > +     unsigned char rf_extension_cnt =3D 0;
> > +     unsigned char *supported_rf_interface =3D rsp->supported_rf_inter=
faces;
>
> Please order the variable declarations longest to shortest.
> Don't initialize them inline if that'd cause the order to break.
>
> > +     pr_debug("status %x\n", rsp->status);
> > +
> > +     if (rsp->status !=3D NCI_STATUS_OK)
> > +             return rsp->status;
> > +

Thank you for your advice.
I will send a new version.
--===============7766415841687763455==--

