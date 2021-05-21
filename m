Content-Type: multipart/mixed; boundary="===============0983535892848254660=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH 2/2] nfc: s3fwrn5: i2c: Enable optional clock from device tree
Date: Fri, 21 May 2021 11:02:26 -0400
Message-ID: <20c1367d-a8c7-603e-2b07-ec3ddcd89a38@canonical.com>
In-Reply-To: <CACwDmQCQQpLKeaRxfxXYqSty3YhpZ9y7LNxgkKCBQ=YJiAk1cg@mail.gmail.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0983535892848254660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 20/05/2021 07:40, Bongsu Jeon wrote:
> On Thu, May 20, 2021 at 12:58 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 19/05/2021 04:07, Stephan Gerhold wrote:
>>> On Tue, May 18, 2021 at 11:25:55AM -0400, Krzysztof Kozlowski wrote:
>>>> On 18/05/2021 11:00, Stephan Gerhold wrote:
>>>>> On Tue, May 18, 2021 at 10:30:43AM -0400, Krzysztof Kozlowski wrote:
>>>>>> On 18/05/2021 09:39, Stephan Gerhold wrote:
>>>>>>> s3fwrn5 has a NFC_CLK_REQ output GPIO, which is asserted whenever
>>>>>>> the clock is needed for the current operation. This GPIO can be eit=
her
>>>>>>> connected directly to the clock provider, or must be monitored by
>>>>>>> this driver.
>>>>>>>
>>>>>>> As an example for the first case, on many Qualcomm devices the
>>>>>>> NFC clock is provided by the main PMIC. The clock can be either
>>>>>>> permanently enabled (clocks =3D <&rpmcc RPM_SMD_BB_CLK2>) or enabled
>>>>>>> only when requested through a special input pin on the PMIC
>>>>>>> (clocks =3D <&rpmcc RPM_SMD_BB_CLK2_PIN>).
>>>>>>>
>>>>>>> On the Samsung Galaxy A3/A5 (2015, Qualcomm MSM8916) this mechanism
>>>>>>> is used with S3FWRN5's NFC_CLK_REQ output GPIO to enable the clock
>>>>>>> only when necessary. However, to make that work the s3fwrn5 driver
>>>>>>> must keep the RPM_SMD_BB_CLK2_PIN clock enabled.
>>>>>>
>>>>>> This contradicts the code. You wrote that pin should be kept enabled
>>>>>> (somehow... by driver? by it's firmware?) but your code requests the
>>>>>> clock from provider.
>>>>>>
>>>>>
>>>>> Yeah, I see how that's a bit confusing. Let me try to explain it a bit
>>>>> better. So the Samsung Galaxy A5 (2015) has a "S3FWRN5XS1-YF30", some
>>>>> variant of S3FWRN5 I guess. That S3FWRN5 has a "XI" and "XO" pin in t=
he
>>>>> schematics. "XO" seems to be floating, but "XI" goes to "BB_CLK2"
>>>>> on PM8916 (the main PMIC).
>>>>>
>>>>> Then, there is "GPIO2/NFC_CLK_REQ" on the S3FWRN5. This goes to
>>>>> GPIO_2_NFC_CLK_REQ on PM8916. (Note: I'm talking about two different
>>>>> GPIO2 here, one on S3FWRN5 and one on PM8916, they just happen to have
>>>>> the same number...)
>>>>>
>>>>> So in other words, S3FWRN5 gets some clock from BB_CLK2 on PM8916,
>>>>> and can tell PM8916 that it needs the clock via GPIO2/NFC_CLK_REQ.
>>>>>
>>>>> Now the confusing part is that the rpmcc/clk-smd-rpm driver has two
>>>>> clocks that represent BB_CLK2 (see include/dt-bindings/clock/qcom,rpm=
cc.h):
>>>>>
>>>>>   - RPM_SMD_BB_CLK2
>>>>>   - RPM_SMD_BB_CLK2_PIN
>>>>>
>>>>> (There are also *_CLK2_A variants but they are even more confusing
>>>>>  and not needed here...)
>>>>>
>>>>> Those end up in different register settings in PM8916. There is one b=
it
>>>>> to permanently enable BB_CLK2 (=3D RPM_SMD_BB_CLK2), and one bit to e=
nable
>>>>> BB_CLK2 based on the status of GPIO_2_NFC_CLK_REQ on PM8916
>>>>> (=3D RPM_SMD_BB_CLK2_PIN).
>>>>>
>>>>> So there is indeed some kind of "AND" inside PM8916 (the register bit
>>>>> and "NFC_CLK_REQ" input pin). To make that "AND" work I need to make
>>>>> some driver (here: the s3fwrn5 driver) enable the clock so the regist=
er
>>>>> bit in PM8916 gets set.
>>>>
>>>> Thanks for the explanation, it sounds good. The GPIO2 (or how you call
>>>> it NFC_CLK_REQ) on S3FWRN5 looks like non-configurable from Linux point
>>>> of view. Probably the device firmware plays with it always or at least
>>>> handles it in an unknown way for us.
>>>>
>>>
>>> FWIW, I was looking at some more s3fwrn5 code yesterday and came
>>> across this (in s3fwrn5_nci_rf_configure()):
>>>
>>>       /* Set default clock configuration for external crystal */
>>>       fw_cfg.clk_type =3D 0x01;
>>>       fw_cfg.clk_speed =3D 0xff;
>>>       fw_cfg.clk_req =3D 0xff;
>>>       ret =3D nci_prop_cmd(info->ndev, NCI_PROP_FW_CFG,
>>>               sizeof(fw_cfg), (__u8 *)&fw_cfg);
>>>       if (ret < 0)
>>>               goto out;
>>>
>>> It does look quite suspiciously like that configures how s3fwrn5 expects
>>> the clock and possibly (fw_cfg.clk_req?) how GPIO2 behaves. But it's not
>>> particularly useful without some documentation for the magic numbers.
>>
>> Right, without documentation of FW protocol there is not much we can
>> deduct here. There is no proof even that the comment matches actual code.
>>
>> Dear Bongsu,
>> Maybe you could share some details about clock selection?
> =

> These configuration values depend on the HW circuit for NFC.
> =

> There are  two types of fw_cfg.clk_type for N5.
> 0x01 : external XTAL ( don't need to control the clock because XTAL
> always supplies
> the NFC clock automatically.)
> 0x00 : PLL clock (need to control clock. )
> =

> There are three types of fw_cfg.clk_speed for N5.
> 0xFF : for external XTAL
> 0x00 : 24M for PLL.
> 0x01 : 19.12M for PLL.
> =

> There are two types of fw_cfg.clk_req for N5.
> 0xFF: NFC firmware controls CLK Req when NFC needs the external clock.
> 0xF0: NFC firmware doesn't control CLK Req.
> =

>>
>>>
>>> Personally, I just skip all firmware/RF configuration (which works than=
ks
>>> to commit 4fb7b98c7be3 ("nfc: s3fwrn5: skip the NFC bootloader mode")).
>>> That way, S3FWRN5 just continues using the proper configuration
>>> that was loaded by the vendor drivers at some point. :)
>>
>> But isn't that configuration lost after power off?
>>
> =

> If you skip all firmware/RF configuration, you can use  the preserved
> firmware and
> RF configuration on the chip.

Thank you for sharing these details. Much appreciated!


Best regards,
Krzysztof
--===============0983535892848254660==--

