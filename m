Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839186;
	b=xlcW3mMf8oqEwya2n/aE+hUlVQVtQtMapA3qWRmTc4HwNMVm/RKyXeyM6VrOrMahhb/B
	 gvccfGPeuBZfzcbYTOqRQpPHThqGfZ2Y8EbOwng/vNSD31m+VWI8rttCcaMBI/j0Dty3b
	 CRRlszDlKsRz/tLd2rDh1pbKSQXR1QylRIyQJmla7x7R9G2yRq4awPrkUGq21njpFWPqT
	 TRRFEIl+7v04H4+zCxZn83WyCPzQOBHY76xoUHGm4sF/Ls1yH2hGtJDew6Moe+Ui+fN9D
	 caHXdzjpWhDMlIhSF65ERISKj3emU8sKlfn6BjQ7Yyoj/O1ykshSvgrlMrVdSPAbURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Julx96UTlwUpy/yEEb6XKUMDaihQ6nHqBxqUTRWWoDs=;
	b=th6+LRYQcz0wwHhKfhkYkzy2oZrjoPNtddg9zfDx0WeOxcWBopsjEd5O9FrN/6YRwY6z
	 w6koqzzsIzIA0EzrctOdk18htdpwtFf/FvcnohUrYnClDgeMXGiu0FpcbO9lvO8G/3mK+
	 wNUwxFoQzIglOq0pMNGqzW1VanRqlgF3PgbPVpNh9SvbDLh6xIea/ydmE9lPBbfukwmM8
	 NXClhU56MhibXe7FjVJQWkJcQ2uq1T+agEUHvw0QycasHyVkzj7X4FCoUk9g3fxBgcb9R
	 75kTDtS0KkORX+UVr1LDKT0Mb/PiWzAfEBvy7AiOA45RTaDx7gul13dTxp240aPEvVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hQGFSyBG;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F226E606A333
	for <oe-linux-nfc@lists.linux.dev>; Mon, 16 Nov 2026 14:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F226E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hQGFSyBG
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so3985410b3a.0
        for <oe-linux-nfc@lists.linux.dev>; Mon, 16 Nov 2026 06:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839184; x=1795443984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Julx96UTlwUpy/yEEb6XKUMDaihQ6nHqBxqUTRWWoDs=;
        b=hQGFSyBGNciu+4qLuPv4gbOvdejUala2mA4xIT6P8CKk0jrHFNNlJ6WlKnMGB4FxRt
         p8Tf5LIZ/xpeKFN0qmnAtHSeJDOQwawckcnbwr9tmeFgEgxZiFpcgvgiN7Ge7Wgr7q+/
         4mWmEHXI4UdsAclcbY2JKnA5Gm+yZ+pesiNqzQC2v8tdnv45MiBacpbHD9oUFLEuFBae
         ep8wge4MAIO9yXMTc5XKS+X9EIUeHmPhi38c8d7Meep2XsKMUsxHzvtoZIWfAdx8blB2
         OEJnGnuh4Q2mbDSCl1uB/Y2yRG/cpC0jrLg7tk8997ylEIKsMh5fX+Oe3wNKYWTdttZN
         1PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839184; x=1795443984;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Julx96UTlwUpy/yEEb6XKUMDaihQ6nHqBxqUTRWWoDs=;
        b=q32kP/lGEHxvcZ7bm91xWjM7VZ+POxQQroCwyF2j9xHTSTYvJMYVt8b9nHMY0v99ZB
         A+afJpHKitsIy13RIXKSvw3ALrGrNBjR7ukqDBd3Fly70mBEvZzsKR+8LfDEWKJyrnly
         XyjZuOQ7QteYxvKlH5EcFrPEjmzI+mPytDZi4+7XN3aWxt4v6OLb3uGo9r2HmdGLoxYs
         OhB/0LRkN1TLojySjZx/jQNuxrZhFzqIJ/qI8HkcxktsnYBaph0ILvbLb+2m8KJC+sew
         Kp8E7YGv8RlzSoxrTF6iQnWmMvKOnhfcdWvry2DMlWjZXbPpDQ+aFdwbKz/Zcry92FoV
         0dNw==
