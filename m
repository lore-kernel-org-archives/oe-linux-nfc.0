Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794459066;
	b=EIYOoiB6UjSZ1aTstO9rzR0A6JwmfWRNkEb7oLXsJCaeuxd4RLmV73qXuspTW1wPh031
	 1hgIpmR0jWx41mCbJkRFm3iQswE3c9AvUwDIZ1Cy13qROLtkMldULf7S5AxmTGyfq2lDM
	 fXe2MTGJUiD83NazlY4YH/YN1ZFNylFTe/X/8T1llze0S5zvFd+0yX8bV/CkNzXsn+rqO
	 KPY/MGWzrMaMb1duWbOyf7rqb95GVzZKRe+9rLb8SkzTTsH+yUIZt+CNm5RCqUNtbEWfU
	 PMtcnGhksr2Gb0RaAxeIxdrVkhfGHVo7nOyyDdN8Keittt7+xrMoColMoPBxTkp16yA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Ic4/3yqU98R41fWPtoalfPMj3NGCs6yiQzhB+XxZZ7c=;
	b=UrR71iBD51JzXeOdGV9PXQHfYpZLZE6woXUZOYGniezi7sM232ZwEkWHE25F+/0lCG+P
	 B+/oC6nMdkoFhoJMhxkVgF64Jep866rWpeQ+GyXF6Scb+EgcphCPl3x/WtkoPCslNghvx
	 mDNddlgcmBbQwXJpdeHR9wbLzvowQJN+YEwxTdRqt/3kUFmyOck4IFgmykcCnoagzoa+C
	 zimXTdZE44q9zcThy8JypSqr69AX6OmWB4flj/le8vrFIc2kMsZ6BU5rZrt2drTS8Hh09
	 RyuCSbur+viUOwFHXtNzUDd/QoL2D+xT+SBli33CgPu6QPKZVZo3/BXMmqNePrvY32w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=je0X2fv8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B4A606A321
	for <oe-linux-nfc@lists.linux.dev>; Thu, 12 Nov 2026 04:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=je0X2fv8
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab53a99771so32197271fa.3
        for <oe-linux-nfc@lists.linux.dev>; Wed, 11 Nov 2026 20:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794459064; cv=none;
        d=google.com; s=arc-20260327;
        b=iBpFAHmp0GrzhFVAq3irQ5PbR+G40UiVo7XP+bYOPC7an9WNY+DfLR1NhDoxkEom92
         GqNXv1qaQh1LzJs6RSPJxBdv939qS7WIXFiJGdf2F8v4bixC+7GaKUMxo4dXE1ai58PE
         pMQQa8HsAyHdHtHsHdNNRXUHyNes3j8zEFe+3/a4BR97vrODzgi+uBOGOUEos90VvO7P
         t17G9i5sTBCpHaPmXpXVLUKXm6CRHGeBgFqP4mbEXBiA5SC37dD3lmRL80tWYsb+UOI6
         Jyu68vp3X6MpwBHXPH/MdebJbCOYQG5sTCP3HnoZh/VT94MPbCU5xkBNhccV+4vOHhzB
         5dbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ic4/3yqU98R41fWPtoalfPMj3NGCs6yiQzhB+XxZZ7c=;
        fh=shS5dIvuYLwQMMfPB5eOWMUh5Hj0crIEpVNZksj8shw=;
        b=b8f+NJyKAVLpUoH8eghvXRKejz1OLhdwhPqI4mxYhXLGzTjvPmHTZ9JNqfwONEU0IK
         2Z8bt0itljEVtOBLKlH8fl4k9HqmfkbeC96yCxJcRtYNMvMjKOOFXxWGgc3379Z/oqpL
         Y9Pgf8jR0isWPT8tx+csGlsOOw6PfG4uSD9wVe3QCv6vAFieeJDKFdOQuCE3kgAotYMQ
         xZbWbBVAWcwrt/RjC2I7eemrmROR9gpffkxxdv+90omtyz/QE6BcLLKCMKSO2b38RIvk
         +dNFA3rK3jLMxUAkW+OwJvViGqxGyFg9nIjZUK/4iCvFz2Q2uhd5Q8mu6bKklHffvZux
         kkjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459064; x=1795063864; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ic4/3yqU98R41fWPtoalfPMj3NGCs6yiQzhB+XxZZ7c=;
        b=je0X2fv8Iw1VtGs4UyIKQNt0Jc68OQv+B8hhyapUoapBo/ANbZrNRJ0Gk74zt1Unef
         maOn2i33uqXtVr6aYvPOuT0w/63ez8MXd48B3CIoKVjcyPZzUE9/xh27sA4icR85gG6E
         vaPLx3bvdIrb5poCi7rfse/GT10efLS3id7ityl0/jcLbIkpKTiLGr467laVVxxazD0E
         yPKRWlcM/Kavtp38xugUD50CCMv9xv8GQ3046OolFifdNhWVuHt/yJ9J87JonMfRb2vN
         8r3Frk4rN4qC00LZ+h8bYkJIQcsRwWHiBW1GkXXbt+Rr9JKcl+YEbNed2yLaXeBWuguF
         Homg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459064; x=1795063864;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ic4/3yqU98R41fWPtoalfPMj3NGCs6yiQzhB+XxZZ7c=;
        b=wjR+VEO2yC1lsa9Uw08tgwbX+NrLLd/YJrqCoh9f8h0Ita3Kaeo9lWzff+EPNP5kdA
         j1lLuEL+OPwGnfruKZEdiSRwBQJxto0iQO4E1HivLJfWLmBz3x07xCp5SPuCpMOYMPy4
         PCKw9IxJY3txOnWTDlNIL4p7HGGHJ3k9yH0/+5ZmX/QaomAkvJF9HpVfFIw60a3toLGd
         inktd0OOQNWvpaf7/j6Am7CNcPYDQ8csNtwuZ/LSGdDtSBrfi1OcXC7tZJK7/+2GTTiu
         NXal9OrFwN0QYqkJJvOrqWPW1HCllwGBCsXS9jn2DKP8X9ek1xLvQ9L0kjFICq9JPW2F
         IVNg==
