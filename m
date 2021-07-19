Content-Type: multipart/mixed; boundary="===============4700563946585298510=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH 00/16] neard CI under Github and rouund of fixes
Date: Sun, 18 Jul 2021 18:40:45 -0700
Message-ID: <20210719014045.GA705685@animalcreek.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4700563946585298510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 10, 2021 at 05:38:43AM +0200, Krzysztof Kozlowski wrote:
> Hi,

Hi Krzysztof

> Mark proposed to do some work around neard (the user-space counterpart
> of NFC drivers) [1], so here it is.
> =

> I made a fork on Github [2] and I add here Continuous Integration via
> Github actions. These are pretty easy to set up. For starting only few
> builds are done, but I have also more in the queue - just need to fix
> 32-bit and clang builds.
> =

> The neard fails to compile on GCC v10 (earlier maybe as well) in
> maintainer moe (so with some warnings enabled) which is fixed here. It
> is also first round of fixes around UTF-8 and UTF-16 parsing, although
> this is not finished yet.
> =

> Further plans:
> 1. Decide whether official releases should be made from Github or
>    kernel.org.
> 2. Fix for clang.
> 3. Fix UTF-8 and UTF-16 in ndef.
> 4. Add more unit tests around ndef and others (help would be here
>    appreciated).
> 5. Add more GCC/clang warnings and fix them.
> 6. Add some static analysis checks in Github CI.
> =

> [1] https://lore.kernel.org/linux-nfc/20210512144319.30852-1-krzysztof.ko=
zlowski(a)canonical.com/T/#m6a1cdae5f435b295cc7670c361b5bdc1daf30273
> [2] https://github.com/krzk/neard

[This pertains to all of your patch sets that you've submitted.]

I started looking at these today but this patch series does not apply on
top of the current neard master branch.  Also, there are CI patches
intermingled with code-changing patches (and at least one patch that
changes both (12th patch of second patch series).  Looking at your
neard repository, there seems to be some patches in there that haven't
been submitted via email.  Would you mind separating out CI patches from
code patches (i.e., separate patch sets and email threads), ensuring
that all patches are included, then re-submitting?

In the meantime, I will continue to get my NFC hardware running which
has been its own adventure.

Thanks,

Mark
--
--===============4700563946585298510==--

