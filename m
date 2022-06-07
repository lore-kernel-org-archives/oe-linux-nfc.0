Content-Type: multipart/mixed; boundary="===============6486383026578308430=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net v3 2/3] nfc: st21nfca: fix memory leaks in EVT_TRANSACTION handling
Date: Tue, 07 Jun 2022 19:15:31 +0200
Message-ID: <83fd531e-9135-37b5-e92a-76b6c949587e@linaro.org>
In-Reply-To: <20220607025729.1673212-3-mfaltesek@google.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6486383026578308430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/06/2022 04:57, Martin Faltesek wrote:
> Error paths do not free previously allocated memory. Add devm_kfree() to
> those failure paths.
> =

> Fixes: 26fc6c7f02cb ("NFC: st21nfca: Add HCI transaction event support")
> Fixes: 4fbcc1a4cb20 ("nfc: st21nfca: Fix potential buffer overflows in EV=
T_TRANSACTION")
> Cc: stable(a)vger.kernel.org
> Signed-off-by: Martin Faltesek <mfaltesek@google.com>

Standard disclaimer:
---------
Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitt=
ing-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.
---------

So you dropped all my review tags?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
--===============6486383026578308430==--

