Content-Type: multipart/mixed; boundary="===============8089154906543500329=="
MIME-Version: 1.0
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2] ndef: Only register interface for known records
Date: Wed, 06 Nov 2019 15:13:26 +0100
Message-ID: <CAPybu_297JGrQ1WtG7D277MnhVMboYHSTV_KBNCsjA6uJab4RA@mail.gmail.com>
In-Reply-To: <20180930233513.GA16410@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8089154906543500329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

This is just my yearly ping to check if it has been merged ;)

Best regards

On Mon, Oct 1, 2018 at 1:35 AM Mark Greer <mgreer@animalcreek.com> wrote:
>
> On Tue, Sep 18, 2018 at 08:19:52AM +0200, Ricardo Ribalda Delgado wrote:
> > If we register the interface for unknown/error records neard daemon will
> > crash with no useful output message.
> > https://lists.01.org/pipermail/linux-nfc/2018-September/004445.html
> >
> > ...
> > neard[2404]: src/ndef.c:aar_exists() No AAR
> > neard[2404]: src/ndef.c:mime_payload_exists() No MIME payload
> > neard[2404]: D-Bus disconnect
> > neard[2404]: D-Bus disconnect (BT)
> > ...
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> > ---
>
> FWIW,
>
> Reviewed-by: Mark Greer <mgreer@animalcreek.com>



--
Ricardo Ribalda
--===============8089154906543500329==--