X-Forwarded-Encrypted: i=1; AL+hErHnOOM9+W4kJZ75G3/dL2HZYrvZ+M1WLFygfjGweSBrYs+QkKXgZmPbf0WsNP3tLBlwte//4ymu6/cJy8s=@lists.linux.dev
X-Gm-Message-State: APuU4Z/cl1AIqtlWQguMo3nbouXO3/kKpQoXuJnpcTtu30guQtSJbrac
	/akj2SGjSvSN6VlZqvqRG+T+MoD7y+/RRg+a2uaMd0SudhG5q4wFfaCcArQ/Y+fvo2rsTV228Py
	v0QdSIg==
X-Received: from pffm4-n2.prod.google.com ([2002:a05:6a00:c304:20b0:8a0:70d8:a2ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fc3:b0:89f:b166:bde6
 with SMTP id d2e1a72fcca58-8beb8cc8ad6mr9720424b3a.54.1794839183449; Mon, 16
 Nov 2026 06:26:23 -0800 (PST)
Date: Mon, 16 Nov 2026 06:26:22 -0800
In-Reply-To: <20261114202653.3113381-10-rdunlap@infradead.org>
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261114202653.3113381-1-rdunlap@infradead.org> <20261114202653.3113381-10-rdunlap@infradead.org>
Message-ID: <avsSjioXqbCOn834@seanjc-mac.roam.internal>
Subject: Re: [PATCH 09/12] docs: ioctl-number: update virtualization entries
From: Sean Christopherson <seanjc@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>, linux-mm@kvack.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jason Wang <jasowangio@gmail.com>, 
	David Heidelberg <david@ixit.cz>, oe-linux-nfc@lists.linux.dev, 
	Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, MPT-FusionLinux.pdl@broadcom.com, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, 
	Neill Kapron <nkapron@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Eugenio =?utf-8?B?UMOpcmV6?=" <eperezma@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Mike Marshall <hubcap@omnibond.com>, devel@lists.orangefs.org, 
	Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>, linux-cifs@vger.kernel.org, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026, Randy Dunlap wrote:
> Update the list of files where virtualization ioctls are defined.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> [Since having multiple maintainers trying to merge these would
> cause some conflicts, it would be more manageable for Jon to
> take all of these through the docs-next tree.]
>=20
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowangio@gmail.com>
> Cc: Eugenio P=C3=A9rez <eperezma@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: kvm@vger.kernel.org
> Cc: virtualization@lists.linux.dev
>=20
>  Documentation/userspace-api/ioctl/ioctl-number.rst |    6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> --- linux-next-20261113.orig/Documentation/userspace-api/ioctl/ioctl-numb=
er.rst
> +++ linux-next-20261113/Documentation/userspace-api/ioctl/ioctl-number.rs=
t
> @@ -200,6 +200,7 @@ Code  Seq#    Include File
>  'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
>  'M'   00-03  drivers/video/fbdev/mb862xx/mb862xxfb.h
>  'M'   00-0F  drivers/video/fsl-diu-fb.h                                c=
onflict!
> +'M'   01-03  xen/interface/xen-mca.h                                   c=
onflict!
>  'N'   00-1F  drivers/usb/scanner.h
>  'N'   40-7F  uapi/linux/nvme_ioctl.h
>  'N'   80-83  uapi/linux/ntsync.h and uapi/linux/nvme_ioctl.h           c=
onflict!
> @@ -239,6 +240,7 @@ Code  Seq#    Include File
>  'U'   64     drivers/usb/misc/usbtest.c                                c=
onflict!
>  'V'   all    linux/vt.h                                                c=
onflict!
>  'V'   all    linux/videodev2.h                                         c=
onflict!
> +'V'   00-1F  linux/vboxguest.h                                         c=
onflict!
>  'V'   C0     linux/ivtvfb.h                                            c=
onflict!
>  'V'   C0     linux/ivtv.h                                              c=
onflict!
>  'V'   C0     media/si4713.h                                            c=
onflict!
> @@ -357,6 +359,7 @@ Code  Seq#    Include File
>  '|'   80-9F  samples/                                                  A=
ny sample and example drivers
>  0x80  00-1F  linux/fb.h
>  0x81  00-1F  linux/vduse.h
> +             drivers/vdpa/vdpa_user/vduse_dev.c
>  0x89  00-07  asm-generic/sockios.h
>  0x89  06-07  linux/sockios.h
>  0x89  0B-DF  linux/sockios.h
> @@ -398,8 +401,11 @@ Code  Seq#    Include File
>                                                                         <=
mailto:kvm@vger.kernel.org>
>  0xAE  40-FF  linux/kvm.h                                               K=
ernel-based Virtual Machine
>                                                                         <=
mailto:kvm@vger.kernel.org>
> +0xAE  C6     arch/x86/kvm/x86.c                                        X=
86 KVM

I'd rather omit this entry.  0xAE C6 is covered by the entry above, and the=
 horror
in arch/x86/kvm/x86.c is purely a 32-bit compatibility alias for an ioctl t=
hat is
defined in kvm.h (the structure payload defines an pointer instead of a __u=
64).

If it's a sticking point, e.g. this will trip automated tooling over and ov=
er, then
I vote to move the relevant definitions to uapi headers, e.g.

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kv=
m.h
index 00ce265391e1..e02ef7a39f7c 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -230,6 +230,18 @@ struct kvm_msr_filter {
 	struct kvm_msr_filter_range ranges[KVM_MSR_FILTER_MAX_RANGES];
 };

+struct kvm_msr_filter_range_compat {
+	__u32 flags;
+	__u32 nmsrs;
+	__u32 base;
+	__u32 bitmap;
+};
+
+struct kvm_msr_filter_compat {
+	__u32 flags;
+	struct kvm_msr_filter_range_compat ranges[KVM_MSR_FILTER_MAX_RANGES];
+};
+
 struct kvm_cpuid_entry {
 	__u32 function;
 	__u32 eax;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0771efaf94c8..ef9f92cba589 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4260,21 +4260,6 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 }

 #ifdef CONFIG_KVM_COMPAT
-/* for KVM_X86_SET_MSR_FILTER */
-struct kvm_msr_filter_range_compat {
-	__u32 flags;
-	__u32 nmsrs;
-	__u32 base;
-	__u32 bitmap;
-};
-
-struct kvm_msr_filter_compat {
-	__u32 flags;
-	struct kvm_msr_filter_range_compat ranges[KVM_MSR_FILTER_MAX_RANGES];
-};
-
-#define KVM_X86_SET_MSR_FILTER_COMPAT _IOW(KVMIO, 0xc6, struct kvm_msr_fil=
ter_compat)
-
 long kvm_arch_vm_compat_ioctl(struct file *filp, unsigned int ioctl,
 			      unsigned long arg)
 {
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 8dff2fc1972e..54dbdabd0e9b 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1477,6 +1477,7 @@ struct kvm_enc_region {

 /* Available with KVM_CAP_X86_MSR_FILTER */
 #define KVM_X86_SET_MSR_FILTER	_IOW(KVMIO,  0xc6, struct kvm_msr_filter)
+#define KVM_X86_SET_MSR_FILTER_COMPAT _IOW(KVMIO, 0xc6, struct kvm_msr_fil=
ter_compat)

 /* Available with KVM_CAP_DIRTY_LOG_RING */
 #define KVM_RESET_DIRTY_RINGS		_IO(KVMIO, 0xc7)

>  0xAE  20-3F  linux/nitro_enclaves.h                                    N=
itro Enclaves
>  0xAF  00-1F  linux/fsl_hypervisor.h                                    F=
reescale hypervisor
> +0xAF  00-8F  linux/vhost.h                                             c=
onflict!
> +0xAF  31-32  drivers/vhost/test.h                                      c=
onflict!
>  0xB0  all                                                              R=
ATIO devices in development:
>                                                                         <=
mailto:vgo@ratio.de>
>  0xB1  00-1F                                                            P=
PPoX
