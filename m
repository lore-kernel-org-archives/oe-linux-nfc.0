Content-Type: multipart/mixed; boundary="===============0572455055772824434=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH] Revert "include: Add a copy of the NFC kernel header"
Date: Mon, 14 Feb 2022 13:32:32 +0100
Message-ID: <c976051a-54ee-a96f-06d7-3ec3ccc4d360@canonical.com>
In-Reply-To: <20220214123110.27056-2-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0572455055772824434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 14/02/2022 13:31, Krzysztof Kozlowski wrote:
> This reverts commit fb7664e2995f2b5bed4b93c7c82aab14c2485eb8 and changes
> several other files to match the scope of revert (using back system
> header, instead of local copy).
> =

> The reverted commit argued it is better to miss header updates than not
> being able to run the neard daemon at all.  It's not correct.  The
> /usr/include/linux/nfc.h header does not affect the runnability of
> daemon but the build stage.  The daemon, once compiled, will be able to
> run even if nfc.h system header changes.
> =

> However in case of any important differences in nfc.h, it is better to
> fail early during build time, than later during runtime because of
> differences of ABI (structures or functions) between kernel and
> user-space.
> =

> Rely back on system/kernel header, to avoid manual synchronisation.
> This will also force us to keep the neard updated if kernel header
> changes.
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

This was sent by mistake, please ignore.

Best regards,
Krzysztof
--===============0572455055772824434==--

