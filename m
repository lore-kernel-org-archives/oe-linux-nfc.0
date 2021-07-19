Content-Type: multipart/mixed; boundary="===============6158691917565968143=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
Date: Mon, 19 Jul 2021 13:21:21 +0200
Message-ID: <d78d75e7-098c-cf41-9f96-c746d91385ad@canonical.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6158691917565968143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19/07/2021 13:07, Krzysztof Kozlowski wrote:
> Hi,
> =

> Mark asked for resending fixes separate from setting up CI under Github
> Actions, so here is a combination of all my previously sent patches
> related only to the actual C code:
> =

> https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlows=
ki(a)canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlow=
ski(a)canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlo=
wski(a)canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozlow=
ski(a)canonical.com/T/#t
> =

> This includes fixes for GCC/clang warnings, memory leaks, memory
> corruption and few other minor fixes. The UTF-8 and UTF-16 is not
> entirely fixed and I removed the work-in-progress patches.
> =

> Changes since v1 are:
> 1. Group all patches based on prefix (unit file), instead of topic.
> 2. Put the build-related patches at the end.
> 3. Remove all CI-related patches.

I put CI-related changes in:
https://github.com/linux-nfc/neard/commits/krzk/github-ci-v2

It's based on master, so it fails building (fixes are in the set here).
Should be rebased on top of this set before merging. Few patches got
also squashed as now this set does not follow my exact development history.


Best regards,
Krzysztof
--===============6158691917565968143==--

