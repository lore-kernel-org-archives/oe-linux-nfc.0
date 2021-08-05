Content-Type: multipart/mixed; boundary="===============0022351399744849847=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
Date: Thu, 05 Aug 2021 09:14:24 -0700
Message-ID: <20210805161424.GA556298@animalcreek.com>
In-Reply-To: <CA+Eumj6wuufroVja4PMk+NbmQm57AZEYhtECXZJRH-j08UtJng@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0022351399744849847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 09:56:00AM +0200, Krzysztof Kozlowski wrote:
> On Mon, 2 Aug 2021 at 09:51, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> > > FYI, I built neard natively with these patches applied on an amd64
> > > (ubuntu 20.04) and an ARM Cortext A8 (debian 10).  Both build cleanly
> > > and I could read & write tags.
> > >
> > > My plans include:
> > > - python3-ize the python test scripts
> =

> I checked now Ubuntu/Debian packages and dependency on Python2 was
> reason of removal of neard from their package repository.
> Convertinging these to Python3 would allow bring it back, so it's
> quite useful task.

Good to know.  Thanks for checking.

Mark
--
--===============0022351399744849847==--

