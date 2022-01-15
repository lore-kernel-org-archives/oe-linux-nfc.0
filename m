Content-Type: multipart/mixed; boundary="===============7364360778158589511=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/7] nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()
Date: Sat, 15 Jan 2022 13:31:28 +0100
Message-ID: <dc675285-1ece-cfc6-d68f-12f58c470c41@canonical.com>
In-Reply-To: <20220115122650.128182-2-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7364360778158589511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 15/01/2022 13:26, Krzysztof Kozlowski wrote:
> Syzbot detected a NULL pointer dereference of nfc_llcp_sock->dev pointer
> (which is a 'struct nfc_dev *') with calls to llcp_sock_sendmsg() after
> a failed llcp_sock_bind(). The message being sent is a SOCK_DGRAM.
> =

> KASAN report:
> =

>   BUG: KASAN: null-ptr-deref in nfc_alloc_send_skb+0x2d/0xc0
>   Read of size 4 at addr 00000000000005c8 by task llcp_sock_nfc_a/899
> =

>   CPU: 5 PID: 899 Comm: llcp_sock_nfc_a Not tainted 5.16.0-rc6-next-20211=
224-00001-gc6437fbf18b0 #125
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04=
/01/2014
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x45/0x59
>    ? nfc_alloc_send_skb+0x2d/0xc0
>    __kasan_report.cold+0x117/0x11c
>    ? mark_lock+0x480/0x4f0
>    ? nfc_alloc_send_skb+0x2d/0xc0
>    kasan_report+0x38/0x50
>    nfc_alloc_send_skb+0x2d/0xc0
>    nfc_llcp_send_ui_frame+0x18c/0x2a0
>    ? nfc_llcp_send_i_frame+0x230/0x230
>    ? __local_bh_enable_ip+0x86/0xe0
>    ? llcp_sock_connect+0x470/0x470
>    ? llcp_sock_connect+0x470/0x470
>    sock_sendmsg+0x8e/0xa0
>    ____sys_sendmsg+0x253/0x3f0
>    ...
> =

> The issue was visible only with multiple simultaneous calls to bind() and
> sendmsg(), which resulted in most of the bind() calls to fail.  The
> bind() was failing on checking if there is available WKS/SDP/SAP
> (respective bit in 'struct nfc_llcp_local' fields).  When there was no
> available WKS/SDP/SAP, the bind returned error but the sendmsg() to such
> socket was able to trigger mentioned NULL pointer dereference of
> nfc_llcp_sock->dev.
> =

> The code looks simply racy and currently it protects several paths
> against race with checks for (!nfc_llcp_sock->local) which is NULL-ified
> in error paths of bind().  The llcp_sock_sendmsg() did not have such
> check but called function nfc_llcp_send_ui_frame() had, although not
> protected with lock_sock().
> =

> Therefore the race could look like (same socket is used all the time):
>   CPU0                                     CPU1
>   =3D=3D=3D=3D                                     =3D=3D=3D=3D
>   llcp_sock_bind()
>   - lock_sock()
>     - success
>   - release_sock()
>   - return 0
>                                            llcp_sock_sendmsg()
>                                            - lock_sock()
>                                            - release_sock()
>   llcp_sock_bind(), same socket
>   - lock_sock()
>     - error
>                                            - nfc_llcp_send_ui_frame()
>                                              - if (!llcp_sock->local)
>     - llcp_sock->local =3D NULL
>     - nfc_put_device(dev)
>                                              - dereference llcp_sock->dev
>   - release_sock()
>   - return -ERRNO
> =

> The nfc_llcp_send_ui_frame() checked llcp_sock->local outside of the
> lock, which is racy and ineffective check.  Instead, its caller
> llcp_sock_sendmsg(), should perform the check inside lock_sock().
> =

> Reported-by: syzbot+7f23bcddf626e0593a39(a)syzkaller.appspotmail.com

Syzbot confirmed fix, so this could be replaced with:

Reported-and-tested-by: syzbot+7f23bcddf626e0593a39(a)syzkaller.appspotmail=
.com


Best regards,
Krzysztof
--===============7364360778158589511==--

