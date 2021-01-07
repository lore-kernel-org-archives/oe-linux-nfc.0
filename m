Content-Type: multipart/mixed; boundary="===============3155005602780448626=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next] nfc: Add a virtual nci device driver
Date: Fri, 08 Jan 2021 07:38:29 +0900
Message-ID: <CACwDmQAKky89hBzmOR0FOy=B0HQ8-APj0MEKBFwUHtnTSWXh_w@mail.gmail.com>
In-Reply-To: <20210106090112.04ebf38f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3155005602780448626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 7, 2021 at 2:01 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 6 Jan 2021 08:16:47 +0900 Bongsu Jeon wrote:
> > On Tue, Jan 5, 2021 at 4:48 AM Jakub Kicinski <kuba@kernel.org> wrote:
> > > > thank you for your answer.
> > > > I think that neard(NFC deamon) is necessary to test the NCI subsyst=
em
> > > > meaningfully.
> > > > The NCI virtual device in user space can communicate with neard
> > > > through this driver.
> > > > Is it enough to make NCI virtual device at tools/nfc for some test?
> > >
> > > I'm not sure if I understand. Are you asking if it's okay for the test
> > > or have a dependency on neard?
> >
> > Sorry for confusing you.
> > There is no dependency between neard and a NCI virtual device.
> > But, To test the NCI module, it is necessary to make an application lik=
e neard.
> > Is it okay to just make a NCI virtual device as a tool at tools/nfc
> > without the application?
>
> Meaning the device will be created but there will be no test cases in
> the tree?

yes.

>
> What we'd like to see is some form of a test which would exercise the
> NFC-related kernel code on such a device and can signal success /
> failure. It doesn't have to be very complex.
>
> You can build a more complex user space applications and tests
> separately.

okay. I understand it. I will try to make it.
--===============3155005602780448626==--

