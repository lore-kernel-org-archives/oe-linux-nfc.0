Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69212439336
	for <oe-linux-nfc@lists.linux.dev>; Wed,  8 Jul 2026 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523446; cv=pass; b=okTNpSQlb9PSMkoHaM7jsnRBPsadTrApqTh0Usq3seRLQb/bYqvg2PsEABS9XmdyGPcisZMrohxsDcAGS0r24XglAvJB/XhM8UCbPli3p7a8e8W06mhJtCw+KRuOQ9qYyp//DM/idkEGKNAHpIA48URl3fys1YXAKBdB0L9ceQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523446; c=relaxed/simple;
	bh=DKA/jc8TJnNKFhGaT1WcKh6dc6W1wcKepNEU0ujgJbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YcM3Cr7Rl8WL8sza3diMt+uEZ9Vm+Lvsr+CtSEEOUPuPXDXuV68VNgB8pMi/Z36b4KdnKb5x5Mvk10eMOPoYylZORZ8vXlRAPcAlste/GG8h8r78lzRwC8Tm7MV+uTFDBrN5fs5zXmyeMv/voh2zi9ltaV1HYl8TMbQCXekzWh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUYSDzQ2; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUYSDzQ2"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so453321e87.0
        for <oe-linux-nfc@lists.linux.dev>; Wed, 08 Jul 2026 08:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783523440; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4P3QQHTWHjlbfQrz9ogKTRaX9H1dRU4x/KB7GIhDhabLsFLqtevoZKUPn786hsXJL
         +XZxV2ZtNEOSDZ/C6hnjUqsUSDh2LFV8Ya7BPK7rVMK1E3nPsKO5mj7X7I4P8Km3gZRb
         F6C8tP6zXNaO4GDUHyvcca5f4JaRpn5IWOErhPlN91MrRtw2s/G2F9AqUmnKldUeaNSy
         sZuYEl76OqAYwXdXDeqSkFLbuOBLxEarwnqVLXUkCYaWa4FkQAoB15UusbnS8MUa0arc
         qM+aQObyZ3WUFhQn9K5tDaj3LlrtjcIHAZSVaWpERkrVJOo+4XOwgP94EMEfc+TAbnKB
         Oa1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A2hykAy9k8TdWvhrQ5IqAWizxEj+ACK7cu0kIr7bqOo=;
        fh=P1EAX8kWRvsqUCLQzjdR3MQYmQFVru5L4zJOoUJtlII=;
        b=d3OUvWx9Cp4Yci9xuI6ds7JncJ8GWmJH8/a4sLrysrMqB4Q2IrlWxfTIFGSi4SnbKz
         n56VaEs0zdcrB59G1wSz6tUOw5POwT2onrcFu5lRV4kQe7St+ZPD/iWJLjMNwfL1g3v5
         EIHnvKJSBr93JYpOXACXe2ohOVtQICSr02RRxZ4+RMlQ6dqfYFi+iBRsVUe8ZGsQEX1z
         1P7PFqbl6ZEUEAeJkpiRKARBWQ56nJUOVCyyspM7sfWZyAwLizzd4mZpcnLQfEa5CSXQ
         d5IKfX9j88h1XUankaPJsGW8u9H4WoP08KTAEywgFo3evjJOq4NBGL4JcK7sHeFC6xvO
         uv/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783523440; x=1784128240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A2hykAy9k8TdWvhrQ5IqAWizxEj+ACK7cu0kIr7bqOo=;
        b=LUYSDzQ2RvHitHhtgKS2rO/BLmaEVcDhJ37Zkggmi+IsPxc+kvWs8WQfDHflmjmpXn
         LMLzGyZ9SrmHP4gqTj0tjSD/VrD/PE2rugvYvQ0pXrk9SeXVE3+mOL/1gflBActekTi1
         9wT0E0IMRsaVv+axEdOKz3YeVuhItw/oX4gCpStIsCFaiYjBAuF99wljI008dFHx6Ya2
         NPdoBxQdNveuCGg2VRj3ma02Ck1hU+W37rZdF0rNVLepQOkujKST95kQFZVo/2a2qFX4
         p9DXc14RhRldzpSXwI0XthON1S3ACrsNmUFbBEo9Jdx5Byz087VPrEIS8AYRzProeU5p
         Djpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523440; x=1784128240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2hykAy9k8TdWvhrQ5IqAWizxEj+ACK7cu0kIr7bqOo=;
        b=P/54vLJHCH8aRq6UMqbVWYv2c+YTmi79Q8Q/hpU+EiVC0sr5REIWRXwDt06ZuYr1Vh
         yrJ6XgXaLBM9rcyYWVX5Lz6rK7GNQLvaD5Sst0oNcnoWmJXKQMhxlm6+q9uiNu5sL7WF
         J+I7gICHdWt/bMTpwuoEq97vGwuOefIvCcZ8FXmuq8F9AUUccbJq/ivLE25KcB7BLfJW
         KBmUU7vOe4GT/JG6wrj0BlJUFvg+lrcjNgqL3pGN3R7e5pCa9fiZRqhSpC9sJOaHm69s
         cVnSKCGHFvPk2naxMhBHrIepa/TfHUHOviLjycCRQeFVxBOI718bmwNI/fj+aSicF9lV
         wUhg==
