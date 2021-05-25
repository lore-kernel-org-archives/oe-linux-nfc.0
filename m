Content-Type: multipart/mixed; boundary="===============8588061596674950635=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] nfc: st-nci: remove unnecessary labels
Date: Tue, 25 May 2021 07:42:30 -0400
Message-ID: <93e67699-a0c4-7fe7-6c38-aeff68a3881f@canonical.com>
In-Reply-To: <20210525031254.12196-1-samirweng1979@163.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8588061596674950635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 24/05/2021 23:12, samirweng1979 wrote:
> From: wengjianfeng <wengjianfeng@yulong.com>
> =

> In some functions, use goto exit statement, which just return r.

This is not parseable. Imperative "use goto" suggest that it's the
change you make.

> and exit label only used once in each funciton, so we use return

Every sentence in English starts with capital letter. They however
cannto start with "and" because it joins two parts of sentences.

s/funciton/use the spellcheck please/

The code looks good, but please spend some time to make the description
understandable. You can also make it very short, to avoid complicated
sentences. Look for examples in Linux kernel how other people wrote it.


Best regards,
Krzysztof
--===============8588061596674950635==--

