Content-Type: multipart/mixed; boundary="===============1136214658388089752=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 12/15] nfc: trf7970a: drop unneeded debug prints
Date: Thu, 07 Oct 2021 15:01:25 +0200
Message-ID: <47eae95d-d34c-1fa7-fea9-6e77a130aa97@canonical.com>
In-Reply-To: <20210913165757.GA1309751@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1136214658388089752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 13/09/2021 18:57, Mark Greer wrote:
> On Mon, Sep 13, 2021 at 03:20:32PM +0200, Krzysztof Kozlowski wrote:
>> ftrace is a preferred and standard way to debug entering and exiting
>> functions so drop useless debug prints.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  drivers/nfc/trf7970a.c | 8 --------
>>  1 file changed, 8 deletions(-)
>>

Hi Jakub and David,

Some patches from this set were applied, but rest was not. All of them
are however marked as accepted:
https://patchwork.kernel.org/project/netdevbpf/list/?series=3D545829&state=
=3D*

I think something got lost. Could you apply missing ones or maybe I
should rebase and resend?


Best regards,
Krzysztof
--===============1136214658388089752==--

