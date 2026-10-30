Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328018;
	b=eDgZDybheWvyti+dt4cMYM7qOoNh0nHzi1O17DkVBNPLSA4Y/LNukQpzhTj8tc/uUXYt
	 vcNjJvpX4qoKR9GBT1Me84WsTcvGHJk2Hu0vRanlWi6Rs3FsxQGLMxHGz+s8VBnCGyPfX
	 7DnxMofP2z7JffPd34hN6y+gp5MhzHxjS41Tg4JZ/SIJIO7fxhfqVlC5e1WDTxWKNMIPP
	 guwrEoVMvSrt4LnjpGf65MWzkMr/lUirdIwNO4/b7zKRbf+j+3x3MMQBZJ/mg0wfDRlSW
	 B4PLHVvxNY+cHO6Mn90RXpGPELJ4XDF2KgOI4H6GlZPWan9Q+m9/RfSf4ZW1ZlTf1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+ELhbW/6uxFSOtLiXrpEjFCc5Al5bqntgfPHZO1Nwwg=;
	b=fRbR0WOkCJW6EDy9lrRvibzE0QK4YbnOABzCqfQ0WyzZ+x7e3okNqNgh4fsyA6PEMLlD
	 KJcgqWzMNtWiyYv6vqdcAbytyGhs+MACENeHC7w1QvUoe3eQdcexjNdGXirPJXAIoqjlm
	 z1MB/h9t+g0Ko72P+TDZE7BbKnuwFj4mxZKW9BaEPdImfBbzUbBE46o45sg0UJh4PMtIg
	 w5hR6xxEZOw4/i8+epiEux9izxyTWAKzDD+LUcMmnoCJa5UN0tgI7LZJeGOUZ6n/a0yUg
	 6h1QjNxgUIgSzKXqkfaJHM6bpGCwOwOU5n+Xcex0yM1XbQaFWjo0gJu7MTH+rlQc3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nv0PIhHW;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56186606A31C
	for <oe-linux-nfc@lists.linux.dev>; Fri, 30 Oct 2026 02:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56186606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nv0PIhHW
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so163619e0c.3
        for <oe-linux-nfc@lists.linux.dev>; Thu, 29 Oct 2026 19:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793328016; x=1793932816; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ELhbW/6uxFSOtLiXrpEjFCc5Al5bqntgfPHZO1Nwwg=;
        b=Nv0PIhHW4RC4G6WiwPgVF7xQ2CppHAPRRTOvJPKm4LUAN9cg0CsyH2tMJvJyckgb3B
         c+R+jluQjWMT/NxXLxokrgTIWgHqcN9/O6Cu80bSDWeITWr2nHd2Kf9C5H5a2VhQ6Jns
         L+RjoL9e0BzL6lr9Cg4ds4sUt9Z34ZLrlp5TaVSdeLYLp6IAWHTLogJjGqxCdA5blvxe
         E+3XUsFfSk863rzT7MKxJK1uUd++NqMe+UW+mIS20jWA55BzkhnuIozFJ7hbPc1yUI52
         oWm54GNyI6M+rDrPI3MAlqAuky4JA76ttRb4ZuwcMtCqcuZO7Rqh3y2nHvMRZatUX1bA
         Ia7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793328016; x=1793932816;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ELhbW/6uxFSOtLiXrpEjFCc5Al5bqntgfPHZO1Nwwg=;
        b=0oHv1O8P8YZ/nIafQ+kUFOXBATWHU8QRE6wkezeP1z5jtpfVWLrz1x9z6YPSB/sQpw
         bepFtEBcZGdUyl2veJuSQ9J3nkYKZP7Im4UUvXTZ4gwPOdZSoiwBysGEOsN4kDX9tDSk
         VLDYbVCkCNjE2pwi/NN5kp5S8KvqZ9tzlQd34rCbTYxqVIdb5EPVUX9v1BDUH1ps25ys
         n2vWgKCZGn4psdOLhNMK6fnf7KEM3igkfSoK6HKI19OkmESe2o/4SxJ+kdTXOQUA+ONg
         8BXtDzN0N9c1WTXxRysJEHvWruOhYvOxNuMrJ/SPGdwDA5OnNeaJNRUN1bMXYky3JiDE
         Y2CA==
