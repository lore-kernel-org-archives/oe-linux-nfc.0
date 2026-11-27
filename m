Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786816;
	b=zmQ8rM0e4jQ29vkJ+9o8yMguDTYXyu6aUzWYqpsQcLpQcwY6QezXWZtkaWY3C7/QrLmw
	 Hq0d0ayjBPfE5XmW8Ycc6MSAWGGztCMd+OZtOZtsLkWlOPA5b7EzvHbDvVxuf+ArKyMfx
	 e7p09SIBIuCrZR1b8tIqJfTiDndDxogWub8+qUHGpxrHwa7RUQP5P8zHgOUMTbcip6AFG
	 rItdJBUzwCM365EJXw69qie9qn4E3kuFMZzP2YS8WSW/7xTq+M4UlkNyM/Jpq872w03fk
	 7qQ74eTP55wKqDv2OujlEQGOV893Fnx2uj36X9g3xjFSJ4VXFIRQfuoL3rWdlARuPdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o9GE8vDlp9gU9s3R8Ex0+u5RMjrkAIYFGp6DQiySOuQ=;
	b=Az/SCWfCtV+5an4MQegHIajoY2W4zjFyotmI2n/gaBks9ah/EQS0nM8QcX1xR9seYZZy
	 xvhSPbpphN82FHDT64oryZQWYBvundPWM7sRDswVPbOkzFfXeF5Dllr1NlIrHIuwLvmEC
	 2ejb4e+o4Oe+SsQ+LKZ6qtwVigP3VHZgJyzqViPtklASmQRKZLrX4Y3rnVG3GMeLLlUQ8
	 c7XmNLsY2PMLhVWtN1GEAxJgpi4EbSODmqvt7UFqKf52kZ3n3XfpVP9Xzg1QQolWNRyK9
	 OVIC+hR0ZD5SAymvGFDpgavL9Nc3I0ijItpV/zh5tBchfFXOjlZV13QO2AVVPXsJOFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2QiGNLP;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6A9606A31E
	for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 13:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2QiGNLP
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso5006446a91.2
        for <oe-linux-nfc@lists.linux.dev>; Fri, 27 Nov 2026 05:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786815; x=1796391615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9GE8vDlp9gU9s3R8Ex0+u5RMjrkAIYFGp6DQiySOuQ=;
        b=b2QiGNLPlrLg/ateiZU0j71o/bVnJfKXeb9HhRs1KKHz1Eic0uUHDAT5aLnZt7O7w+
         lFYWYYo1iX1r6eID/E5gs7ZfLDAxH1tupgzzAyDBT2pAPc6FqRSYbCILLm0TdKZpIPoH
         0AK59V1uepwtvDpVkgo4PSjB0lHBW1vhVlhQ5K8MvVKp+/2vELmcBm6o33zX19l41wqs
         sRqV0lWvsCltdDXA4DHqCiUIrT7piSUMMDA8AclQLZWCBJASQBbYfbMat76dzh7GpM6k
         V1vUi6H1xKfh10Wcfm3OGBrBZlUwbVYXGWQlnD3Geq+V2F20DKZX2lhW6H+UyYgZlTpu
         HJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786815; x=1796391615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9GE8vDlp9gU9s3R8Ex0+u5RMjrkAIYFGp6DQiySOuQ=;
        b=ReK3UQwaJmuI7HWwuE5aue5o4g+csoca5F8Aj0evMRHHlIsgpaBQuUsiLKy7rxJxoo
         4fBXzDQWnaBKrLengmxHlzwfmbqMf/Be8Vm84yOwZ850yc+CU1TlH7VfN50GCl6wpmsv
         nFATlyGWolFkNLSw5Ug//Ms7PbpXAzpFyAOZ8kxysR9kMBc1YGbykXn1wGhpQGCqunHf
         KcLGTR99dPekUeTIr8rV3M90GegJsMlf3Ln8cRQgvq/2vk1DyD1+tMFGFK3NapuqGhwU
         tUb/pgRtEax+oBWUM3gKERAoVUzQMhVyJ01zz8KFx90g1WOt4p1SK2KZ8xuwLkbLMIhK
         NK6g==
X-Gm-Message-State: APuU4Z+LQX4X50ZrYv/7HdLvbHutXBUK3YSAfIiWcvdDiJIjL9S5BV++
	bzGxvcVXSRrpoWpI4vOvOubS5tJdoM0tCcPIW2OXpKB5u8np1+FrDIy5
