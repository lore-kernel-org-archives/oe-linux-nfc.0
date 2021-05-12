Content-Type: multipart/mixed; boundary="===============4150721793952359975=="
MIME-Version: 1.0
From: Oliver Neukum <oneukum@suse.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH] NFC: cooperation with runtime PM
Date: Wed, 12 May 2021 15:56:04 +0200
Message-ID: <a5eda19c63b1aef7141f2814109eb969020ca650.camel@suse.com>
In-Reply-To: <20210512134413.31808-1-oneukum@suse.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============4150721793952359975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 12.05.2021, 15:44 +0200 schrieb Oliver Neukum:
> We cannot rely on the underlying hardware to do correct
> runtime PM. NFC core needs to get PM reference while
> a device is operational, lest it be suspended when
> it is supposed to be waiting for a target to come
> into range.
> =


Sorry for sending this out with an uncompleted change log.
It went out unintentionally early.

	Regards
		Oliver


--===============4150721793952359975==--

