Content-Type: multipart/mixed; boundary="===============8643291478517686324=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 1/6] test: Use spaces for Python test scripts
Date: Wed, 01 Dec 2021 09:56:48 +0100
Message-ID: <b9b5b510-40d5-b945-61ba-a069e9847bf2@canonical.com>
In-Reply-To: <20211129050606.873494-2-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8643291478517686324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29/11/2021 06:06, Mark Greer wrote:
> The Python PEP 8 style guide prefers spaces over tabs so replace all
> tabs in the Python test scripts with spaces. See:
> =

> 	https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces

Reformatting entire code is quite intrusive although useful. But while
reformatting - why not indenting it according to PEP 8 with four spaces?
Otherwise we will need second commit touching all the lines again.

> =

> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  test/bt-handover         | 192 ++++++++++++++++-----------------
>  test/handover-agent      | 208 ++++++++++++++++++------------------
>  test/monitor-near        |  50 ++++-----
>  test/ndef-agent          | 112 ++++++++++----------
>  test/neardutils.py       | 128 +++++++++++-----------
>  test/phdc-simple-manager | 154 +++++++++++++--------------
>  test/test-adapter        | 160 ++++++++++++++--------------
>  test/test-device         | 180 +++++++++++++++----------------
>  test/test-tag            | 224 +++++++++++++++++++--------------------
>  9 files changed, 704 insertions(+), 704 deletions(-)
> =

> diff --git a/test/bt-handover b/test/

Best regards,
Krzysztof
--===============8643291478517686324==--