X-Gm-Gg: AZFdTZdh+sn6fFzNx2EjXVEZAYO+ocrHg8oXKmZ0RYtGOZaFOUqLfkt5DvJw/xcBHks
	1MfOfd0bwjcoSxHaoWaIdNtOx12DN00sZRcLpHwHQc5uO/tm8khRD163UjV3lLPGY9GS4P3jzVo
	MiRymlxewfmZymgTtdZ+AiagkTAG738W+2Q0G1pqvNHCp7fUXC9vwcmZSpIRazKoyu7RgvvebwH
	rivSCj0PhYLZdHenOn09mpt8/hNOgRAFUcJ426SI49aInZB8sryCVUH1mBDE86kXhcyCl1BuM0K
	fo5SV+tVU/KWTgDL5XnfvNkMoeTYiXggakzZayr/Xg/p/qrpuTyjGkTJdomCfZ045VqUSxHKXTU
	gO3/maOybc8ACtGDW2rXxNpjhVWEYh0sPiVREWA1jFsfx3Tv6lTrvcfV1QRLvqYZ34n5Bc09clT
	SZNVO0w6j8wYj+lg5TVfgwYmypdOynQ1MLXHtJBj5qNkk1bSLL8opS2NSA3UoXwNNi7dJygzXUS
	+SbklS3L1yoM+C9TWdjwRcMbc77+Sp3BbAbLQmTHCuFNYUCN7sPygkvB+N+uv9ZGSEakr7f7ihR
	Y2AgEEhYKOn2EwoZnpZrFVsZ2kIODhxDilAz5aojNg+HGOAgIkF2rMDe2x7+FE8xxKEZYuIYPim
	4fuM2HsuWKXIhgRl6FlwSdySOPQY/4zpzsna5y65St/VPTJrpYQdqIArZkZyUyXEG8HUwgo0Uoq
	gtP67jIGtybnSreqqtNu9CaeCK+RSgrgUeVMu4pqc=
X-Received: by 2002:a17:90b:2e47:b0:3b4:1884:9846 with SMTP id 98e67ed59e1d1-3b41c7e0d55mr21957170a91.6.1795786814843;
        Fri, 27 Nov 2026 05:40:14 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b50234fb25sm5241386a91.2.2026.11.27.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:14 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v4 1/2] net/nfc: fix skb ownership on data exchange errors
Date: Fri, 27 Nov 2026 21:40:05 +0800
Message-ID: <20261127134005.1762-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <179576491145.3135.10392815197154160858@kernel.org>
References: <20261126063911.353-1-luob87709@gmail.com> <20261126063911.353-2-luob87709@gmail.com> <179576491145.3135.10392815197154160858@kernel.org>
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

Thank you for the review. All four findings are valid and will be
addressed in v5:

1. nci_nfcc_loopback_cb() and NCI_DATA_EXCHANGE:
   Agreed. The old nci_nfcc_loopback_cb() defect on nonzero err with a
   NULL skb was reporting NCI_STATUS_OK with a NULL *resp (risking a
   NULL pointer dereference in st_nci_loopback()), plus leaking skb
   when conn_info lookup fails, rather than leaking skb on the normal
   error path. Also agreed that current mainline
   nci_data_exchange_complete() requires NCI_DATA_EXCHANGE to be set
   (which loopback and NCI-HCI send paths do not currently set). In v5
   we update the commit description to accurately state both the NULL
   dereference / !conn_info leak and this mainline gating nuance while
   keeping the callbacks consistent with the data_exchange_cb_t
   contract for stable trees and future fixes.

2. nci_close_device() and stale ndev->rx_data_reassembly:
   Agreed. In v5 we free and clear ndev->rx_data_reassembly after
   flush_workqueue(ndev->rx_wq) on both close paths in
   nci_close_device() (guarded by req_lock and !NCI_UP).

3. nci_core_conn_intf_error_ntf_packet() in target mode:
   Agreed. In v5 we move the ndev->rx_data_reassembly drop outside the
   test_bit(NCI_DATA_EXCHANGE, &ndev->flags) check, matching
   nci_rf_deactivate_ntf_packet().

4. Patch scope, accurate descriptions, and Fixes tags:
   In v5 we split the series cleanly so each bug class has its own
   patch and accurate Fixes tags:
   - Patch 1/5: data_exchange_cb_t contract and callback skb leaks
     (explicitly calling out ST21NFCA success-path leaks and the
     nci_nfcc_loopback_cb() NULL-dereference / !conn_info leak).
   - Patch 2/5: PN533 double-free after queueing resp to dev->resp_q
     (in both pn533_data_exchange_complete() and
     pn533_tm_get_data_complete()).
   - Patch 3/5: Digital DEP missing completion callback on terminal
     errors (hang + socket refcount leak).
   - Patch 4/5: NCI rx_data_reassembly cleanup on data-status errors,
     interface errors (unconditional), timeouts, and device close.
   - Patch 5/5: Preserve signed errno in nci_add_rx_data_frag().

I will respin and post v5 as a new thread shortly.

Best regards,
Bin Luo

pw-bot: cr
