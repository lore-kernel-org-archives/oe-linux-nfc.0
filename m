Content-Type: multipart/mixed; boundary="===============4863593943177813017=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 2/6] test: Convert test script from Python2 to Python3
Date: Wed, 01 Dec 2021 10:00:36 +0100
Message-ID: <e7ff7ef9-f3f2-d063-141a-63019616db52@canonical.com>
In-Reply-To: <20211129050606.873494-3-mgreer@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4863593943177813017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 29/11/2021 06:06, Mark Greer wrote:
> Python2 is deprecated so convert the neard test scripts, which are
> Python2, to Python3.
> =

> Signed-off-by: Mark Greer <mgreer@animalcreek.com>
> ---
>  test/bt-handover         |  8 ++---
>  test/handover-agent      | 34 +++++++++----------
>  test/monitor-near        | 10 +++---
>  test/ndef-agent          | 20 ++++++------
>  test/neard-ui.py         | 70 ++++++++++++++++++++--------------------
>  test/neardutils.py       | 17 ++++------
>  test/phdc-simple-manager | 50 ++++++++++++++--------------
>  test/test-adapter        | 16 ++++-----
>  test/test-device         | 34 +++++++++----------
>  test/test-tag            | 10 +++---
>  10 files changed, 132 insertions(+), 137 deletions(-)
> =



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
--===============4863593943177813017==--

