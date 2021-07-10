Content-Type: multipart/mixed; boundary="===============1500081127862296762=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 08/16] ci: enable back Ubuntu Hirsute
Date: Sat, 10 Jul 2021 05:38:51 +0200
Message-ID: <20210710033859.3989-9-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210710033859.3989-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============1500081127862296762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Preseed tzdata so Ubuntu Hirsute could be used for building.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 7 +++----
 ci/debian.sh             | 9 +++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 266b93ff9895..866fa846c7f8 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -16,10 +16,9 @@ jobs:
       fail-fast: false
       matrix:
         include:
-          # Does pass installation - hangs on tzdata configuration
-          # - container: "ubuntu:hirsute"
-          #   env:
-          #     CC: gcc
+          - container: "ubuntu:hirsute"
+            env:
+              CC: gcc
 =

           - container: "ubuntu:focal"
             env:
diff --git a/ci/debian.sh b/ci/debian.sh
index b13ffe701ae4..004e7d84ae07 100755
--- a/ci/debian.sh
+++ b/ci/debian.sh
@@ -11,6 +11,15 @@ set -e -E
 =

 apt update
 =

+# Some distros (e.g. Ubuntu Hirsute) might pull tzdata which asks questions
+export DEBIAN_FRONTEND=3Dnoninteractive DEBCONF_NONINTERACTIVE_SEEN=3Dtrue
+
+# Choose some random place in Europe
+echo "tzdata tzdata/Areas select Europe
+tzdata tzdata/Zones/Europe select Berlin
+" > /tmp/tzdata-preseed.txt
+debconf-set-selections /tmp/tzdata-preseed.txt
+
 apt install -y --no-install-recommends \
 	autoconf \
 	automake \
-- =

2.27.0

--===============1500081127862296762==--

