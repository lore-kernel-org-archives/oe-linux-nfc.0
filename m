Content-Type: multipart/mixed; boundary="===============3870036177660112247=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2] nfc: st95hf: remove unnecessary assignment and label
Date: Wed, 26 May 2021 09:56:00 -0400
Message-ID: <1aecd37b-88e8-e00d-d0b1-2fd989514c19@canonical.com>
In-Reply-To: <20210526005651.12652-1-samirweng1979@163.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3870036177660112247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25/05/2021 20:56, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> =

> In function st95hf_in_send_cmd, the variable rc is assigned then goto
> error label, which just returns rc, so we use return to replace it.
> Since error label only used once in the function, so we remove error labe=
l.
> =

> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
> ---
>  drivers/nfc/st95hf/core.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> =


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
--===============3870036177660112247==--