X-Forwarded-Encrypted: i=1; AKwUvBwqbZr3PYreFXm+oJShQRGnQuOT2MjCgpLrCrE84H7xnNt+F1FImSdxRSwrjw2geG+jbYEtFSgTf7nYVdk=@lists.linux.dev
X-Gm-Message-State: AFq9FYKYAiQ5jQk3yqfTAV0azI3JDeLGwhqrAd4edigpI8spLFxWqv2o
	fGX8uqL1tFarNxtGT13IyEb6L8tRiOuHzw/Qxcr7EXv/ufNifGnCf8JT
X-Gm-Gg: AYBFou3/+j4G9EjGF8Y5oP+TUI9ep9OGAyoUxsrmm5nkkj862kiIvSEi3g02A4Z6X7/
	eSOAgQxNniBl6D7MMgrO5AbrjlLh//TJb/mIcnw2QvhzWkdeXpvxXQbB7TvLa1/ifnBloJzVRfH
	oZ7puoP7nYhgegatZwlXJF4m3UPUJShUgMxig/JPz7YjqnLmFHGYYRhhXQo3eTJ9hFpN6RSxiCh
	MWiY3PkOQ9HGGeDckVgNk9T+MJJfjktXyWuL3EYcNXtZdnPHGEEU7RBBFKsBQ1mOV0Zxs8gFEBt
	DB8UzQ9cfj9EYmQh0BBw2cb65MyCDUka+SEe08gCSwt2AFEGTkvMyfcY5Ywwm3OTfL0B0mrh9Uy
	CJpabWZitLrCmSKWIJb6VQaCns1cA9a2p/GQeQLEauPnEHnrbYpDqHE0oNAHfEwcfH5jTcYAKOs
	6m8TFKtOL/j60Xrx8ZGZmwezcU6x356/TKpOaEuV4xVZqCWV2yWaRuDN4LYo3TtSrMxHEDzkMlJ
	4wXW0r0Jmkj6HWbJr1kxWNBI6xIEOSoOks0TwYesqKQ8PML1i5tQnmQfHYEXCuZ+S4BbdE4ERlj
	U1VIWH64I96gKAnE2FiS/V6pBKwMHER6zkxh7YLs5Cx+EUR/B4wuXKkjzRUWO5j8ixJ2c0762hT
	HLjDEfSUmUCFzIRKM4bQoNEB0nH1Y
X-Received: by 2002:a05:6122:ec5:b0:5ea:dc36:245b with SMTP id 71dfb90a1353d-5ec6896de21mr562647e0c.18.1793328016018;
        Thu, 29 Oct 2026 19:40:16 -0700 (PDT)
Received: from macbook-pro-de-joas.local ([2804:7f0:b101:c5e8:ccdf:2b09:f69e:4902])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69c5d183sm963735e0c.13.2026.10.29.19.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:40:15 -0700 (PDT)
From: Joas Antonio dos Santos <joasantonio108@gmail.com>
To: David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, oe-linux-nfc@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net] nfc: s3fwrn5: validate the firmware image size against
 the firmware file
Date: Thu, 29 Oct 2026 23:40:02 -0300
Message-ID: <179332800288.52644.4206885352837613064@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: oe-linux-nfc@lists.linux.dev
List-Id: <oe-linux-nfc.lists.linux.dev>
List-Post: <mailto:oe-linux-nfc@lists.linux.dev>
List-Help: <mailto:oe-linux-nfc+help@lists.linux.dev>
List-Subscribe: <mailto:oe-linux-nfc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-linux-nfc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-linux-nfc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

s3fwrn5_fw_download() hashes and flashes sector_size * image_sectors
bytes starting at fw->image.  sector_size comes from the GET_BOOTINFO
response of the controller's bootloader and image_sectors and the image
offset come from the firmware file, and none of them is checked against
the size of the file.  s3fwrn5_fw_update_sector() also always sends
16 * 256 bytes from the start of each sector.

