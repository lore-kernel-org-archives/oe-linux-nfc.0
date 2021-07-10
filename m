Content-Type: multipart/mixed; boundary="===============4369181250571442264=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 04/16] ci: temporarily disable Ubuntu Hirsute
Date: Sat, 10 Jul 2021 05:38:47 +0200
Message-ID: <20210710033859.3989-5-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4369181250571442264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Install additional packages" hangs on:

    Setting up tzdata (2021a-1ubuntu1) ...
    debconf: unable to initialize frontend: Dialog
    debconf: (TERM is not set, so the dialog frontend is not usable.)
    debconf: falling back to frontend: Readline
    Configuring tzdata
    ------------------

    Please select the geographic area in which you live. Subsequent configu=
ration
    questions will narrow this down by presenting a list of cities, represe=
nting
    the time zones in which they are located.

      1. Africa   3. Antarctica  5. Arctic  7. Atlantic  9. Indian    11. US
      2. America  4. Australia   6. Asia    8. Europe    10. Pacific  12. E=
tc
    Geographic area:

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index bd6892343b4f..fb754ac78038 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -9,9 +9,10 @@ jobs:
       fail-fast: false
       matrix:
         include:
-          - container: "ubuntu:hirsute"
-            env:
-              CC: gcc
+          # Does pass installation - hangs on tzdata configuration
+          # - container: "ubuntu:hirsute"
+          #   env:
+          #     CC: gcc
 =

           - container: "ubuntu:focal"
             env:
-- =

2.27.0

--===============4369181250571442264==--

