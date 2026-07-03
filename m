Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1234554785
	for <oe-linux-nfc@lists.linux.dev>; Fri,  3 Jul 2026 15:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093660; cv=none; b=MM7A7a767CIeFIw9DO3APk4WAbvUC+E0vjizmvbwo6zz4w/4tZJRoxworD1bxPm4ATR8BrRjup7krwRhDRhT98icdHipprDFWmVtvBimwvrxd31Rn1DPs+jyvx/UHWL2idc5f3h8o7WVKJwHsPzNQMriv3y3nvCXXFaJQWyiFoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093660; c=relaxed/simple;
	bh=AESz4kz8frXFTeTkqEQyF5UVy4ndePzOcC5upXuxz/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EZGvLQNdo/mjuecGV65mUcBaERCNnk92kS8FqoZHCNLG6LaQXZ8g71JS3RwbZk9Jfv+C/Koux3a5ETVb7VGLpwZoPp/oXW+9yz+xEOrTGCr1k5tPqlzCf3VbNQsozequCSfWcmQpVnGKneQP7Bx2mQ4veayPaeiwA7NmIhGCBg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lWKHraa9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lWKHraa9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b1710405so3947935e9.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 03 Jul 2026 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783093655; x=1783698455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyC5/dv58nEZH7BfzhhlRnGtfxHwGoglKrz5jjPqm78=;
        b=lWKHraa93LQkpTV9LifgemwVbSFqwWygo45nToDKsn6OHi8BVwrGfYms32tvDPggZ3
         u6SSO/zCxVAh/Bc4ub5oGGzzZwON15+0LNVTOLLjo/6s5Rd2aO+NoDIcHEi4UQNjrJCi
         ZamcyJVpjg7HdE85xFsIl8GSnOrCKfglgXWxjiQuQs/ZH99C9TiZk5NJWXqP5fdCHeHl
         BKz+hhIkgGz8skG2tGrj3C2bgptY1aeYFGhayN6Ib6NedCWC768G9CrBbMQvaWr/WN+M
         gz0yyNdSIzNvZ7GhmY18XeYnHq2jbGDLfgcjVaXDmwHzWCID+8dXL1EXRwc8UQClOiTS
         WvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783093655; x=1783698455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyC5/dv58nEZH7BfzhhlRnGtfxHwGoglKrz5jjPqm78=;
        b=YqPzvK21k2QNQd7CjwQGDyQMibYysfH1IhfWdZOq1MkpcoVvuDFYVbtxk/zbYBcGVL
         jerKYQ3TzoFptPSafsxsjVa18zygz+bO2FoDrI9gapM6F2mxSuJqUf0Zs6gAuTaUhcRl
         7bVLpyxJLZrcLuTigE2O4gIZXDPWO3CV7TM0G+M3dswrTFd12OJBh7iTGmRP1uWTyosQ
         qfp1DuX3DOZ+gamQT9KNgJ0eEXsKCb62xe2gohX3xwfQ+VQjw33FVBuBAMgFSrB+lm2y
         TLr17qv0DMWwSMyEWGZ0T0a9wfodJ0t9HV57/y5EK6r+fu+D3WXg/RlVbfLqgwNcqqmT
         Hlmg==
X-Gm-Message-State: AOJu0Yy5XlTk7eBn6AGmwtA3ZxnH3L+XnC5S87KVmOO2PXcGj/vx0Wux
	QXnQ0zkWrEpTWYonftKOsdPtsUOVTuvrQCcTnWLFNoCTJ+yA/GBhU/6Lk+gZEiJGxlU=
X-Gm-Gg: AfdE7cmgBMZa0vxy/nYfYtUplq7WlKz/Ii6eezfo6yWNaHRSS7XLWyjmWNA1wVrtY3n
	CldQeDpbY/MNVjbzdwg99XRKXRz7tfNgesuZwYJC9/yws7TF+zcR/v85ftQigO9MfvEWLntQcI+
	Do3Cib5zUaTRRpEkp1zDLA0zAvPtIjlTACcmrG0FRPU0jwsoC8YcHyzEn9qoCx7vT4rr5EOJOJ6
	A8mzbKlcigrdd47tVd9TQkKuNHMHVtduDukKKpxR6kLKD69/Lbc3CHFJa9KeSfFlq/DrhsCySGQ
	kTVPd3TPU5c2ZxBU70ANN1SxEwI2RbYl20v06kDQlYEjh9VG0kJe3q3ijOX+DW+9N2cGd3zRY8N
	QXa1yNFuq70+gTMPIkZl920DwaC1qdjALmcht+TTLn68XhyH6PL+9fXXV7kfCuQR2OEFGa60dq5
	h5sSa2evBIT46uN8boP6SIJ0487q79oCaZ/fvOTvGIJAY8q196TJkZMDQrmKp0gcHSvPA0vNygA
	VI3
