Content-Type: multipart/mixed; boundary="===============8001566180494697066=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 4/6] se: Use spaces only for SE Python test scripts
Date: Wed, 01 Dec 2021 10:15:05 +0100
Message-ID: <77e68d99-b96a-2616-5933-00f6b4affa28@canonical.com>
In-Reply-To: <20211129050606.873494-5-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8001566180494697066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29/11/2021 06:06, Mark Greer wrote:
> The Python PEP 8 style guide prefers spaces over tabs so replace all
> tabs in the SE Python test scripts with spaces. See:
> =

> 	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces
> =

> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  se/test/test-channel |  84 ++++++++++----------
>  se/test/test-seel    | 178 +++++++++++++++++++++----------------------
>  2 files changed, 131 insertions(+), 131 deletions(-)
> =

The same as in patch #1 - since you are touching all the lines and
changing indentation, no point in having two steps fixing indentation,
so make it 4-spaces.


Best regards,
Krzysztof
--===============8001566180494697066==--

