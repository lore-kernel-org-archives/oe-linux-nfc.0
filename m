Content-Type: multipart/mixed; boundary="===============8233343427210745750=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next] nfc: Add a virtual nci device driver
Date: Thu, 31 Dec 2020 14:22:45 +0900
Message-ID: <CACwDmQCVkxa6u0ZuS4Zn=9JvOXoOE8-v1ZSESO-TaS9yHc7A8A@mail.gmail.com>
In-Reply-To: <20201228131657.562606a0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8233343427210745750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 6:16 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 28 Dec 2020 18:45:07 +0900 Bongsu Jeon wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > A NCI virtual device can be made to simulate a NCI device in user space.
> > Using the virtual NCI device, The NCI module and application can be
> > validated. This driver supports to communicate between the virtual NCI
> > device and NCI module.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
>
> net-next is still closed:
>
> http://vger.kernel.org/~davem/net-next.html
>
> Please repost in a few days.
>
> As far as the patch goes - please include some tests for the NCI/NFC
> subsystem based on this virtual device, best if they live in tree under
> tools/testing/selftest.

thank you for your answer.
I think that neard(NFC deamon) is necessary to test the NCI subsystem
meaningfully.
The NCI virtual device in user space can communicate with neard
through this driver.
Is it enough to make NCI virtual device at tools/nfc for some test?
--===============8233343427210745750==--

