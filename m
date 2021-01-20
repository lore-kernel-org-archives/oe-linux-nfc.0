Content-Type: multipart/mixed; boundary="===============2146689340372158552=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
Date: Wed, 20 Jan 2021 18:54:17 +0900
Message-ID: <CACwDmQBZ-LVursCYmtngyv3yFCQ9_Jkip03VZ8cd1auNu86V8A@mail.gmail.com>
In-Reply-To: <161110440860.4771.13780876306648585886.git-patchwork-notify@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2146689340372158552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 10:00 AM <patchwork-bot+netdevbpf@kernel.org> wro=
te:
>
> Hello:
>
> This patch was applied to netdev/net.git (refs/heads/master):
>
> On Tue, 19 Jan 2021 05:55:22 +0900 you wrote:
> > From: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > Fix the code because NCI_CORE_INIT_CMD includes two parameters in NCI2.0
> > but there is no parameters in NCI1.x.
> >
> > Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> >
> > [...]
>
> Here is the summary with links:
>   - [net] net: nfc: nci: fix the wrong NCI_CORE_INIT parameters
>     https://git.kernel.org/netdev/net/c/4964e5a1e080
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>

Could you merge this patch to net-next repo??
NCI selftest that i will send will fail if this patch isn't merged.
--===============2146689340372158552==--

