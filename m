Content-Type: multipart/mixed; boundary="===============0625984824115464313=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 2/3] selftests: Remove the polling code to read a NCI frame
Date: Mon, 16 Aug 2021 10:41:37 +0200
Message-ID: <03cfd784-72ce-9835-a6b4-3af6ed34f092@canonical.com>
In-Reply-To: <20210816040600.175813-3-bongsu.jeon2@gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0625984824115464313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 16/08/2021 06:05, bongsu.jeon2(a)gmail.com wrote:
> From: Bongsu Jeon <bongsu.jeon@samsung.com>
> =

> Because the virtual NCI device uses Wait Queue, the virtual device
> application doesn't need to poll the NCI frame.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>
> ---
>  tools/testing/selftests/nci/nci_dev.c | 33 +++++++++------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> =


This depends on the patch 1/3 (the NCI change) so should go via the same
tree probably (or cross tree merge). Looks good to me:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
--===============0625984824115464313==--

