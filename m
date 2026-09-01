Received: from mta1.migadu.com (out-112.mta1.migadu.com [95.215.58.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700A4766A5
	for <oe-linux-nfc@lists.linux.dev>; Tue,  1 Sep 2026 09:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253500; cv=none; b=NpnQe42Umpfs8UPYJG70B4iMD28jGUjtGEZ1yOooOJcyTM7qocsEaPus4nfBZLBFiZBDu+8WuOhas1J+YWqdRp1pvkpeSjNi3mTUSgTrk8RBuZYD0ptpMtAyhZY2rM47/AwlyHzEgEmkSM9Sky634cMjcTE+5bL1j5IGjFKQ2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253500; c=relaxed/simple;
	bh=K5adOlBiMa0yYmMZJxP73c0SVwU2yadNCgQ5ECt6Exg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZEXxGfnUuIYAmchTK/5yeaVgi20yjay5I0dbUpT9dn+LnN6UvIgc9HXeWFaV/toQCi6ptXakDMUKPx6jUetb0A77WwG+5L2zhUkROwwu7TUf8Idcw8QsX6VYQpBkSFNQDOMLnMN136sAhal50okqhmFHjwYGYLkVlJRuA/Wr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ONjdX+pc; arc=none smtp.client-ip=95.215.58.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ONjdX+pc"
X-Envelope-To: oe-linux-nfc@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=K5adOlBiMa0yYmMZJxP73c0SVwU2yadNCgQ5ECt6Exg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788253496; v=1; x=1788858296;
 b=ONjdX+pcrVr8uRF8TxVj/hLC1v+LiCauevWbZqaV7++dRb/f8YdDGPryvKNFB0qf/4DoAK+Z
 sG71n8hAN6okuO2raLRqMUbxl9wfQOf/RqIas1OolvehqArpQobuiHT67CS+IoDAyqXTIHj0ZHe
 sb0ZqSyZxrh6M/RGAnFKItkA=
X-Envelope-To: oe-linux-nfc@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 5353e1dd7fab9237;
	Tue, 01 Sep 2026 09:04:46 +0000
X-Mizu-Trace-ID: 5353e1dd7fab9237
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 17:04:38 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bongsu Jeon <bongsu.jeon@samsung.com>,
	Shuah Khan <shuah@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: nci: Fix uninitialized family ID on missing
 attribute
Message-ID: <apaVJjXnwJLZLwq2@fedora>
References: <20260901070618.3299012-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901070618.3299012-1-nagachaithanya9911@gmail.com>

On Tue, Sep 01, 2026 at 07:06:18AM +0000, Chaithanya Lagisetty wrote:
> get_family_id() walks the generic netlink CTRL_CMD_GETFAMILY reply
> looking for the CTRL_ATTR_FAMILY_ID attribute and returns the parsed
> value in the local variable "id". If the reply does not carry that
> attribute, the parsing loop never assigns "id" and the function returns
> an indeterminate stack value, which the caller stores in self->fid and
> uses for subsequent netlink requests.
> 
> Initialize "id" to 0 so a missing attribute yields a deterministic
> (invalid) family ID instead of a garbage value.
> 
> Fixes: f595cf1242f3 ("selftests: Add nci suite")
> Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
> ---
>  tools/testing/selftests/nci/nci_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/nci/nci_dev.c b/tools/testing/selftests/nci/nci_dev.c
> index 312f84ee0444..ed306ec23895 100644
> --- a/tools/testing/selftests/nci/nci_dev.c
> +++ b/tools/testing/selftests/nci/nci_dev.c
> @@ -182,7 +182,7 @@ static int get_family_id(int sd, __u32 pid, __u32 *event_group)
>  	} ans;
>  	struct nlattr *na;
>  	int resp_len;
> -	__u16 id;
> +	__u16 id = 0;
>  	int len;
>  	int rc;
>  
> -- 
> 2.43.0
> 

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
