Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315875;
	b=k/mP23NM4tk1JCirIRM7pXQZeqA89raBXyo4O5dlI6hXoOu98lYMBk5x0fiMxhmth1D7
	 IyBej+w3CWpnhSTnMw8Ju+PloG+T/vfM6eGzTcIMRVrVLFGE7qIu0WoY9UQN+rEwlXFbF
	 WjCFwVbzu8IqXEZ3H0IW9NOA9LlfS+32mU+ldSBHUvlfjGXZfBWvEpzWxDEAhYPKadDMb
	 OwspfB2pCs0CPfdF3by+kEqRK9UwQUX9HSId393CUt5sUv8wcmXNJt5gpRfup65NKmrNb
	 sXlaCGRptkQeE+lw6Es1JLMm193d5Htl5ANtjFkQXdgk0B1KHK1IjSj+tpwc4XdSakg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4oSKGtvEvHMaBkCfYGQi99m+gHJNL+J2+Aa0Qjrckko=;
	b=KzblJUsoX24NsNwHj16+c2w2B6T5HQmaMVqk2QiCzHrgVmJRz2fEnjnOLc3kjtxOoDKI
	 MEVGx00nJa2nEfI7zP4XYdThyntDZvKC6TG4WXNJcJxMzGWkyFDxaFOc05LJpbFgxPs6T
	 xMZZnHmFYTwZce1QplWDGosoLJWHObLElGjpEKcI5m/B8Ao7k/Dlafr+WEMEMfNqTjlrE
	 27q3o5RF5nTmu64Fu/c5aTdkx5QUDHohQE5jd+r0nQu5PXdl2/f1kNQpDSLEnBgtMm660
	 FhTDzriEXIEWQMH6G/41F8lfAYS0BIm1xmBoyg8K9qcYiEChmAlTzj/z4I25cmMot3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkWcbiPN;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08B1606A31C
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 23:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C08B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkWcbiPN
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98c8cbdb9daso35712241.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 16:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315874; x=1793920674; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4oSKGtvEvHMaBkCfYGQi99m+gHJNL+J2+Aa0Qjrckko=;
        b=AkWcbiPNGWheaVd0I1f3tJnIEPjvhd681oET9jtjiISZaqqdwn0a/Xctbq+Xq0V1XL
         ixyoyV+ifG0L/PZr3sF1zpaZPCKtmGcPB+TLHK6Yq9N48/n2aoKjVT7mokcMi5S3YqCk
         WOzxbGsvvXCEvA0eXIr14ygaBRBHWsX1O51fNydMf0s3OIIMj2vMbMEqEj4ic77tOCAM
         Bpc0vGqZxW4hS9Dc586MEMWqs48duJCHcBS+69brV4KoXzgcYvd5k42aYm4500KeQqoL
         rT8kvSj1brmGymtoDxWfHBXV2smcxTZfiemgrDrEd5n3i5xh7htKcIqFqsOELSM6fgRL
         sJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315874; x=1793920674;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4oSKGtvEvHMaBkCfYGQi99m+gHJNL+J2+Aa0Qjrckko=;
        b=TLfqcjv2wFCuWSjqDwvG6qvEBAmQmBFnRz+kRh3l0q0yAyncsMRoRhSMlRkFi1pUIE
         YNz9DHnokbZwb35ZDi7CRGcid/v8U2XvPqGeIYIOeL+UQxPk3X0pV3y572GaODC6ouIc
         phoGDFJoufq8bO+lChC9QRfbTMYgDbiu8STqBZYb43Rx1rm16pkiCvbK0635tpymnt6e
         SiQ7aSakkzk8fGOO6Hup5rYkkuYqbH56fbxOLpx61DAOfhKKlMl4ysIug0WzqkYWDrXv
         Ib2WMLAkkO/rbIla0SU+5I3ZHQlW3908dnLtXm8XeDGstPUcBSpTT4fbdMs0xFE+o3LL
         G0Ew==
X-Forwarded-Encrypted: i=1; AKwUvBxbJ9gI2wXyR+MBypMZHvUmuSdNmSlyKPnEhBoSueCUhR2BXOsxJlutdZ4djdZdN2oSlKMGo5alLLnwILM=@lists.linux.dev
X-Gm-Message-State: AFq9FYItwbE8H9Hcs+5qq0QWgvdKtq9QbUNqAJsNykJp3fPvIDBkKV8u
	8Ox6Qe0UnRWUxWMqiWTnQGaIEOvxM3GAtFxB6jpDwPOiNEc1uH8SS/eZ