X-Gm-Message-State: APuU4Z84xG/MH8dab76f0V3X2ZouwVTchXXLrLDUUogGfDXPnjKfUWCq
	GzD6vYESSAygQEWLk1+7rP0RB7aF/GiCp8XPt1a5LPGHsBFr/7NVvzq8kaYxgbC4vTGqACrZwYk
	qOvh0FsQkS4KERJoWNOoHbif/G5yAdsdvRTuy
X-Gm-Gg: AYBFou101iR9HOHOAMz7O11Zgwe+F1grQ3S5yPYTDzaSSjXTjCMSN6ceub25lKo29gd
	f03PeWmFBbzLYc4VCWW1sLxpYyyidjDJEcWX6LddwcE7AbJeeucx0yfDkI/xCCil4/qJeR6jL3k
	mDktSXupI3DE/DlcF2G2DsR+13VlECE/5rNrfk9JSjtZ/2r+lEop5CP52qADZKzIfx1rXuF4YT9
	7+x91rL9zisz9VB8tMnt1Dw8tOxGSWTycCqITVBgxM4U4CheSbgHOTK4X6YnpXbd2rpFLcdi6y5
	iH41bM2NF4QcUx5zKCAw+wKICIjhlU9G/otDd1yfvp2u6skvmQ52ugu5hdASabS3G5UuyKeE+FA
	cNB8kElF4OsIrd+HTXh9bulNdpvB4WMLgiK/7d0i+VT66MNGBG5RAAL+OphTUchpA8IHjcgqmxe
	knM7N1WpgS/jOcjJ2DQiisLKTe5YcgzIy5DBdG+FKrth2hQ/RUKAK7888Tt2zU2Xo=
X-Received: by 2002:a05:651c:2124:b0:3ac:b3bf:ee5a with SMTP id
 38308e7fff4ca-3ae1266c78dmr10046431fa.9.1794459064280; Wed, 11 Nov 2026
 20:51:04 -0800 (PST)
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: bin luo <luob87709@gmail.com>
Date: Thu, 12 Nov 2026 12:50:52 +0800
X-Gm-Features: AclHuK_kOzKCtEKWTZa3JazOhH2iS2HB4uWBI7ElmckBp7Vl3bv8lImRGnkZtVo
Message-ID: <CALa7h7FHWZRHxnqEeAUEH=CNs6Y9pnkfPq1LrDHGfyCNaoqAeg@mail.gmail.com>
Subject: [PATCH] NFC: fix skb ownership on data exchange errors
To: oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David and Johan,

Thanks for reviewing the report. I will follow up with this as an ordinary
NFC bug fix.

