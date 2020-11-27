Content-Type: multipart/mixed; boundary="===============3268824555476317129=="
MIME-Version: 1.0
From: Bongsu Jeon <bongsu.jeon2@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 1/3] nfc: s3fwrn5: use signed integer for parsing GPIO numbers
Date: Fri, 27 Nov 2020 14:41:25 +0900
Message-ID: <CACwDmQA5acuCpUcjf7Q0biG9KnfK+3WGjTDbDaFpnMMMhBv9sg@mail.gmail.com>
In-Reply-To: <CAEx-X7esGyZ2QiTGbE1H7M7z1dqT47awmqrOtN+p0FbwtwfPOg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3268824555476317129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/27/20, Bongsu Jeon <bs.jeon87@gmail.com> wrote:
> On Fri, Nov 27, 2020 at 2:06 AM Krzysztof Kozlowski <krzk@kernel.org>
> wrote:
>>
>> On Fri, Nov 27, 2020 at 12:33:37AM +0900, bongsu.jeon2(a)gmail.com wrote:
>> > From: Krzysztof Kozlowski <krzk@kernel.org>
>> >
>> > GPIOs - as returned by of_get_named_gpio() and used by the gpiolib -
>> > are
>> > signed integers, where negative number indicates error.  The return
>> > value of of_get_named_gpio() should not be assigned to an unsigned int
>> > because in case of !CONFIG_GPIOLIB such number would be a valid GPIO.
>> >
>> > Fixes: c04c674fadeb ("nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC
>> > Chip")
>> > Cc: <stable@vger.kernel.org>
>> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Why do you send my patch?
>>
>
> I think that your patch should be applied before refactoring for this
> driver.
> So, I applied your patch to net-next branch and included your patch at
> my patch list.
> Is this the wrong process?
>

Sorry to confuse you.
I found your patch when i updated my workspace using git pull.

>> Best regards,
>> Krzysztof
>
--===============3268824555476317129==--

