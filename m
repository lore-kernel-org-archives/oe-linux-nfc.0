Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196359;
	b=xx8BYriM7GpLAdzp/nV1WiA97zJSt1taJcYwWh2IZMXAKoRxa25W7CqJuAvCtKygTN0R
	 yJ1Wet5ItyqzvfEAyWIORZX4MhN1J3FKdsx2tBX2J4YVR6pauon5l5UWkN8vkuHHuekXU
	 33Gns9reHX3ZRoWrnAB3aMVSJNY0IuXgbegQFMbiHTPf7+7Q2rZoElXfREQIILfVAhdYu
	 h2vmBfHSK1dceQY2fK+O9G3jOzDaLC1RKxgtLTCpHayH9mAw+3vYqfJSERU+CUeMxLCNe
	 1tw4sRZGvfUihDwtB1NMtJjBM34Ztmf9WSU4eiO1zns55d0qwE1KbH87ken9EnO3eUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196359;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID;
	bh=UVNf9XVGQ9iwewOtqIQdfWKo+D0otSzQYSZuL2dIs84=;
	b=Tw5KL5h0kus1Qg1CykmUd4snWZ/RMqVSmfYV1/pue0Tguls1DGShzsZJYTV+u3JOXkYy
	 PqLt3ghlBzNeON7W0JFWMN93AL9Un3S8tckDZjvgDcEtjfneT5lye5NGo31dstOD9LUpv
	 Y6anzdizl4LC/PCvfAkyi/mfkUl5Gtm0UK+1y0V30G+qh76nQhd5ZI1dlLCesYIWA5n+7
	 23FMpiJsBrhzIHGeTqNRVJmas0QaY/rvDKIF48t5tf3skYlMsRM4fy8LDdsg05MnBiXG9
	 hNy+RJiYhwkvrtOiTICVbJiqsOQiHmca9+zMydwCq9zIMtJEoyrsDVIwhZUrXGjLlYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ve4dq0We;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986AA606A321
	for <oe-linux-nfc@lists.linux.dev>; Mon,  9 Nov 2026 03:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Ve4dq0We
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Ve4dq0Wef+DYULKFxR31cYHOIux8HOb3yvxrfd8gJMxr4mjTzCPlwEe1MNMhhsQc8854/njOGzPFN
	 GODg0cGMdhyrhx9Ki8KMHP6wBDmTxwNVtPl/vdKAwGdDSwB4tBbijiHwej17g1H8COt03wcxuzw3Bf
	 7YtTEh7dkpCV2Pl0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af14384f8a-9c305;
	Mon, 09 Nov 2026 11:52:36 +0800 (CST)
X-RM-TRANSID:2ee16af14384f8a-9c305
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.19] (unknown[223.108.79.102])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af14382608-803ac;
	Mon, 09 Nov 2026 11:52:36 +0800 (CST)
X-RM-TRANSID:2ee56af14382608-803ac
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
    oe-linux-nfc@lists.linux.dev,
    David Heidelberg <david@ixit.cz>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    Thierry Escande <thierry.escande@linux.intel.com>,
    Samuel Ortiz <sameo@linux.intel.com>,
    Samuel Ortiz <sameo@rivosinc.com>,
    linux-kernel@vger.kernel.org,
    yana06070@163.com
Subject: Re: [PATCH net-next] NFC: digital: fix target leak after Type 1 Tag discovery
In-Reply-To: <179419447430.488859.5809759694387881043@kernel.org>
References: <20261109031832.37642-1-yanxia@cmss.chinamobile.com> <179419447430.488859.5809759694387881043@kernel.org>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Mon, 09 Nov 2026 03:52:34 +0000
Message-ID: <20261109035234.47231-1-yanxia@cmss.chinamobile.com>

Hi,

This was found by code inspection. I haven't triggered it at runtime.
nfc_targets_found() copies the target, but the T1T success path returns
without freeing the original allocation.

Thanks,
Xia Yan


