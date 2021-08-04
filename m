Content-Type: multipart/mixed; boundary="===============3644895360934865199=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-nfc@lists.01.org
Subject: [neard][PATCH] README: describe contributions
Date: Wed, 04 Aug 2021 13:19:56 +0200
Message-ID: <20210804111956.86833-1-krzysztof.kozlowski@canonical.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3644895360934865199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Mention the linux-nfc mailing list for contributions and current
repositories - GitHub and kernel.org.  Document explicitly that
contributions can come also via GitHub pull request.  For many
developers without experience in development of Linux kernel, the GitHub
PRs are easier than the patch-email workflow.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 README | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/README b/README
index 8204b690eda0..509363bccac3 100644
--- a/README
+++ b/README
@@ -54,3 +54,21 @@ disabled with the following configuration options:
 Running ./bootstrap-configure will build the configure script and then
 run it, with maintainer mode enabled. bootstrap-configure will configure
 neard with all features enabled.
+
+Bugs and contributing
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Please send bug reports to mailing list:
+	linux-nfc(a)lists.01.org
+
+The project development happens on GitHub:
+	https://github.com/linux-nfc/neard
+
+However for historical reasons the releases are also mirrored on kernel.org
+repository:
+	https://git.kernel.org/pub/scm/network/nfc/neard.git/
+
+Contributions can come in a form of patches sent to linux-nfc(a)lists.01.o=
rg or
+GitHub pull requests on mentioned GitHub repository.
+
+See also HACKING and doc/coding-style.txt files.
-- =

2.30.2

--===============3644895360934865199==--

