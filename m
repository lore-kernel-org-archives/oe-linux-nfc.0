Content-Type: multipart/mixed; boundary="===============5713843898592338990=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH] build: fix missing pkglibdir substitute in neard.pc
Date: Sat, 07 Aug 2021 15:05:30 -0700
Message-ID: <20210807220530.GB124928@animalcreek.com>
In-Reply-To: <20210804110145.85210-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============5713843898592338990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 04, 2021 at 01:01:45PM +0200, Krzysztof Kozlowski wrote:
> The pkglibdir is used by neard.pc.in (so by autoconf) however the
> automake defines it, not autoconf.  Add early definition of pkglibdir so
> substitute in neard.pc.in will work correctly.
> =

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Applied.

Thank you.

Mark
--
--===============5713843898592338990==--