X-Received: by 2002:a05:600c:198a:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-493d0f0978dmr4377045e9.5.1783093655545;
        Fri, 03 Jul 2026 08:47:35 -0700 (PDT)
Received: from localhost (p200300f65f47db0472e4f1e98703de96.dip0.t-ipconnect.de. [2003:f6:5f47:db04:72e4:f1e9:8703:de96])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493cce1947bsm60309585e9.14.2026.07.03.08.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:47:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Tomasz Unger <tomasz.unger@yahoo.pl>,
	Carl Lee <carl.lee@amd.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Jialu Xu <xujialu@vimux.org>
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH v1 00/12] nfc: Various cleanups around device_id arrays
Date: Fri,  3 Jul 2026 17:46:14 +0200
Message-ID: <cover.1783091699.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AESz4kz8frXFTeTkqEQyF5UVy4ndePzOcC5upXuxz/I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqR9lQMT3PR8NKnniKF2TQinPW6MQDj+Lz0++B9 CEb1392jSyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakfZUAAKCRCPgPtYfRL+ TlBiCACjQyKRcLsLCwS9/Vy0/lTVfQuf5I7DmyVfo+sQxFJ/+EUzZ9klq981bu5wW286CPciTap 4j41RWytP2MtVKtWfzK3CVFtr2Q/lZQh4VjJYzkuDZaHf4V5V0WkJ5ArMo80SnsNs1gZl8yZkIj PLPO1YjFXu5Cuc7Gv92tHU5m+e03mf3R6TQCu3ZxXeQXbU0RW0UhSYhDPQDt8nkyKumXyVRluhn bW6KAbqPRt7dTTYWB+byLD7Bb9MGFEXhjthTZ1030k07NPz4H6kV7U8Tw/2PE6XuesckFD3pQ0F mriJiwJ6khoIZcOQ2brWW240rVb4uRG541iEhyOVZ0YL2O4c
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series's objective is to convert device_id arrays of various
different device types to named initialisation. It contains a few
cleanups left and right that I spotted while working on these changes.

The follow up change is to replace .driver_data by an anonymous union,
see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea.

The changes here are not strictly necessary for my quest, but they align
the device_id structures to how they look and will look for other
subsystems.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (12):
  nfc: Drop __maybe_unused from acpi_device_id tables
  nfc: Drop unused assignment of acpi_device_id driver data
  nfc: Initialize acpi_device_id arrays using member names
  nfc: Unify style of acpi_device_id arrays
  nfc: pn544: Drop empty line between i2c_device_id array and
    MODULE_DEVICE_TABLE()
  nfc: Initialize mei_cl_device_idarrays using member names
  nfc: Drop __maybe_unused from of_device_id tables
  nfc: Unify style of of_device_id arrays
  nfc: Drop unused assignment of spi_device_id driver data
  nfc: Initialize spi_device_idarrays using member names
  nfc: Unify style of spi_device_id arrays
  nfc: Unify style of usb_device_id arrays

 drivers/nfc/fdp/i2c.c       |  4 ++--
 drivers/nfc/microread/mei.c | 10 ++++++----
 drivers/nfc/nfcmrvl/i2c.c   |  6 +++---
 drivers/nfc/nfcmrvl/spi.c   |  8 ++++----
 drivers/nfc/nfcmrvl/usb.c   |  1 -
 drivers/nfc/nxp-nci/i2c.c   | 10 +++++-----
 drivers/nfc/pn533/i2c.c     | 10 +++++-----
 drivers/nfc/pn533/uart.c    |  4 ++--
 drivers/nfc/pn544/i2c.c     | 14 ++++++--------
 drivers/nfc/pn544/mei.c     | 10 ++++++----
 drivers/nfc/port100.c       |  4 ++--
 drivers/nfc/s3fwrn5/i2c.c   |  6 +++---
 drivers/nfc/s3fwrn5/uart.c  |  4 ++--
 drivers/nfc/st-nci/i2c.c    | 18 +++++++++---------
 drivers/nfc/st-nci/spi.c    | 18 +++++++++---------
 drivers/nfc/st21nfca/i2c.c  | 14 +++++++-------
 drivers/nfc/st95hf/core.c   |  8 ++++----
 drivers/nfc/trf7970a.c      | 12 +++++-------
 18 files changed, 80 insertions(+), 81 deletions(-)


base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
-- 
2.55.0.11.g153666a7d9bb

