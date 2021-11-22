Content-Type: multipart/mixed; boundary="===============3777613931764486731=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard] neard release v0.18
Date: Mon, 22 Nov 2021 14:23:59 +0100
Message-ID: <c2a668ef-6395-f056-6f39-e909e6b370a7@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3777613931764486731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

v0.18
=3D=3D=3D=3D=3D
This is announce of new release of neard, an user-space counterpart of
Linux kernel NFC stack, v0.18.

I am sending this email to few distro lists and folks involved in
packaging neard (and updating existing packages). Please let me know if
I should skip notifying you or you think I should Cc someone else.

The release includes few fixes.

Source code release:
https://git.kernel.org/pub/scm/network/nfc/neard.git/tag/?h=3Dv0.18
https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.18.ta=
r.gz


Packaging updates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
With previous release v0.17, build requires autoconf-archive. I saw
Fedora and Arch already updated their packaging to include it. No
further changes here. The full list is:
https://github.com/linux-nfc/neard/blob/master/HACKING#L5


Bugs/comments
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. linux-nfc(a)lists.01.org
2. https://github.com/linux-nfc/neard (as GitHub issues)


Few notes on new names and maintainers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The neard package was previously maintained Samuel Ortiz and Marcel
Holtmann, which were also main contributors. Last years Mark Greer was
looking after neard. I joined in 2021, both as a maintainer of Linux
kernel NFC stack and the neard.

Under GitHub I set up also Continuous Integration:
https://github.com/linux-nfc/neard/actions

Best regards,
Krzysztof
--===============3777613931764486731==--

