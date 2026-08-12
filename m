Received: from out-2uec-a94.jellyfish.systems (out-2uec-a94.jellyfish.systems [63.250.43.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97976466B58
	for <oe-linux-nfc@lists.linux.dev>; Wed, 12 Aug 2026 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548877; cv=none; b=WgmJTESvo9DYgTTUk7ZYIYVhmx07e4ayybS/3HM6peY8xLUkB9NiZqh2OYHcF6GyLjX97nRfl8FBC97vvKfgkPKST6ngzzhfb7c8pK3X/djJNuUBxQO0Q4qikZi0R9kUfxfa6dGC3u5DOB+UxiH/eYbhcNDbUn9YMazzCrBQZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548877; c=relaxed/simple;
	bh=DGa8xWr/UyQk+yJRWzmlZUl+gJtKbBMzeArK3C2vgzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqC25XGdhWR/SXTqqmC5GlZHiZ0ZoStUQOGrG1AvKNEHCTBEOxquVEw9JD2lEIeIkOMPlzRsoJAY0+JzPvAHkmQq0Gzd7QOJFhbJxE9HdKTgMlthIN2+npN4fIHBcEjO55xav81XnM6NGaYRlhis8m2ZIjdLGswt04whJdtB+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=63.250.43.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (unknown [87.215.145.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hKspJ4YrVz8sWN;
	Wed, 12 Aug 2026 15:28:40 +0000 (UTC)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: David Heidelberg <david@ixit.cz>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Subject: Re: [PATCH v5 5/6] nfc: s3fwrn5: support the S3NRN4V variant
Date: Wed, 12 Aug 2026 17:28:25 +0200
Message-ID: <20260812152825.34300-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e9b0c679-6a50-48ba-8ce8-684bd4b5606b@ixit.cz>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net> <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net> <e9b0c679-6a50-48ba-8ce8-684bd4b5606b@ixit.cz>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: jorijnvdgraaf@catcrafts.net

On Wed, Aug 12, 2026 at 01:18:33PM +0200, David Heidelberg wrote:
> > Assisted-by: Claude:claude-opus-4-8
> > Assisted-by: Claude:claude-fable-5
> > Assisted-by: Claude:claude-opus-5
>
> Here's my mental model:
>
>   - It's good to know that you used an LLM (hence Assisted-by).
>   - Someone may want to reproduce some generated code, so knowing which model was
>     used is useful.
>   - When you put THREE ;-) models there, I think it's getting a bit useless, as
>     we don't know which part was generated or adjusted by which model. At this
>     point, it feels somewhat pointless.

coding-assistants.rst doesn't say what to do when multiple models are
used, and generated-content.rst says to choose transparency when in
doubt, so I kept the tags each patch had accumulated.

Currently I use claude-fable-5 as my coding assistant and
claude-opus-5 only reviews. Earlier I used the opus models for this
as well. Each tag was added when a model wrote code on a patch, then
deliberately carried forward across revisions.

> My recommendation would be to keep just one line for the model used for:
>
> a) the majority of the changes
> b) the last model used (at least for notable changes)
> c) the most powerful model doing the generation and/or review
>
> I personally don't mind either approach. There have been discussions about
> dropping Assisted-by completely, but so far it makes sense to me to keep it,
> just in moderation.

Agreed that three lines are ambiguous. Future patches will carry a
single Assisted-by line for the model actually being used as the
coding assistant, or just "Assisted-by: LLM" if the simplification
now in the docs tree lands [1]. The opus tags can be dropped from this series.

Thanks,
Jorijn

[1] https://lore.kernel.org/all/87qzkuahlr.fsf@trenco.lwn.net/
