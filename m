Content-Type: multipart/mixed; boundary="===============7519178911436533427=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 1/7] nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()
Date: Sun, 16 Jan 2022 17:50:13 +0100
Message-ID: <ddce0e77-2fba-716f-6a69-eeb148fe91ca@canonical.com>
In-Reply-To: <20220116134122.2197-1-hdanton@sina.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7519178911436533427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/01/2022 14:41, Hillf Danton wrote:
> Hey Krzysztof =

> =

> On Sat, 15 Jan 2022 13:26:44 +0100 Krzysztof Kozlowski wrote:
>> +++ b/net/nfc/llcp_sock.c
>> @@ -789,6 +789,11 @@ static int llcp_sock_sendmsg(struct socket *sock, s=
truct msghdr *msg,
>>  =

>>  	lock_sock(sk);
>>  =

>> +	if (!llcp_sock->local) {
>> +		release_sock(sk);
>> +		return -ENODEV;
>> +	}
>> +
>>  	if (sk->sk_type =3D=3D SOCK_DGRAM) {
>>  		DECLARE_SOCKADDR(struct sockaddr_nfc_llcp *, addr,
>>  				 msg->msg_name);
>> -- =

>> 2.32.0
> =

> Given the same check for llcp local in nfc_llcp_send_ui_frame(), adding
> another check does not help.

Helps, because other is not protected with lock. The other could be
removed, because it is simply wrong, but I did not check it.

The patch fixes the report and reproducible race, but maybe does not
necessarily fix entirely the race (which maybe this is what you meant by
"does not help"?).


Best regards,
Krzysztof
--===============7519178911436533427==--

