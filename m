Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4FA3B5318
	for <oe-linux-nfc@lists.linux.dev>; Tue,  1 Sep 2026 07:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246432; cv=none; b=HG/yjFUODuZMMwoJjwfb/ruDxdKnbQy8DfbRwB9G6rIujAKNtkqPR25igvPbaEAcE2aHxmR/tmSCxwRUe//HrougIxITLIP35+nNvBvfws4g0/5pLrFodTNoheZLE9UG0FbmjxH4fnCk+X8KYa6YeV0f37nnL3aeZtIjlSjM8yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246432; c=relaxed/simple;
	bh=FNflVYT5xQoaZ3kWaV8W1BzYLYuSaQ6DZ80e1DBpVKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFK5mhrCbXJTezkPE0jcs5Mt0BlYJJEsFQiNMrBrhgBMjzA37rUs0tjes5Qj3bBvE2SHC72ooUzXIxFGYaKslXZ/vx5jEU0ONoCYNv+BBj4eCH/VVpnpgBC06cbMSzgRyFAjRuTglL+td4He3SWDdDLxv7Qqs3IDdc8CcOBTw1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK44IVLd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK44IVLd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6efd73032so5835565ad.0
        for <oe-linux-nfc@lists.linux.dev>; Tue, 01 Sep 2026 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246431; x=1788851231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vx15wRXdK1l+pFtaaPtI7i08zanEbZBalZduAsGHYJY=;
        b=EK44IVLduzwaoRZwODSPqqscI6QEzZfug220O5ssq9Bgtmp+DQYiKIl0dh2gKNce72
         WoXOTA+5hNY4dGc9ir1kbIYHULbESJYx7GFQ0OxJ3GnZOclsziFvPbSVrEcLUkHKk5rF
         MBiDupp3avgDe810a4Sp92sTsTNc9nlYnsC4gX0YUrO0B04G8k6eN6xzk5xtvtWFLlCv
         MkK8YmpE+m5kA7HoEa2mjrbydQfb9QmlHkh1dcSZYUoY4I477ptcoTng6C1juoXGJlHW
         KsaEoWLbfSA1uNs0j7HQ004kxGa3dNJNHhwTL7MBZFvbgx2hcDSnK8jkjRVzLOF9iuKK
         LyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246431; x=1788851231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vx15wRXdK1l+pFtaaPtI7i08zanEbZBalZduAsGHYJY=;
        b=PK31qRhEJMf00ZIgXGlQBq48P0PeLAZVlzQTV+7C1N0CMVFjeuixxcTGlEshG4nUPz
         XZUZdsmwRohqbtvqz2+YhiOKyZs0lODixIDT+M+l9jPAkKvEY24w8x9pWeRCqDjZ+FFw
         6MbmVX/QZgNLfV3WRP2Mi8pSWynB8SaWPKstztLuBPcwWgqOiEBkZdFhHw3xPa9Gv5gP
         Z+1oi3k+hhCLrs9NW9mOejsibwq23/SArJmFG7qN3vWI5Avd8ClUCfvleZlDdN0TxRMZ
         18dHTbsSCAInZVmhHzUuoAKbYsjQj0DIkDkPhcX9T9PzohlQhEkbaIqHNcmO2+ImuFIi
         6VPw==
X-Gm-Message-State: AFuF++msmDjHBEAZp3GX0yUwHSKfTNhLNQeXCXQPWpc5XevkYTAfD8F7
	Z12Gmvmz/oUdLXzrOaJB25LUy4J7QfHOCFmTVUip5SPBw5k3F79ku5pF
X-Gm-Gg: AR+sD13Z86Y+P/WVVSJXcDsKfq9416haLzwLsblctsYxhmt/cIdPw/O6v+QTa7r1Q5Z
	Sp2gSIVunW85GlHIuWENwTXkJ8UKVGlsXq2i6gVVX4OXHatd13pDyYw7aQ3eBcKDNJyHZc7WFG9
	3pyp9ikICVQkzfjN5Y2KU5kMJcn8e62yl+ZYzhgGjLK0l1Re1UIuQD2D1Y+Tn2p26sXCsen+fNI
	GO6zkmjJ+7QQM2OSwUeoBjjhwgFT7nQ9UwzGkkdcYUuQOzeWvSa1z47BPWvvP41umUFsk3+nmts
	UU1mGGD60LHQe0fM4lTY90GFLpuvgagwMJV8noRv1LHBkbD5BZyo4qBrQllstwSVoN3E2wghC5I
	+gO1rs3czaTyaZvwe5wqMrZoSEkUZfins3T2b2QOE/82sgvaAP+/sCiFUoLsWGgmPqLnjxURLob
	UzF4ZEDeS3GE5caxwSmlc8ha3+jYIniFDW/0N7MoeKh0eMfswu30UfBwIxhJ1Vr9TSqvv67qdOR
	A==
X-Received: by 2002:a17:903:2c08:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2d952960702mr37706985ad.21.1788246430647;
        Tue, 01 Sep 2026 00:07:10 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm36432090eec.28.2026.09.01.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:10 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Bongsu Jeon <bongsu.jeon@samsung.com>,
	Shuah Khan <shuah@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] selftests: nci: Fix uninitialized family ID on missing attribute
Date: Tue,  1 Sep 2026 07:06:18 +0000
Message-ID: <20260901070618.3299012-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_family_id() walks the generic netlink CTRL_CMD_GETFAMILY reply
looking for the CTRL_ATTR_FAMILY_ID attribute and returns the parsed
value in the local variable "id". If the reply does not carry that
attribute, the parsing loop never assigns "id" and the function returns
an indeterminate stack value, which the caller stores in self->fid and
uses for subsequent netlink requests.

Initialize "id" to 0 so a missing attribute yields a deterministic
(invalid) family ID instead of a garbage value.

Fixes: f595cf1242f3 ("selftests: Add nci suite")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/nci/nci_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
index 312f84ee0444..ed306ec23895 100644
--- a/tools/testing/selftests/nci/nci_dev.c
+++ b/tools/testing/selftests/nci/nci_dev.c
@@ -182,7 +182,7 @@ static int get_family_id(int sd, __u32 pid, __u32 *event_group)
 	} ans;
 	struct nlattr *na;
 	int resp_len;
-	__u16 id;
+	__u16 id = 0;
 	int len;
 	int rc;
 
-- 
2.43.0

