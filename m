Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424A4349B4;
	Fri,  9 Oct 2026 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526231; cv=none; b=s22H8iYWUrlX30HvR7LetHUqJX3OkPvoaqsp9C3nSFZ6tMFDfHweLnjLFxYCN2NQItqtX6d+9wiLdvruy/eVb+MJHAjOjkl6CW312odwuukaMEc4HFKRBDBDMeecmOyuLvZGNc1JPd3j83B/AiqoKktUFtLqvgy5u5AvZ3HSIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526231; c=relaxed/simple;
	bh=kWsPIqNtq3dfL1MPQGCI0jC5qPVI+JrGzF8byfVKfhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AStQaJO/eQ6aqdZmDuqSrd2S/iA2Nqm65qd5RFx4oU3BRuqQjhYvTNAE5r+w5zyvauoJng1xwS7gwXRtvft4Q0j0f/2IRokpEMNoEJjzP7DouX6pxclEvhNPrKXt6uFr3ogo9j17WV3CJb8RWZeGL13tJCLmv3uIVhGz7JFk/DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYKWGO1o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYKWGO1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90911F00898;
	Fri,  9 Oct 2026 06:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526228;
	bh=lefL3w5mp8FRAbgX7vv6Ls9VsjcS51OeBLllBPaETSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CYKWGO1omKZOaZiryYM2adsuHHwF1WllI3bOFdx18EO1B41vtErAaj5+70D+wYeoy
	 pJQIzcv6TBdQIVI2bVedg2gEDpSvbz7yf51EZNbAXw6mLChF+wZ56XxHotJeCZvl7K
	 xv0b7OWbzF4pVFz5mEpuiwpv+W9wPNIf2H4uWVEmwUrwbtV2TF4D6qOaSZ+R663py3
	 HP+INa0RmuQkELJHmgzwKaKg91eUx+O9oUBoSYX+QCJ7O5rIxH9CnO/Fh1VVu78FXk
	 942Rm2bQq67X24nbKMdEWRqrgpchu4s9zh7q9WlPah0jSJ3CLozO0I0T4WzjIkcjCz
	 2KgE1vU7EQ/Kw==
Date: Fri, 9 Oct 2026 08:10:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: David Heidelberg <david@ixit.cz>, linux-kernel@vger.kernel.org, 
	Shikha Singh <shikha.singh@st.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	oe-linux-nfc@lists.linux.dev
Subject: Re: [PATCH] nfc: st95hf: register NFC device after drvdata and locks
 are set up
Message-ID: <20261009-impartial-hummingbird-of-respect-2f9d48@quoll>
References: <20261009031734.3052980-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009031734.3052980-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 11:17:34 +0800, Haotian Zhang wrote:
> st95hf_probe() calls nfc_digital_register_device() before
> nfc_digital_set_drvdata().  The nfc_digital_dev is allocated with
> kzalloc(), so ddev->driver_data is still NULL when the device becomes
> visible to userspace.  A NFC_CMD_DEV_UP from userspace can then reach
> digital_dev_up() -> digital_switch_rf() -> st95hf_switch_rf(), which gets
> a NULL stcontext from nfc_digital_get_drvdata() and passes it to
> st95hf_select_protocol()/rf_off(), dereferencing it.  The exchange_lock
> semaphore and rm_lock mutex used by the command paths are initialized
> after registration for the same reason.
> 
> Set the driver data and initialize the locks before registering the
> device.
> 
> Fixes: cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/nfc/st95hf/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