The issue is that a data-exchange completion may pass both a non-NULL
response skb and a nonzero error to its callback, but the callback contract
does not state who owns the skb in that case. In rawsock,
rawsock_data_exchange_complete() jumps directly to its error handling path
and never reaches the existing error_skb cleanup. The LLCP completion
callback has the same ownership gap: nfc_llcp_recv() logs the error and
returns without releasing a non-NULL skb.

I propose to make the rule explicit: ownership of every non-NULL response
skb transfers to the callback, irrespective of err. The rawsock and LLCP
callbacks then release the skb on their error paths. Digital DEP currently
calls the callback and then falls through to cleanup that may free resp
again when rc is nonzero; setting resp to NULL immediately after the
callback prevents that double-free. The digital_core completion already
frees an errored response and passes NULL to its callback. The NCI loopback
callback also needs to release skb if its connection lookup fails.

The final five-file patch was built against Linux v7.4-rc1, commit
6628e7d4c6b25c8d18f1345e3a20d21829aae7e4, with the same x86_64
NFC_VIRTUAL_NCI, KASAN, and kmemleak configuration used for the baseline.
The QEMU TCG guest ran 32 NCI 1.0 MIFARE exchanges with a nonzero data
status. Each rawsock create/connect/send/error-receive sequence ran with
effective UID 65534 after the root harness had provisioned the virtual NCI
device and polling session. All 32 iterations passed. The fixed-kernel
serial log contains no kmemleak unreferenced-object records and no KASAN
report. The baseline run of the same test recorded 48 kmemleak suspects.
This runtime test covers the NCI-to-rawsock path; the Digital DEP and LLCP
changes were compile-tested but were not triggered by this QEMU selftest.
The NCI loopback cleanup was compiled but that failure branch was not
triggered by the QEMU selftest.

For reproduction, the root harness opens /dev/virtual_nci, registers a
virtual NCI controller, and starts polling for a MIFARE target. The test then
switches its effective UID to 65534, creates an AF_NFC SOCK_SEQPACKET socket,
connects to the target, and sends the MIFARE command 30 00. The virtual
controller returns the NCI data frame 00 00 02 aa 01: connection id 0, RFU 0,
payload length 2, response byte aa, and nonzero data status 01. The guest
repeats this as 32 separately initialized virtual-device sessions and runs
kmemleak scans afterward. The same test on the baseline produced 47 detailed
unreferenced-object records; the fixed run produced none.

The complete proposed change is inline below; no binary attachment is
included.Best regards,

Bin Luo
University of Electronic Science and Technology of China (UESTC)


Signed-off-by: Bin Luo <luob87709@gmail.com>

---
 include/net/nfc/nfc.h | 2 ++
 net/nfc/nci/core.c    | 1 +
 net/nfc/rawsock.c     | 5 ++++-
 net/nfc/llcp_core.c   | 2 ++
 net/nfc/digital_dep.c | 1 +
 5 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/net/nfc/nfc.h b/include/net/nfc/nfc.h
--- a/include/net/nfc/nfc.h
+++ b/include/net/nfc/nfc.h
@@ -38,5 +38,7 @@
  * When a rx or tx package is lost or corrupted or the target gets out
  * of the operating field, err is -EIO.
+ * If skb is non-NULL, ownership is transferred to the callback regardless
+ * of err. Providers must not access or free skb after invoking the callback.
  */
 typedef void (*data_exchange_cb_t)(void *context, struct sk_buff *skb,
  int err);

diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
--- a/net/nfc/rawsock.c
+++ b/net/nfc/rawsock.c
@@ -157,5 +157,8 @@
  pr_debug("sk=%p err=%d\n", sk, err);

- if (err)
- goto error;
+ if (err) {
+ if (skb)
+ kfree_skb(skb);
+ goto error;
+ }

diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -1638,4 +1638,6 @@
  if (err < 0) {
  pr_err("LLCP PDU receive err %d\n", err);
+ if (skb)
+ kfree_skb(skb);
  return;
  }

diff --git a/net/nfc/digital_dep.c b/net/nfc/digital_dep.c
--- a/net/nfc/digital_dep.c
+++ b/net/nfc/digital_dep.c
@@ -883,3 +883,4 @@
 exit:
  data_exch->cb(data_exch->cb_context, resp, rc);
+ resp = NULL;

 error:

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -414,5 +414,6 @@
  conn_info = nci_get_conn_info_by_conn_id(ndev, ndev->cur_conn_id);
  if (!conn_info) {
+ kfree_skb(skb);
  nci_req_complete(ndev, NCI_STATUS_REJECTED);
  return;
  }
