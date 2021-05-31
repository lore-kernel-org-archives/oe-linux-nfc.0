Content-Type: multipart/mixed; boundary="===============0710020385251273588=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 01/11] nfc: fdp: drop ftrace-like debugging messages
Date: Mon, 31 May 2021 09:30:20 +0200
Message-ID: <4f44c25c-c296-ba3e-7c6d-bc1016574231@canonical.com>
In-Reply-To: <20210528151340.7ea69c15@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0710020385251273588==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29/05/2021 00:13, Jakub Kicinski wrote:
> On Fri, 28 May 2021 10:53:20 -0400 Krzysztof Kozlowski wrote:
>> Now that the kernel has ftrace, any debugging calls that just do "made
>> it to this function!" and "leaving this function!" can be removed.
>> Better to use standard debugging tools.
>>
>> This allows also to remove several local variables and entire
>> fdp_nci_recv_frame() function (whose purpose was only to log).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> =

> Hi! Would you mind reposting these 11 fixes? build bots don't
> understand series dependencies and the last patch here depends =

> on the previous clean up set.

Sure, no problem.


Best regards,
Krzysztof
--===============0710020385251273588==--

