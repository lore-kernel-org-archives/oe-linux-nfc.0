Content-Type: multipart/mixed; boundary="===============4077942059590204584=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
Date: Wed, 04 Aug 2021 09:56:00 +0200
Message-ID: <CA+Eumj6wuufroVja4PMk+NbmQm57AZEYhtECXZJRH-j08UtJng@mail.gmail.com>
In-Reply-To: <47b15b65-61cc-9cec-ca6c-c9a6d84ff7d5@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4077942059590204584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Aug 2021 at 09:51, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> > FYI, I built neard natively with these patches applied on an amd64
> > (ubuntu 20.04) and an ARM Cortext A8 (debian 10).  Both build cleanly
> > and I could read & write tags.
> >
> > My plans include:
> > - python3-ize the python test scripts

I checked now Ubuntu/Debian packages and dependency on Python2 was
reason of removal of neard from their package repository.
Convertinging these to Python3 would allow bring it back, so it's
quite useful task.


Best regards,
Krzysztof
--===============4077942059590204584==--

