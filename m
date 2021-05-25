Content-Type: multipart/mixed; boundary="===============6285098690354950399=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: st95hf: remove unnecessary assignment and label
Date: Tue, 25 May 2021 07:38:12 -0400
Message-ID: <3fe26970-91ab-d598-92ff-e13d8d707d47@canonical.com>
In-Reply-To: <20210525063801.11840-1-samirweng1979@163.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6285098690354950399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 25/05/2021 02:38, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> =

> In function st95hf_in_send_cmd, the variable rc is assigned then goto
> error label, which just return rc, so we use return to replace it. and

s/return/returns/
s/. and/. Since/ (don't start sentences with "and", neither with
lowercase letter).

> error label only used once in the function, so we remove error label.

With these fixes and subject prefix fix to "nfc" (lowercase):

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
--===============6285098690354950399==--

