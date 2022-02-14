Content-Type: multipart/mixed; boundary="===============6031123103054984628=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH 1/3] ci: show kernel headers version and difference against embedded nfc.h
Date: Mon, 14 Feb 2022 13:31:07 +0100
Message-ID: <20220214123110.27056-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============6031123103054984628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We embed the /usr/include/linux/nfc.h as nfc_copy.h, to compile cleanly
on older kernels (e.g. older than v4.15 without
NFC_CMD_DEACTIVATE_TARGET).  See also commit fb7664e2995f ("include: Add
a copy of the NFC kernel header").  We should sync our local
nfc_copy.h with kernel sources from time to time, but it is easy to
forget this.

Add a separate Continuous Integration step to show kernel headers
version and differences between kernel's nfc.h and our local copy, so we
can notice kernel uses a different one.  This is purely for maintenance.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .github/workflows/ci.yml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/.github/workflows/ci.yml b/.github/workflows/ci.yml
index 2e1ad40debb9..8cd836d398a7 100644
--- a/.github/workflows/ci.yml
+++ b/.github/workflows/ci.yml
@@ -276,11 +276,20 @@ jobs:
     - name: Display environment and Linux version
       run: |
         test -f /etc/issue && cat /etc/issue
+        echo "############################################"
         lsb_release -a || true
+        echo "############################################"
+        cat /usr/include/linux/version.h
+        echo "############################################"
         uname -a
+        echo "############################################"
         cat /proc/cmdline
+        echo "############################################"
         printenv
 =

+    - name: Display nfc.h differences between local and Linux kernel heade=
rs
+      run: diff -uBb /usr/include/linux/nfc.h include/nfc_copy.h || true
+
     - name: Configure
       id: configure
       run: |
-- =

2.32.0

--===============6031123103054984628==--

