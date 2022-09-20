Content-Type: multipart/mixed; boundary="===============7560478583157764528=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: task hung in port100_send_cmd_sync
Date: Tue, 20 Sep 2022 15:54:29 +0200
Message-ID: <18828928-415f-2faa-8069-b4d01fa38fc6@linaro.org>
In-Reply-To: <CAB7eexL3ac2jxVQ70Q06F6sK9VdwY2aoO=S6OqYu7DTgFMg6tQ@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7560478583157764528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 18/09/2022 15:22, Rondreis wrote:
> Hello,
> =

> When fuzzing the Linux kernel driver v6.0-rc4, the following crash was
> triggered.

Hi,

Thanks for the report.

> =

> HEAD commit: 7e18e42e4b280c85b76967a9106a13ca61c16179
> git tree: upstream
> =

> kernel config: https://pastebin.com/raw/xtrgsXP3
> C reproducer: https://pastebin.com/raw/hjSnLzDh
> console output: https://pastebin.com/raw/3ixbVNcR
> =

> Basically, in the c reproducer, we use the gadget module to emulate
> attaching a USB device(vendor id: 0x54c, product id: 0x6c1, with the
> printer function) and executing some simple sequence of system calls.
> To reproduce this crash, we utilize a third-party library to emulate
> the attaching process: https://github.com/linux-usb-gadgets/libusbgx.
> Just clone this repository, install it, and compile the c
> reproducer with ``` gcc crash.c -lusbgx -lconfig -o crash ``` will do
> the trick.
> =

> I would appreciate it if you have any idea how to solve this bug.

You can try to bisect. Or you can build kernel with lockdep and try to
reproduce.

> =

> The crash report is as follows:

It's not a crash, but a blocked task, so there might be deadlock,
incorrect synchronization or some missing cleanup path. Actually quite a
lot could lead to this.

Best regards,
Krzysztof
--===============7560478583157764528==--

