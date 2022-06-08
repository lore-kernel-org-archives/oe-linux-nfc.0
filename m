Content-Type: multipart/mixed; boundary="===============1391961043509578199=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net v3 3/3] nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
Date: Wed, 08 Jun 2022 09:09:55 +0200
Message-ID: <9d387882-3c9a-5056-9ee3-81ab6ea0a9a6@linaro.org>
In-Reply-To: <20220607025729.1673212-4-mfaltesek@google.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1391961043509578199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/06/2022 04:57, Martin Faltesek wrote:
> The transaction buffer is allocated by using the size of the packet buf,
> and subtracting two which seem intended to remove the two tags which are
> not present in the target structure. This calculation leads to under
> counting memory because of differences between the packet contents and the
> target structure. The aid_len field is a u8 in the packet, but a u32 in
> the structure, resulting in at least 3 bytes always being under counted.
> Further, the aid data is a variable length field in the packet, but fixed
> in the structure, so if this field is less than the max, the difference is
> added to the under counting.
> =

> The last validation check for transaction->params_len is also incorrect
> since it employs the same accounting error.
> =

> To fix, perform validation checks progressively to safely reach the
> next field, to determine the size of both buffers and verify both tags.
> Once all validation checks pass, allocate the buffer and copy the data.
> This eliminates freeing memory on the error path, as those checks are
> moved ahead of memory allocation.
> =

> Fixes: 26fc6c7f02cb ("NFC: st21nfca: Add HCI transaction event support")
> Fixes: 4fbcc1a4cb20 ("nfc: st21nfca: Fix potential buffer overflows in EV=
T_TRANSACTION")
> Cc: stable(a)vger.kernel.org
> Signed-off-by: Martin Faltesek <mfaltesek@google.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
--===============1391961043509578199==--

