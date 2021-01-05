Content-Type: multipart/mixed; boundary="===============6739919431707942853=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next] nfc: Add a virtual nci device driver
Date: Wed, 06 Jan 2021 08:16:47 +0900
Message-ID: <CACwDmQCTj1T+25XBx8=3z=NmCtBSeHxHbUykA6r9_MwNJmJOQQ@mail.gmail.com>
In-Reply-To: <20210104114842.2eccef83@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6739919431707942853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 5, 2021 at 4:48 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 31 Dec 2020 14:22:45 +0900 Bongsu Jeon wrote:
> > On Tue, Dec 29, 2020 at 6:16 AM Jakub Kicinski <kuba@kernel.org> wrot=
e:
> > >
> > > On Mon, 28 Dec 2020 18:45:07 +0900 Bongsu Jeon wrote:
> > > > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> > > >
> > > > A NCI virtual device can be made to simulate a NCI device in user s=
pace.
> > > > Using the virtual NCI device, The NCI module and application can be
> > > > validated. This driver supports to communicate between the virtual =
NCI
> > > > device and NCI module.
> > > >
> > > > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> > >
> > > net-next is still closed:
> > >
> > > http://vger.kernel.org/~davem/net-next.html
> > >
> > > Please repost in a few days.
> > >
> > > As far as the patch goes - please include some tests for the NCI/NFC
> > > subsystem based on this virtual device, best if they live in tree und=
er
> > > tools/testing/selftest.
> >
> > thank you for your answer.
> > I think that neard(NFC deamon) is necessary to test the NCI subsystem
> > meaningfully.
> > The NCI virtual device in user space can communicate with neard
> > through this driver.
> > Is it enough to make NCI virtual device at tools/nfc for some test?
>
> I'm not sure if I understand. Are you asking if it's okay for the test
> or have a dependency on neard?

Sorry for confusing you.
There is no dependency between neard and a NCI virtual device.
But, To test the NCI module, it is necessary to make an application like ne=
ard.
Is it okay to just make a NCI virtual device as a tool at tools/nfc
without the application?
--===============6739919431707942853==--

