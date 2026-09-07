Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6B36D503
	for <oe-linux-nfc@lists.linux.dev>; Mon,  7 Sep 2026 04:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755985; cv=none; b=N2/NhRLxUKHr7P/otgEZY+nia7XZ1auSezBP974Cx7fSTrf/l/Q6vLHBLa4rFD9nZUCFt5kFnfDjsbkGYQ78tJRjdbVj7megjeT+EpJMAuFm4yzJfcd4Vs9ajZfp5XYij1I46Zkjrqj4Xq9ixtgLYAau09Tv+uuGS/PH7dxiMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755985; c=relaxed/simple;
	bh=ZOTfKCoBvZ8X2fVSiTYkgdUHIl/7Lb1bKVTydTmegio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mj9Q7FPsdqJUat9Np99Qz6Dvq6ObJmTlljENF9jmrD+Wm2pQ+Dw4omvuOrHVfQGBnl051GwiUHgm4U0lddMgjfKh7tRGPPrGxACCXPmMDiizh2vQjtJRRo9hUGDaTDDWPV6mPCLYK0INt5iVjyvhHCA5icfYVOXZ0qtbSTKnuyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwT1JiuW; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwT1JiuW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so4144465a91.1
        for <oe-linux-nfc@lists.linux.dev>; Sun, 06 Sep 2026 21:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755984; x=1789360784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkhbZBCj7/qm8qxVuCQ8rZEnICP00ztj13alA8D5Jug=;
        b=FwT1JiuWO9NDTgIfCbzN0N1JNm5EbFsHqpuWkUO7Owuva5gTxiO6+qdazWSs9ay/F4
         2pMhmQPxe6lkB1C6LU0Fl29GZrpXzSyJQieynHDZDHDxxdr+GF+rofvMD+igkBpUPvHt
         FKLyrx6/FxaXoFbRjVt39Th8jJZyR7/C79RR27O5soqje2lfXnTtvKfB3oqa5LSvUqB4
         Zp/JvFtVvW7K+mZxC/MFakOUeXIHiHsqDxGUI/saKIOuP5WlrZFi3LmmYGeawLpX9WRA
         +VfiD/ihrbj0HfReYHICqPE0C73+vxtmdRiYVHEQnQ1QeW8RkMb48GGZnDF40jr4C9cW
         nlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755984; x=1789360784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkhbZBCj7/qm8qxVuCQ8rZEnICP00ztj13alA8D5Jug=;
        b=GTFidddO+KeS6LohLI8zjQaK1ilytmThFq5Tsoczktp/BZFZhGEeOFTvQd37hx/J5Q
         SzG5wghmc+lx4pYbnX3SWyRZuSfDDPLuR+E74uU0O0It1z/SNXf3wUSRCaihDEJkngtl
         3LskG4bm82vj18teNzyGqiQ+t6ElQx3qjxXnfgMlooxgd7yEVRh9TOEv9SohXVLAFth6
         b8yYdSPHK720F4Qf9w1BVsHLKAsy3g6Wr3PnrTuqgOE9zulvH7Mhv2sdyoMPtQqKgTMW
         jAiiLC/zeKkugIrIX+haOFI0V1xtN+J6skdnaBLAEnryNIM65LOSemrjqHS6i98VMZM7
         00uA==
X-Forwarded-Encrypted: i=1; AKwUvByKbELLA2V540ExSw9M47YgcnaCmeC0x35vIYeMPycTVFiDjupxniyHNZy32YcXBq9amX4COeohhCP5hh4=@lists.linux.dev
X-Gm-Message-State: AFuF++mn3EVW4QIu1nTbfdU6fjbrzjTx2saH2QhAM2rDDmn3lALDqqNk
	ZzLmGORAQ0dtA1gQw03ZDqXL8h6XPciNvlchXMViQYJLlMXTbWt/s0Ex
X-Gm-Gg: AYBFou1JTk6C0M+yqsgUWIDjs0lFYnDam9XPuUm/2QNReAPDo6mqjlKnJrBDRv6ZFRj
	8T9m6o7/cW9U/ONF6L9YSMHmd7AKnQ0XYUTohCJQd8G/ce9Fvx6X7Ohw+4jskWv57U88fOEQuBR
	nZm82pD5QoxydrGQTXV4rjWWA7QiGYOwrDcIJThjo0/EFMeDrqwEYAMxOUx1A8f7koDg6jTFHm+
	carimtej3D1ZA5nxMgGQ5um4XZyOVXCMs/uIUUDm98cvI9xTUUtpB7ZY22u1XnzLRPYq2bm3OIU
	wQUoep6ypsDRECKZPL9y9AyApfX31f6oT+M8zQ3IE49tlCXmMsHoWWjA5q4GbbBSyWIYqAg1b0z
	2zl60RtkQLiD63gs4twr3CGUi+Z17nCCY1fJ4J+0oC2J+DEZM14iE5D5uw6dqv31mgMnr2ZPUds
	lNZ04ErKzacgF47x6dtcDUhZ6a6tbE3ILV5SuKsctkNATlKesy6784zko6lPxqlSELTHZGb6BoQ
	MwKUHaBlc/YHw==
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr35674011a91.18.1788755983574;
        Sun, 06 Sep 2026 21:39:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:43 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev
Subject: Re: [PATCH] nfc: fix typo "occured" in comments
Date: Mon,  7 Sep 2026 10:09:32 +0530
Message-ID: <20260907043933.33452-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <dc3ba062-a548-4a9b-984e-a8f2473606dd@ixit.cz>
References: <dc3ba062-a548-4a9b-984e-a8f2473606dd@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You are right, and codespell is in fact where these came from - I ran it
across the tree and fed the results through checkpatch.  The model was used
for the packaging around that, not for finding the words, which in
hindsight was not a good use of it.

Thanks for the extra hits.  If you would like them fixed I can fold

  drivers/nfc/fdp/fdp.c        nd  ==> and
  drivers/nfc/fdp/i2c.c:270    inclue ==> include

into a v2 of this patch, though "nd" there is part of "2nd" in at least
some of those lines and needs reading before it is changed - which is the
mistake I have already made elsewhere in this series.  Let me know if you
want the v2.
