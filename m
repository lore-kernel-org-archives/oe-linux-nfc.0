Content-Type: multipart/mixed; boundary="===============2020778427252875243=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v3 0/8] nfc: s3fwrn5: Few cleanups
Date: Fri, 11 Sep 2020 08:08:49 +0200
Message-ID: <CAJKOXPcFfxY2EU7-_gPQyhp9m_dVed6qxgpZzD4kazEkjDeXOw@mail.gmail.com>
In-Reply-To: <20200910.152235.1512682061673845419.davem@davemloft.net>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2020778427252875243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Sep 2020 at 00:22, David Miller <davem@davemloft.net> wrote:
>
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Date: Thu, 10 Sep 2020 18:12:11 +0200
>
> > Changes since v2:
> > 1. Fix dtschema ID after rename (patch 1/8).
> > 2. Apply patch 9/9 (defconfig change).
> >
> > Changes since v1:
> > 1. Rename dtschema file and add additionalProperties:false, as Rob
> >    suggested,
> > 2. Add Marek's tested-by,
> > 3. New patches: #4, #5, #6, #7 and #9.
>
> Seires applied to net-next, thanks.

Thanks. The DTS should go separate - via samsung-soc/arm-soc tree.
However if it is too late, then no problem.

Best regards,
Krzysztof
--===============2020778427252875243==--

