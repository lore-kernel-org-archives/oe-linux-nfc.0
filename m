Content-Type: multipart/mixed; boundary="===============0845658806591465535=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
Date: Tue, 19 Jan 2021 06:19:23 +0900
Message-ID: <CACwDmQDxa6WKq4UwCfk2sxC8JukV+CcnuSqrCdhSWSjJ9ppwOg@mail.gmail.com>
In-Reply-To: <20210118130154.256b3851@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0845658806591465535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 6:01 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 19 Jan 2021 05:55:22 +0900 Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > Fix the code because NCI_CORE_INIT_CMD includes two parameters in NCI2.0
> > but there is no parameters in NCI1.x.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
>
> What's the Fixes tag for this change?
Sorry to miss the Fixes tag.
This is the Fixes tag ( Fixes: bcd684aace34 ("net/nfc/nci: Support NCI
2.x initial sequence") )
Could I resend this patch after adding that tag?
--===============0845658806591465535==--