X-Forwarded-Encrypted: i=1; AHgh+Rprki3o7VGi33r3jgghcAk3VzGBffLo46RqfQ1spnyMo4DYZv8HVKsCl59T550Sb0/5G8EtSuOuUmjX1CU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnHtXR1YiHEEPrN3zcI0It819kNd34LbO9WY22s+xjIFhVGd0e
	sun0S0V76hz9FQKCib8+NnLFHlsK4RmElXi7rELFvCsQ8U5NWUP2ezIkcFBqDTBt5wLDk+NeMxB
	QNpBLnXJiavrq8BVi0mNK0HIaf616hFc=
X-Gm-Gg: AfdE7clz6vO/6KFwEswjuTtYBWDLwsrSw5fyDsE84XG6dGsVV2Sljeqy0JYHPwvyfna
	tm4AemFQ1iRcAFvq3A86kJ6iWMEo/hAvFvkJhghFKOud50pjR4yhaPdNjZ03NtzJ7HcIqss2Dt5
	KjSDe2HTmP0JgqebOmzwh9Dfn4BjH8WnOsesvF6Za3mzx/N74JBKp+Q4Dc238jEhhkiLivV9xLQ
	9RvnX/XX9eCYbiNPDn9ASHjOtOYf5Bk0sWwxHVmlB0sPhduKMm6Wwc0RA60m5gP3wEPomohWt9J
	uUeeRfXvB7u/ct8w5GVsD/Qu4w8uZxubpP2p9qav1p+AbEjDW17UuZDP
X-Received: by 2002:a05:6512:a81:b0:5ae:b5d7:4b99 with SMTP id
 2adb3069b0e04-5b00ac2fd7cmr1762971e87.0.1783523439797; Wed, 08 Jul 2026
 08:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628210026.129941-1-meatuni001@gmail.com> <20260708130534.GA1481798@horms.kernel.org>
In-Reply-To: <20260708130534.GA1481798@horms.kernel.org>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 8 Jul 2026 20:10:28 +0500
X-Gm-Features: AVVi8CeK_I9fS8d5VbnhtSRSfLVJmMl2Kt_hq3MN2NnmVxurt42eg_sUf8N-xeY
Message-ID: <CADqcGBkXtDGMsQ6XWYeUyuS6qL8DCHeTNxzbH3s=22vuvBfZaw@mail.gmail.com>
Subject: Re: [PATCH net] nfc: nci: fix out-of-bounds read in activation
 parameter parsing
To: Simon Horman <horms@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, oe-linux-nfc@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Thanks for the review and the Reviewed-by.

One of the issues raised by the AI review (the NFC-DEP general bytes
handling in nci_store_general_bytes_nfc_dep()) is already addressed by
a separate follow-up patch:

Link: https://lore.kernel.org/all/20260628214929.135152-1-meatuni001@gmail.=
com/

The remaining AI-raised points are independent of this fix and can be
investigated separately if they prove to be valid.

On Wed, Jul 8, 2026 at 6:07=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Mon, Jun 29, 2026 at 02:00:26AM +0500, Muhammad Bilal wrote:
> > nci_extract_activation_params_iso_dep() and
> > nci_extract_activation_params_nfc_dep() receive a pointer into the
> > RF_INTF_ACTIVATED_NTF notification but are not told how many bytes
> > remain.  Each reads a one-byte length field (rats_res_len,
> > attrib_res_len, atr_res_len or atr_req_len) and then memcpy()s that man=
y
> > bytes from the packet.  The length is clamped to the destination size,
> > but it is never checked against the remaining activation-parameter data=
,
> > so a notification whose length field is larger than the data present
> > reads past the end of the buffer.
> >
> > The sibling nci_extract_rf_params_*() helpers were recently given a
> > data_len argument and matching remaining-length checks, but the
> > activation-parameter helpers were not updated.
> >
> > Pass the remaining length down and validate each field against it befor=
e
> > copying, as the rf_params helpers do.
> >
> > Fixes: ac2068384034 ("NFC: Parse NCI NFC-DEP activation params")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
>
> Reviewed-by: Simon Horman <horms@kernel.org>
>
> FTR, there is an AI-=3Dgenerated review of this patch on sashiko.dev.
> However, I think that the issues raised there can be treated
> as possible follow-up rather than impeding the progress of this patch.
