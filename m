Content-Type: multipart/mixed; boundary="===============1789747262226648400=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
Date: Mon, 19 Jul 2021 09:32:47 -0700
Message-ID: <20210719163247.GA860856@animalcreek.com>
In-Reply-To: <d78d75e7-098c-cf41-9f96-c746d91385ad@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1789747262226648400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 01:21:21PM +0200, Krzysztof Kozlowski wrote:
> On 19/07/2021 13:07, Krzysztof Kozlowski wrote:
> > Hi,
> > =

> > Mark asked for resending fixes separate from setting up CI under Github
> > Actions, so here is a combination of all my previously sent patches
> > related only to the actual C code:
> > =

> > https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlo=
wski(a)canonical.com/T/#t
> > https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozl=
owski(a)canonical.com/T/#t
> > https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.koz=
lowski(a)canonical.com/T/#t
> > https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozl=
owski(a)canonical.com/T/#t
> > =

> > This includes fixes for GCC/clang warnings, memory leaks, memory
> > corruption and few other minor fixes. The UTF-8 and UTF-16 is not
> > entirely fixed and I removed the work-in-progress patches.
> > =

> > Changes since v1 are:
> > 1. Group all patches based on prefix (unit file), instead of topic.
> > 2. Put the build-related patches at the end.
> > 3. Remove all CI-related patches.
> =

> I put CI-related changes in:
> https://github.com/linux-nfc/neard/commits/krzk/github-ci-v2
> =

> It's based on master, so it fails building (fixes are in the set here).
> Should be rebased on top of this set before merging. Few patches got
> also squashed as now this set does not follow my exact development histor=
y.

Okay.  I'll work on reviewing through the week but I likely won't get
through many until next weekend.

Thanks for the quick turn-around.

Mark
--
--===============1789747262226648400==--

