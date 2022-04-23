Content-Type: multipart/mixed; boundary="===============2773446360052608887=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] nfc: nfcmrvl: spi: Fix irq_of_parse_and_map() return value
Date: Sat, 23 Apr 2022 11:28:35 +0200
Message-ID: <e7eb0c05-7056-7aeb-ebca-399f11d22122@linaro.org>
In-Reply-To: <20220422161305.59e0be38@kernel.org>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============2773446360052608887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23/04/2022 01:13, Jakub Kicinski wrote:
> On Fri, 22 Apr 2022 12:47:58 +0200 Krzysztof Kozlowski wrote:
>> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>>
>> Fixes: caf6e49bf6d0 ("NFC: nfcmrvl: add spi driver")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>> This is another issue to https://lore.kernel.org/all/20220422084605.2775=
542-1-lv.ruyi(a)zte.com.cn/
> =

> Maybe send one patch that fixes both and also fixes the usage of ret?

Bah, I just blindly copied one part of his patch without deeper check.
Thanks for noticing it.


Best regards,
Krzysztof
--===============2773446360052608887==--

