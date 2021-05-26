Content-Type: multipart/mixed; boundary="===============3318888705107561134=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2] nfc: st-nci: remove unnecessary labels
Date: Wed, 26 May 2021 09:56:22 -0400
Message-ID: <dcb14fe3-4907-43f6-d79f-27599f1be249@canonical.com>
In-Reply-To: <20210526011624.11204-1-samirweng1979@163.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3318888705107561134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25/05/2021 21:16, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> =

> Some labels are only used once, so we delete them and use the
> return statement instead of the goto statement.
> =

> Signed-off-by: wengjianfeng <wengjianfeng@yulong.com>
> ---
>  drivers/nfc/st-nci/vendor_cmds.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> =



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
--===============3318888705107561134==--

