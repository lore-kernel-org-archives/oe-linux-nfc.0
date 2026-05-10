Received: from smtp.smtpout.orange.fr (smtp-11.smtpout.orange.fr [80.12.242.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E32FC876
	for <oe-linux-nfc@lists.linux.dev>; Sun, 10 May 2026 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778443999; cv=none; b=jS3ZLXLRQR6g58N4QKE1NXLtVuJJ309Q6f+iNa5nO3Tx8bTezdVfhEz0wrhXN1FKpq4vyTRcrwWqJ18UfZ7lqVg2fTer0+laqZApMCgRiLu2mGo/yXwZIU4Y6ZPrSZiArMnJ8KovlNRH4A/p3ju3l7vMLPA7T8k6WYGk2r6h4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778443999; c=relaxed/simple;
	bh=rDVkNd2WMkgMRAdl2SG+jRrcWpiaAUfMuzLmFKcvD0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9d4ExJt1TfNlBex9CTrkrS/qeriqRayDjJS8sFyyeP2aUQ2MmMTgL2DIJL9w3ZUO/10P8/MW5RZj23XlmeEzKIPE4zZ6ZvnAOftB0FiooiX0PK32KmG7u6NoT94tDN/aCIf+JYSxUhX3E1DzMj7Z3xynBzRelqb5FQaiS/i7W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=tKKAYX0F; arc=none smtp.client-ip=80.12.242.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tKKAYX0F"
Received: from fedora.home ([10.64.95.105])
	by smtp.orange.fr with ESMTP
	id MAWSwESSHYKcaMAWSwDFsP; Sun, 10 May 2026 22:13:08 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id MAWGwR6PjEbAgMAWGwTzjE; Sun, 10 May 2026 22:12:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1778443979;
	bh=XolC0r9oYNCS4EPOsPRFpC6rNlihVAxe7GPmi9ew9/Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=tKKAYX0FsnkHgAo7jQ2IgSFGN5qj9FeBQFid32FxQxdOg+SycBk/Q7IqHOCBdXp2B
	 84rm8RsiW4e+6cgEuqdasIdwUUkBUWmtASrjLzu+L4Q54gIQCC24WpyUME7NisVd52
	 BVwcax2lLyWXi0nvKsPK2yG4zH8Ly1h0i197ZBmIro+PEu7cWs3DDHhJKV5X0qsDBD
	 2Yrfb4hGLm+RKzU13vLuuX11+eWJAsp6Jrjkg0QbnzBEErhR2j8AI1cZWGTnUpqq+n
	 x/PuZ3+LQthPZ9ZhjoErIwAavIrCTpCv/hhUp+SrM/iPcfmm/kxhERaPrFiDllOUcA
	 7Jczv5NV8A96Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 May 2026 22:12:59 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: David Heidelberg <david+nfc@ixit.cz>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH] NFC: nci: uart: Constify struct tty_ldisc_ops
Date: Sun, 10 May 2026 22:12:52 +0200
Message-ID: <c756755a72cdfde2877a18ddee01eaa4f633c220.1778443960.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct tty_ldisc_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  11454	   3352	    256	  15062	   3ad6	net/nfc/nci/uart.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  11646	   3160	    256	  15062	   3ad6	net/nfc/nci/uart.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 net/nfc/nci/uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/nci/uart.c b/net/nfc/nci/uart.c
index 5a3aed7f84f5..aa20e8603f32 100644
--- a/net/nfc/nci/uart.c
+++ b/net/nfc/nci/uart.c
@@ -421,7 +421,7 @@ void nci_uart_set_config(struct nci_uart *nu, int baudrate, int flow_ctrl)
 }
 EXPORT_SYMBOL_GPL(nci_uart_set_config);
 
-static struct tty_ldisc_ops nci_uart_ldisc = {
+static const struct tty_ldisc_ops nci_uart_ldisc = {
 	.owner		= THIS_MODULE,
 	.num		= N_NCI,
 	.name		= "n_nci",
-- 
2.54.0