The controller decides whether the update runs at all: it reports the
version that s3fwrn5_fw_check_version() compares against in
CORE_INIT_RSP.  So on every device up, as long as the firmware file is
installed, a controller that reports a
large sector_size makes sha1() and the update loop read far past the
end of the firmware buffer, and one that reports a small sector_size
gets up to 4 KiB past the end of the image sent to it in
UPDATE_SECTOR data packets.

Check that everything that is hashed and sent lies within the image,
reject a zero sector_size, reject an image offset past the end of the
file, and make sure the GET_BOOTINFO response is long enough before
copying the 10 bytes of boot information out of it.

Fixes: c04c674fadeb ("nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC Chip")
Cc: stable@vger.kernel.org
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
---
Tested on arm64 QEMU with KASAN, with a test-only module that registers
s3fwrn5 through s3fwrn5_probe() on a virtual phy and a userspace
emulator for the NCI and bootloader protocols.  With a 4156 byte
firmware file (one 4096 byte sector) and the controller reporting an
older version:
- sector_size 0xffff: oops in sha1_ce_transform() from
  s3fwrn5_fw_download() without the patch, update refused with it;
- sector_size 16, 2 sectors: KASAN vmalloc-out-of-bounds in
  s3fwrn5_fw_prep_msg() while building an UPDATE_SECTOR data packet
  without the patch, update refused with it;
- sector_size 4096: the update runs the same with and without it.
Not tested on hardware.

 drivers/nfc/s3fwrn5/firmware.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/firmware.c b/drivers/nfc/s3fwrn5/firmware.c
index 9145deec7..159afb8de 100644
--- a/drivers/nfc/s3fwrn5/firmware.c
+++ b/drivers/nfc/s3fwrn5/firmware.c
@@ -93,7 +93,8 @@ static int s3fwrn5_fw_get_bootinfo(struct s3fwrn5_fw_info *fw_info,
 		return ret;
 
 	hdr = (struct s3fwrn5_fw_header *) rsp->data;
-	if (hdr->code != S3FWRN5_FW_RET_SUCCESS) {
+	if (hdr->code != S3FWRN5_FW_RET_SUCCESS ||
+	    rsp->len < S3FWRN5_FW_HDR_SIZE + 10) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -307,6 +308,10 @@ int s3fwrn5_fw_request_firmware(struct s3fwrn5_fw_info *fw_info)
 	memcpy(&fw->sig_size, fw->fw->data + 0x18, 4);
 
 	memcpy(&image_off, fw->fw->data + 0x1C, 4);
+	if (image_off > fw->fw->size) {
+		release_firmware(fw->fw);
+		return -EINVAL;
+	}
 	fw->image = fw->fw->data + image_off;
 	memcpy(&fw->image_sectors, fw->fw->data + 0x20, 4);
 
@@ -409,11 +414,26 @@ int s3fwrn5_fw_download(struct s3fwrn5_fw_info *fw_info)
 {
 	struct device *dev = &fw_info->ndev->nfc_dev->dev;
 	struct s3fwrn5_fw_image *fw = &fw_info->fw;
+	size_t image_avail = fw->fw->data + fw->fw->size -
+			     (const u8 *)fw->image;
+	u64 total = (u64)fw_info->sector_size * fw->image_sectors;
 	u8 hash_data[SHA1_DIGEST_SIZE];
 	u32 image_size, off;
 	int ret;
 
-	image_size = fw_info->sector_size * fw->image_sectors;
+	/* sector_size comes from the bootloader and image_sectors from the
+	 * firmware file.  The whole image is hashed, and
+	 * s3fwrn5_fw_update_sector() sends 16 * 256 bytes from the start of
+	 * each sector, so all of that must lie within the firmware image.
+	 */
+	if (!fw_info->sector_size || total > image_avail ||
+	    (fw->image_sectors &&
+	     total - fw_info->sector_size + 16 * 256 > image_avail)) {
+		dev_err(dev, "Invalid firmware image size\n");
+		return -EINVAL;
+	}
+
+	image_size = total;
 
 	/* Compute SHA of firmware data */
 	sha1(fw->image, image_size, hash_data);
-- 
2.43.0

