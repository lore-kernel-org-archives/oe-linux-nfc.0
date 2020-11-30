Content-Type: multipart/mixed; boundary="===============1153181187574089438=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 2/4] nfc: s3fwrn5: reduce the EN_WAIT_TIME
Date: Mon, 30 Nov 2020 20:40:41 +0200
Message-ID: <20201130184041.GB28735@kozik-lap>
In-Reply-To: <1606737750-29537-1-git-send-email-bongsu.jeon@samsung.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1153181187574089438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2020 at 09:02:30PM +0900, Bongsu Jeon wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> The delay of 20ms is enough to enable and
> wake up the Samsung's nfc chip.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  drivers/nfc/s3fwrn5/i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

It's really not easy to work with your way of sending the patches.

I am sorry but you have to adjust your style to the style of reviewers
and the entire community.

1. Again, you ignored/dropped my Ack.

2. I asked you to send all patches referencing each other, which you can
   achieve without any effort with git format-patch and send-email or
   with in-reply-to.
   Seriously, these tools work properly by default! You have to break
   them on purpose - so stop.  Now, all your patches are scattered over
   my mailbox. They are all over mailing list:
   https://lore.kernel.org/lkml/?q=3Dbongsu.jeon2%40gmail.com
   Browsing this patchset is uncomfortable. It's a pain.

Please, work on your workflow. Get help in that - there are plenty of
open-source contributors in Samsung. Ask them how to do it. If you
cannot, read the mailing lists and see how others do it.

Recent example, one of thousands:
https://lore.kernel.org/linux-arm-kernel/20201130131047.2648960-1-daniel(a)=
0x0f.com/T/#m4a9ed644869b8018b8286a6b229012278141cb66

1. It comes with a cover letter,
2. All emails are properly linked with each other (scroll to the bottom).

Best regards,
Krzysztof
--===============1153181187574089438==--

