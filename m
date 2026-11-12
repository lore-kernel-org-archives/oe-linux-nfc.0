Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479792;
	b=HmXH4i8CvultTjrch8PtxwuMz3SXsQ4WIzKqHj1Zvywjk6zfyxxeJ8MASSo+58x/hqOr
	 HL5Q/nqpaiyYjs/oToUMbUXEGuDLOFa2Upo/Oz8eIoruJMHw9us0iVqLXfKtJHWuYXsEX
	 BQP+3SKCpdCeQfJQqBdB5kLQxW/Fn3m2E/iTElnIjJt5hxHW9gOP12MlnkAPbVGYGOBHc
	 Lcoqlaar2s4i2ogNqMlx80n+0BTbuMkV/cQgXHWSLo8ARx9cFx94tQjcWpksd/7pZaHD8
	 dfaATQHxcX+pFR6oyI+Yc2jDET6CQyKf8zVy+mFSKZD0QWtJk5+PNRqWyuIsrhPvVLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479792;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AazEAsk7AgRZJ/1X0wf0AnTfGLKx3ePR+szUy82to1M=;
	b=e5nRF6gf+ylpn7BgTQk35xwTrCOY5syMyRVYWlKmxT3eTcTl+c7/fJkPj0YKomPBYF+Y
	 7BFRSLFFQF9LKOFPu28wF+O6bPLnEm2gsIYptkGvHbqAGC4IDYY2WzITyIaEVg8DZPmdv
	 zJqC1/GKuEjEVoowOV3GinszRTiwPDMUv2dp8xagFg+BR2XO7fQsynJ7VpwifVSEIE5fv
	 /HiVubk561Xiam9wSEcWhhq7/dvS1/vgrBVHpHp9bFDX2o351eh7fnB/WE5eWDal+IPKY
	 rdHN0/4lRlSWm6GmwU+RoBRsl+Q+evgQva/PfQGfnYivZIrHuxh9B47V5nNaL3tvu8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=JigvEjAJ;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD0606A886
	for <oe-linux-nfc@lists.linux.dev>; Thu, 12 Nov 2026 10:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10AD0606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=JigvEjAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794479791;
	bh=8R17N+nl0pxoL/AYQkf0ULWjSnupGqKL3Jsa9AysHI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=JigvEjAJLRaovI4O4d9Slq4P7kjtV8g6cn2D7p+8a3jfMrqt6f6jvNYrb2GtpMdJ9
	 w8GGjwqqmqSmEx2obPC48sCrciFdlEY4R+au73jjUGELIgyr1QIePQ1cy2WYEtrb5q
	 SOl4GAjssrXPgoB8EuDsucXYeg6R7oyXd5em0GxQ6iC4gYdW/WgIHXlhoqI8kq+Rsg
	 xjtqntnKOxqkF/y5zF2jN1cTRSTWPvW9QZs0FMkwkh72k+eCQOGADursHy1c/qAgs2
	 MIt+qxwMjGzoYASZdO2LKleBAY8rQEue+C/pQv/gaAZpOxcq/b0LLxmlo7thRP+K0C
	 qr89ahL00oQ3g==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 1360381A15; Thu, 12 Nov 2026 10:36:31 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: syzbot+9ef743bba3a17c756174@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	David Heidelberg <david@ixit.cz>,
	Johannes Berg <johannes@sipsolutions.net>,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: Re: [syzbot] INFO: task hung in rfkill_sync_work
Date: Thu, 12 Nov 2026 07:36:01 -0300
Message-ID: <20261112103601.1848657-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <000000000000788a6905f0c06160@google.com>
References: <000000000000788a6905f0c06160@google.com>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This looks like the device_lock vs rfkill_global_mutex inversion
fixed by 1ab526d97a57 ("net: nfc: fix deadlock between
nfc_unregister_device and rfkill_fop_write"). That fix credited a
different syzbot report, so this one was never linked to it.

The report shows one task holding rfkill_global_mutex in
rfkill_fop_write and waiting for the NFC device lock in nfc_dev_down,
while another holds that device lock in nfc_unregister_device and
waits in rfkill_unregister. rfkill_sync_work is stuck behind them.

The C reproducer, 600 s per kernel, x86_64 under QEMU/KVM:

  1ab526d97a57^  hung task report at 60 s
  1ab526d97a57   no hang
  9d66f26fefac   no hang (mainline)

#syz fix: net: nfc: fix deadlock between nfc_unregister_device and rfkill_fop_write

Thanks,
Magnus