X-Gm-Gg: AYBFou2uhtoPvvVfewoAKNnOGDf8wmtCr5r7MQqj7KAzCxNJaV6oD23V5HOqnoexER6
	S3An5982LIAk+3moh3zl4P3Ph5ofrgv3MMrpx6sFw34k9UreJrMk//0tMCrikZMRfF0fDl/fKXO
	7cwruBukvAqqwb0aDUgVrlCBQSZT3h/xvev25bI57We88eg42PHTQyumqjqtCr+EP7Po/onRIvA
	hrBoerkUtDxazNLiJUHf9IKyK5cYuVo2/u5qO39tpKX7mnnYmeL2xXvo9jTkcSQrbP5fn4ZSPz9
	/p0UCF3cale1WAhEe7MC2ry0wdTh7Vx/vxDdqolxtLxgyLbC8HztzOLdb5MO3ix0Yojc4oEvf0R
	hvrJFGd21ZdRkMaDotXokGkhWXBibWPSG430nNyKe4qSco1d5UDDEV3vrAKPxmxJF74SJjr7lsX
	COHLyHeFEvwEKj9IFrhXQbmeNd569e5nE80gVxDvobAM89NqTwiNKhe3A09A3IH6PBaDERZtCRI
	wL92ntA1z5WzDy/7uVHb0xSk1uu5vjj4ThYocwLGChdL74kR52MmFgoAa1wYXdc1ZW1IwLDTfo/
	Om7bNaKND63glvfJ/rmk52C874/tBZ8lQC+q+Uq6m3fYL3Pa4eX7aHCfOHBwsN0xWmFuWzqLpbJ
	6KeD3mpac1ckiFzYIM+N3oFqraGipWgM1FUw=
X-Received: by 2002:a05:6102:c86:b0:7c3:fc96:fbdc with SMTP id ada2fe7eead31-7d072d663b4mr347181137.37.1793315873632;
        Thu, 29 Oct 2026 16:17:53 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:17:53 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/5] nfc: nci: don't drop data received on HCI and
 loopback connections
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.8986243734262725676@gmail.com>
In-Reply-To: <179331585573.30322.4049957541187612575@gmail.com>
References: <179331585573.30322.4049957541187612575@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Commit 8265a626cc14 ("nfc: nci: fix double completion race in
nci_data_exchange_complete") made nci_data_exchange_complete() drop the
received skb unless it can clear NCI_DATA_EXCHANGE.  That bit is only
set by nci_transceive(), for data exchanges with a remote target on the
static RF connection.

The other users of NCI logical connections do not set it: HCI over NCI
(nci_hci_send_cmd() and friends, used by st-nci) and
nci_nfcc_loopback() send with nci_send_data() and rely on their
data_exchange_cb being called for every data packet received on their
connection.  Since that commit every such packet is silently freed, so
each HCI command and each loopback request times out after
NCI_DATA_TIMEOUT.  On st-nci, secure element discovery fails when the
device is brought up ("SE discovery failed") and the HCI and loopback
based vendor commands no longer work.

Seen with virtual_ncidev and an emulated NFCC: the response to the
first ANY_OPEN_PIPE command is dropped and nci_hci_dev_session_init()
returns -ETIMEDOUT.

Only claim NCI_DATA_EXCHANGE for data on the static RF connection, as
before that commit data on the other connections is always handed to
their callback.

Fixes: 8265a626cc14 ("nfc: nci: fix double completion race in nci_data_exchange_complete")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
 net/nfc/nci/data.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253edea5..76ec891a0 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -46,8 +46,13 @@ void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
 	timer_delete_sync(&ndev->data_timer);
 	clear_bit(NCI_DATA_EXCHANGE_TO, &ndev->flags);
 
-	/* Claim completion atomically -- both close and rx_work may race here */
-	if (!test_and_clear_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
+	/* Claim completion atomically -- both close and rx_work may race here.
+	 * NCI_DATA_EXCHANGE only tracks nci_transceive() on the static RF
+	 * connection; data received on other logical connections (HCI over
+	 * NCI, NFCC loopback) is always handed to their callback.
+	 */
+	if (conn_id == NCI_STATIC_RF_CONN_ID &&
+	    !test_and_clear_bit(NCI_DATA_EXCHANGE, &ndev->flags)) {
 		kfree_skb(skb);
 		return;
 	}
-- 
2.43.0

