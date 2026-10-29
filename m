Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315868;
	b=tuVpxNitcrru9xyGhPxQ1DKBJ8FLwCGZX9S0SMBM/ebFIMTcwllbPRHL/3ST2+pJSfVu
	 iNdO8K5rm7y8vJ2vGrOEb0hbTtjt4CkdNolUgmJDd2t49ulSqIdc/T/1e0AUsTITti+Ef
	 tab7mZKQO90WLuS5GrTbCJ7L5hKgO7PJj9iSsqC33iTkE2uo+q82DHK6ql4BxvUMu1i0o
	 B6NtsoCNZcjmoL7tpp0G8Pux0wsdoLkZUtDZ5W13Gi70W8RPSD4Tmn1r3V2ztg1C7YR2w
	 90lzliQZnO+OTZlJZ4f31is56ds291ybuqkWv0gV1i0UALeKWWj3OhxLKmyPeTslajg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SPEnqdGMpTzdZwWJhFlJuppIlSs2KDhs9MBrZg5NKrM=;
	b=KuTO04bH8F9xImFTbQw3g6C6E5gTo+VDaJ5TjyJVikc7K0HE1uCMlsVpC1pTIIVhrSvg
	 T4NRGvMvZrivxRVJDkHQW5g01ubj//eRGDW35Fbl5jBf1w+WTCWvJMFGp+bQgv8ivuB1v
	 C5WvRdaflDf2RoNR3NGrX749pxcGuXBidhbidPNT+LP+Af/wEjtX78KnnTmai97p7vD1O
	 dY83ODuUYZq6OL7JVVCcivDTQ34PSyma/kvw+9Qwaz50UTiQFr4ZhSzBX93fc16u63Ggr
	 ySbpBV5QHb4rcpi00+IyJ0wYgBksOT+IevtDu9RDUFv409Cuk52nuQx191bsKFKrqVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7J35tuD;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC5606A31D
	for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 23:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FC5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i7J35tuD
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1060068137.1
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315867; x=1793920667; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPEnqdGMpTzdZwWJhFlJuppIlSs2KDhs9MBrZg5NKrM=;
        b=i7J35tuD0t8dswwRKdQ+E7kjeFTtDj4Oxvu+y/7O/1fXTDrqutjVtI86W9TlGogI5m
         3/B/7QTACkqIQVrS8udyxKPtCtiMwzu4Sq8j9tf3xmraOhf7eMgiuaszji/AvzHFXg/a
         XsUlCT3lznQWlR/NCLjA6BASpBXInfcRT9ujG5c90M2zCHX1IInQBKBP2XPtglJr5HFU
         vsxPDo2NFJBzpcRajUsNRa6YFatdOLm/N8M2RGYC5K1YjfQQp8tiBar8zIpUJuobjX0M
         oLHOGZpJ6UZqy6JzF8thiFi/dGJ707fc2pL2Sg0qrTVeEhAxHaw6fMgkP5WCGnjvmMMq
         gIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315867; x=1793920667;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPEnqdGMpTzdZwWJhFlJuppIlSs2KDhs9MBrZg5NKrM=;
        b=ZA98pk1APFSR/wlgJhsqgqnlZax7j3KtSQuFPxGv2iSD2FxvR9K8syE5gmYEXGGoRR
         t3zjeJdQTT0JHprICGcQDFf0F1+MSUMGPpy+ChQt7a5GXd/+G95vnBwb6e7tUu0Kl3Tc
         iiWqPxy1JnInX0uCbrxRQT1SY39k0xzwNifOqn5oxg/ZSlU9ozvzJJbhCpHqf+NRFXat
         Ca4Rgwsg5WdhjFsCtVydW/bnbSp4rNyutXjyzJlSfok0IKnfXzskEZM7VcyxOp+TZhwO
         TrAxdaH2tIIEnsmm/j9o9PGDNN8nfTFMNqDglo2YuIY6gHcu57XtwL6fZFtJt5nqmtyy
         L8RA==
X-Forwarded-Encrypted: i=1; AKwUvBxi/btHxB1q3T9bJ8weBayjasW8rk1+sZskHoKdnzIYTnc9DbXgebP7Tq2OqE9pHeExFh9ryNiWMERAmYA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKWclsHMMKElDd8sgvG4xkBLYdPqk+uGZJyuD/kBZcMIFU30ZD5
	NPcZC3qVxT2/0ThHxbzHrifDqnKEMvl9+h68JD00WePU3AmzSuTa7wm+
