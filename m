Content-Type: multipart/mixed; boundary="===============0543045309324193015=="
MIME-Version: 1.0
From: Mark Greer <mgreer@animalcreek.com>
To: linux-nfc@lists.01.org
Subject: Re: [neard][PATCH v2 00/73] combined fixes - warnings, memory leaks, memory corruption
Date: Sun, 01 Aug 2021 16:11:40 -0700
Message-ID: <20210801231140.GA397941@animalcreek.com>
In-Reply-To: <20210719110819.27340-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============0543045309324193015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 01:07:06PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> =

> Mark asked for resending fixes separate from setting up CI under Github
> Actions, so here is a combination of all my previously sent patches
> related only to the actual C code:
> =

> https://lore.kernel.org/linux-nfc/20210710033859.3989-1-krzysztof.kozlows=
ki(a)canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210711202102.18094-1-krzysztof.kozlow=
ski(a)canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210714110518.104655-1-krzysztof.kozlo=
wski(a)canonical.com/T/#t
> https://lore.kernel.org/linux-nfc/20210716100844.51360-1-krzysztof.kozlow=
ski(a)canonical.com/T/#t
> =

> This includes fixes for GCC/clang warnings, memory leaks, memory
> corruption and few other minor fixes. The UTF-8 and UTF-16 is not
> entirely fixed and I removed the work-in-progress patches.
> =

> Changes since v1 are:
> 1. Group all patches based on prefix (unit file), instead of topic.
> 2. Put the build-related patches at the end.
> 3. Remove all CI-related patches.
> 4. Drop patch: ndef: fix parsing of UTF-16 text payload.
> 5. Fix commit msg in: nfctool: pass the format as string literal
> =

> Best regards,
> Krzysztof
> =

> =

> Krzysztof Kozlowski (73):
>   Drop empty NEWS
>   nfctool: fix adapter_get_devices() cast-function-type
>   nfctool: fix adapter_print_target() cast-function-type
>   nfctool: fix adapter_print_info() cast-function-type
>   nfctool: fix adapter_compare_idx() cast-function-type
>   nfctool: fix nfctool_send_dep_link_up() cast-function-type
>   nfctool: fix nfctool_print_and_remove_snl() cast-function-type
>   nfctool: use proper format for integers (-Wformat)
>   nfctool: pass the format as string literal
>   dbus: fix -Wformat in near_dbus_encode_string()
>   unit: pass real UTF-8 for testing text NDEF
>   ndef: check UTF-16 text payload length
>   ndef: silence clang -Wcast-align warning
>   ndef: use NDEF_TEXT_RECORD_UTF16_STATUS define
>   ndef: use proper format for integers (-Wformat)
>   ndef: make freeing near_ndef_message reusable
>   se: fix multiple apdu definitions
>   se: silence clang -Wcast-align warning
>   se: use proper format for integers (-Wformat)
>   adapter: adjust indentation of continued arguments
>   adapter: use proper format for integers (-Wformat)
>   gdbus: do not shadow global 'pending' variable (-Wshadow)
>   nciattach: fix poll.h include location
>   nciattach: do not shadow other local 'opt' variable (-Wshadow)
>   bluetooth: use proper format for integers (-Wformat)
>   nfctype2: use proper format for integers (-Wformat)
>   nfctype3: use proper format for integers (-Wformat)
>   nfctype5: use proper format for integers (-Wformat)
>   nfctype5: fix returning uninitialized stack value in
>     t5_tag_is_ti_pro()
>   mifare: use proper format for integers (-Wformat)
>   mifare: use unsigned int to suppress compiler -Wstrict-overflow
>   p2p: use proper format for integers (-Wformat)
>   npp: use proper format for integers (-Wformat)
>   device: use proper format for integers (-Wformat)
>   manager: use proper format for integers (-Wformat)
>   netlink: use proper format for integers (-Wformat)
>   gdbus: annotate printf-like functions as accepting format
>   snep-send: fix near_ndef_message memory leak
>   tag: use proper format for integers (-Wformat)
>   tag: do not open-code freeing ndef message
>   snep: do not open-code freeing ndef message
>   snep: remove useless NULL-ify of local pointer variable
>   snep: fix double free of GSList
>   snep: fix fragmented response memory leaks
>   unit: use g_assert_cmpstr()
>   unit: use g_assert_cmpint() and g_assert_cmpuint()
>   unit: fix recv() and send() return types
>   unit: use g_assert_null()
>   unit: use g_assert_cmpmem()
>   unit: use proper pointer to uint8_t in test_snep_read_recv_fragments()
>   unit: do not shadow global 'text' variable (-Wshadow)
>   unit: do not shadow global 'uri' variable (-Wshadow)
>   unit: use proper format for integers (-Wformat)
>   unit: fix memory leaks in test-ndef-parse
>   unit: do not open-code freeing ndef message
>   unit: fix memory leaks in test-ndef-build
>   unit: fix memory leaks in test-snep-read error paths
>   unit: fix record memory leak in test-snep-read
>   unit: fix records GList memory leak in test-snep-read
>   unit: do not pass NULL to memcpy()
>   unit: do not search for headers locally where they do not exist
>   unit: remove duplicated invalid definitions in test-snep-read
>   unit: remove duplicated definitions in test-ndef-parse
>   unit: add few asserts in test-snep-read
>   HACKING: refine required packages
>   build: fix setting CFLAGS on dash shell (Alpine Linux)
>   build: add more compiler warnings
>   build: enable -Wshadow and -Wformat-signedness compiler warnings
>   build: enable -Wformat=3D2 warnings
>   build: enable -Wunsafe-loop-optimizations and -Wstrict-overflow=3D2
>     warnings
>   build: fix missing usage of PIE check result
>   build: add support for GCC sanitizers (asan, lsan and ubsan)
>   AUTHORS: Mention Krzysztof Kozlowski's contributions

Applied.

Thanks Krzysztof.

FYI, I built neard natively with these patches applied on an amd64
(ubuntu 20.04) and an ARM Cortext A8 (debian 10).  Both build cleanly
and I could read & write tags.

My plans include:
- python3-ize the python test scripts
- debug an issue I think I saw
- look for races that I recall running into in the past
- recruit another arm SoC for testing
- get my trf7970 working again

When things settle down and we're happy with what we have, we should
cut a new version (0.17 or 1.0 even).


Mark
--
--===============0543045309324193015==--

