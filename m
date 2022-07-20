Content-Type: multipart/mixed; boundary="===============8363238811109889452=="
MIME-Version: 1.0
From: Martin Faltesek <mfaltesek@google.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net v3 0/3] Split "nfc: st21nfca: Refactor EVT_TRANSACTION" into 3
Date: Wed, 20 Jul 2022 08:53:44 -0600
Message-ID: <CAOiWkA_AcD_J1r1ncvmX8YswbMiS2fx5WySrYwvfdFE4qgk=hQ@mail.gmail.com>
In-Reply-To: <fc85ff14-70d6-0c3e-247d-eda2284a5f6b@oracle.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8363238811109889452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 1:25 AM Denis Efremov
<denis.e.efremov@oracle.com> wrote:
>
> Hi,
>
> On 6/7/22 06:57, Martin Faltesek wrote:
> >
> > Martin Faltesek (3):
> >   nfc: st21nfca: fix incorrect validating logic in EVT_TRANSACTION
> >   nfc: st21nfca: fix memory leaks in EVT_TRANSACTION handling
> >   nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
> >
> >  drivers/nfc/st21nfca/se.c | 53 ++++++++++++++++++++++-----------------
> >  1 file changed, 30 insertions(+), 23 deletions(-)
>
>
> It looks like driver st-nci contains the same problems and all 3 fixes are
> also applicable to st_nci_hci_connectivity_event_received() function.
> At least I can see the memory leak
> https://elixir.bootlin.com/linux/v5.19-rc7/source/drivers/nfc/st-nci/se.c=
#L343
>
> Can you please double check the st-nci driver and send the same fixes to =
it?
> Reported-by: Denis Efremov <denis.e.efremov@oracle.com>

Will do.
--===============8363238811109889452==--