X-Gm-Gg: AYBFou1fRelcY1vzRRWMRy7KayDOLDtHtfR+LhtKRDnzYf2vIiafDea/q6dvvpG/DqR
	wxj7ARCVAwCUfOooGI6pz190BezQY0Hs27u3hApQ5pWRpPs70Lh2EDQDKnT1spymp1KFhK+/+OH
	zD9b2JZEGzqLSJAaJQlLpOMXq5tK6WNq0sGzrOUsch3A+560F5uacMHmDHWj4MkKADOcGYLS7do
	hj6c43tqTU1eQ0uL7V2Og4n1vUOpKV7mOUo36xPzpt+Zj8x29ZZrJdMkyt2rXGzLLfvX50ROdfX
	JAcSzCeuS5UH1asbSTSSP+Vw2jxs6w2Vz1fSzlZb3gipexPSiIf1A608QxrEBADm6pIEk+PlBV0
	4dkVlrfVTt2UVVv1WCgVwkRtNtymVGbOSs7ndqdmnZbRJl5ZKAdy6amO2H7ttnn82oPLDBmMg2D
	Fe7epgkOGfHBbKEb3U8QyYJA8J3hkefWfVmlm3XCifoDIdojyjICehwPwPekHmnEEJ0bd7gy6a5
	H8wJ4MItboUzmBLW5qK1EI1iuWxm4y1TrszowDxQrWEP9Q9uS3NvNEXqFYNeaXt6ns0mq+o1SmG
	V/ZXrFUJ14zx4VEcQ9xGJ3CiqFanP8si//U5oX1dqRLWqs67kbFxWESSd5AJQGFTynqupKwfaBU
	LGp+drAc9D79A
X-Received: by 2002:a05:6102:950:b0:7c2:b741:2391 with SMTP id ada2fe7eead31-7d0542f8019mr1629209137.30.1793315866785;
        Thu, 29 Oct 2026 16:17:46 -0700 (PDT)
Received: from [192.168.15.16] ([2804:1b3:a2c1:77a1:5cd:8fee:f3c:4da7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm319509241.11.2026.10.29.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:17:46 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Zhenghang Xiao <kipreyyy@gmail.com>,
 Sanghyun Park <sanghyun.park.cnu@gmail.com>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net 0/5] nfc: fix HCI over NCI and NFCC loopback response handling
Date: Thu, 29 Oct 2026 20:17:35 -0300
Message-ID: <179331585573.30322.4049957541187612575@gmail.com>
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

Patch 1 fixes a regression: since commit 8265a626cc14 ("nfc: nci: fix
double completion race in nci_data_exchange_complete") every data packet
received on an NCI logical connection other than the static RF one is
dropped, because only nci_transceive() sets NCI_DATA_EXCHANGE.  That
breaks HCI over NCI (st-nci) and nci_nfcc_loopback() entirely: every
command times out.  The commit is in mainline and in the 5.10+ stable
trees.

Patches 2 and 3 fix the handling of the stored response in those two
paths.  conn_info->rx_skb is never cleared after the response has been
handed to the caller and freed, and a request can be completed without
a new response (an HCP event or command received on the pipe, or an
unrelated NCI response).  The next command then reads, modifies and
returns the freed skb, or dereferences NULL.

Patches 4 and 5 bound the controller supplied pipe ids used as an index
into the pipes[] array in the st21nfca and st-nci load_session
handlers, as pointed out by sashiko.

Testing:

- Patches 1-3 were tested on arm64 QEMU with KASAN, using virtual_ncidev
  and a userspace NFCC emulator, plus a test-only ioctl in
  virtual_ncidev (not part of this series) that drives
  nci_core_conn_create(), nci_hci_dev_session_init(),
  nci_hci_get_param() and nci_nfcc_loopback() the way st-nci does.
  - Without patch 1, the response to the first ANY_OPEN_PIPE is dropped
    and nci_hci_dev_session_init() returns -ETIMEDOUT; with it, session
    init and HCP commands complete.
  - Without patches 2/3: slab-use-after-free in nci_hci_get_param()
    (HCP event instead of a response), null-ptr-deref in
    nci_hci_get_param() (no response stored yet), and a
    slab-use-after-free on the skb returned by the second
    nci_nfcc_loopback().  With them all three return -EPROTO, normal
    responses are still returned, and KASAN is quiet.
  - tools/testing/selftests/nci passes (8/8) with the series applied.
- Patches 4 and 5 are compile tested only (W=1); I have no ST hardware.

Sanghyun Park's pending "nfc: nci: Fix conn_info use-after-free" v5
touches the same functions in hci.c (it adds a NULL check for rx_skb,
but does not clear it); whichever goes in second will need a rebase.


Joas Antonio dos Santos (5):
  nfc: nci: don't drop data received on HCI and loopback connections
  nfc: nci: hci: consume the HCP response exactly once
  nfc: nci: consume the loopback response exactly once
  nfc: st21nfca: validate pipe ids in st21nfca_hci_load_session()
  nfc: st-nci: validate pipe ids in st_nci_hci_load_session()

 drivers/nfc/st-nci/se.c     |  8 ++++
 drivers/nfc/st21nfca/core.c |  8 ++++
 net/nfc/nci/core.c          | 18 ++++++--
 net/nfc/nci/data.c          |  9 +++-
 net/nfc/nci/hci.c           | 83 ++++++++++++++++++++++---------------
 5 files changed, 87 insertions(+), 39 deletions(-)

-- 
2.43.0

