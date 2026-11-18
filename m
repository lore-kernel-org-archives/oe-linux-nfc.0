Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025766;
	b=uZXSywXTJpbzt5tYLDnhgr+u1HHwHQdO+LiOoe5tLZRYOWX8XQkSFkV9f71CFiS1fmB+
	 L74ZX19L4At+RksYf/zjFr2enNx91RFTHgiYSVa/P2ceVfH9OgdEhft1DyrPUspv+GeXL
	 EoMSGyDQUZXoytbDARraTOEQ1tU0MzjZLYmS5FNwSsgIOhyl3FefzJY5XypwF82gHgh6u
	 ynMqTPSIcKOMhMSJrCGSSa6xdJk666l21PDqNSSzURj1DKInEH+nsQgY2kn4Z5f1C/Tmj
	 kQOnh55M8bW2al4Ca7XeVnJ0Rw3LTwGkpCBEGYxMGcgCtd/oE3xxqsSu+Zwi+OGzTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025766;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0KF5QjmWSZPXGNjK01zWAmECY5pEE5v1nBtkNw+Vomo=;
	b=sQI+/vjZIQ1zbnbJHE3DVNUD9gfuH2kwcMMCgaXltMubpGsBucBLZioJcfVZzHMNtMqr
	 zlGzyyYlePGxOvKTKu1EUNCsyDu+lWiAD8zTQ2F0aWX8/866DC0Kg94XVBThAkcv7V/1D
	 x5D+4qI2oO+xbo2AhUPcIRTGwEuTvMrxlmH/OXLQ8DrErJ5ULyEFSY22xPetJk9Q7bAP/
	 ZmYYiwqZv/AbWp2w8VMPZgiczrO0TClLFysBfzmB8MfT6Up2kB3cN6uOEKGlBIdRTi9+3
	 uLl1QGqyX5NWvenClvr/0w6Rg5wCNpoNkCsb9anPdNfFImssGPjRGolrovogll0yV6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dg+/agY9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1357F606A31C;
	Wed, 18 Nov 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dg+/agY9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D291F000C5;
	Wed, 18 Nov 2026 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025765;
	bh=0KF5QjmWSZPXGNjK01zWAmECY5pEE5v1nBtkNw+Vomo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dg+/agY9UAQahmtjzpcKJAaubbNHB1YQySLE0XaWfeAV+XMRzZKhCbDwUS/8heu+R
	 v6we9498lFrciXp62RPzCr4R6q9kb+gr/1l6w2p04ZKwPgCyWx++4CGXajABDxqxfF
	 qRoSh2vjGb6CTj/TYbbIGw1wiKHAcUOVakLQNcXY/eoIaplpiwZAzf14id1MWNyCGv
	 caAViU6QM4Tg7TONkNKKz5vxNUK2iZ3FVadLGJe8wvMx9/wBRm1yQqiEc74LB4cUzW
	 Se53EPI53eDdlziaQlX3CU32K4Gs7ZozGWJb15+4duprkaqM+42RqWVJYAOinpmwsH
	 eRsbL8brqWhEA==
Date: Wed, 18 Nov 2026 18:16:01 +0000
From: Simon Horman <horms@kernel.org>
To: shyckless@gmail.com
Cc: netdev@vger.kernel.org, david@ixit.cz, edumazet@kernel.org,
	kuba@kernel.org, oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org, pabeni@redhat.com,
	davem@davemloft.net
Subject: Re: [PATCH net 1/2] nfc: llcp: Clone LSM attributes to newly created
 child sockets
Message-ID: <20261118181601.GP860048@horms.kernel.org>
References: <20261112-nfc-v1-0-ab0ef166f382@gmail.com>
 <20261112-nfc-v1-1-ab0ef166f382@gmail.com>
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
Content-Disposition: inline
In-Reply-To: <20261112-nfc-v1-1-ab0ef166f382@gmail.com>

On Thu, Nov 12, 2026 at 10:04:48AM +0000, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> nfc_llcp_recv_connect() creates the child socket for an incoming
> CONNECT and queues it for accept(), but never calls security_sk_clone():
> 
>     new_sk = nfc_llcp_sock_alloc(NULL, parent->sk_type, GFP_ATOMIC, 0);
>     ...
>     new_sock = nfc_llcp_sock(new_sk);
> 
> So the accepted socket doesn't inherit the LSM state of the listening
> socket. With SELinux, its sock keeps the unlabeled SID. The
> sock_has_perm() checks on it (sendmsg, recvmsg and so on) still run,
> but against that SID instead of the server's. Depending on the policy,
> this can deny a confined server on its own accepted sockets, or allow
> something the server's own label wouldn't.
> 
> Call security_sk_clone() right after the child is allocated, before it
> is set up and queued for accept(). Bluetooth, iucv and vsock fixed the
> same problem the same way, in commit 6230c9b4f895 ("bluetooth: Properly
> clone LSM attributes to newly created child connections"),
> commit 02f06918156b ("iucv: properly clone LSM attributes to newly
> created child sockets") and commit 1f935e8e72ec ("selinux: vsock: Set
> SID for socket returned by accept()").
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: d646960f7986 ("NFC: Initial LLCP support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested only, I haven't tried it with an SELinux policy and a
> real LLCP peer.
> ---

Reviewed-by: Simon Horman <horms@kernel.org>

