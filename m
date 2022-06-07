Content-Type: multipart/mixed; boundary="===============7981945238433317263=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net v3 1/3] nfc: st21nfca: fix incorrect validating logic in EVT_TRANSACTION
Date: Tue, 07 Jun 2022 19:13:37 +0200
Message-ID: <e24f904b-0eaa-dd48-2647-8aaee510beca@linaro.org>
In-Reply-To: <20220607025729.1673212-2-mfaltesek@google.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============7981945238433317263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/06/2022 04:57, Martin Faltesek wrote:
> The first validation check for EVT_TRANSACTION has two different checks
> tied together with logical AND. One is a check for minimum packet length,
> and the other is for a valid aid_tag. If either condition is true (fails),
> then an error should be triggered.  The fix is to change && to ||.
> =

> Fixes: 26fc6c7f02cb ("NFC: st21nfca: Add HCI transaction event support")
> Cc: stable(a)vger.kernel.org
> Signed-off-by: Martin Faltesek <mfaltesek@google.com>
> ---
>  drivers/nfc/st21nfca/se.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitt=
ing-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
--===============7981945238433317263==--

