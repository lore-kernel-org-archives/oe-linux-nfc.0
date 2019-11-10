Content-Type: multipart/mixed; boundary="===============8401818778417676054=="
MIME-Version: 1.0
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2] ndef: Only register interface for known records
Date: Sun, 10 Nov 2019 17:37:29 +0100
Message-ID: <CAPybu_2+p6vzPnmD05jBksRdAH8sYwPYeojU_FrmCOmY_dN=kg@mail.gmail.com>
In-Reply-To: <20191109203830.GA31348@animalcreek.com>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8401818778417676054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Unfortunately I cannot contribute much. I am not using neard everyday,
it is not my area of expertise and I just got a baby #2, so not much
time left for hacking :).

On Sat, Nov 9, 2019 at 9:38 PM Mark Greer <mgreer@animalcreek.com> wrote:
>
> On Fri, Nov 08, 2019 at 10:05:01AM +0100, Samuel Ortiz wrote:
> > Hi Mark, Ricardo,
> >
> > On Thu, Nov 07, 2019 at 09:08:13PM -0700, Mark Greer wrote:
> > > On Wed, Nov 06, 2019 at 03:13:26PM +0100, Ricardo Ribalda Delgado wro=
te:
> > > > Hi
> > > >
> > > > This is just my yearly ping to check if it has been merged ;)
> > > >
> > > > Best regards
> > > >
> > > > On Mon, Oct 1, 2018 at 1:35 AM Mark Greer <mgreer@animalcreek.com=
> wrote:
> > > > >
> > > > > On Tue, Sep 18, 2018 at 08:19:52AM +0200, Ricardo Ribalda Delgado=
 wrote:
> > > > > > If we register the interface for unknown/error records neard da=
emon will
> > > > > > crash with no useful output message.
> > > > > > https://lists.01.org/pipermail/linux-nfc/2018-September/004445.=
html
> > > > > >
> > > > > > ...
> > > > > > neard[2404]: src/ndef.c:aar_exists() No AAR
> > > > > > neard[2404]: src/ndef.c:mime_payload_exists() No MIME payload
> > > > > > neard[2404]: D-Bus disconnect
> > > > > > neard[2404]: D-Bus disconnect (BT)
> > > > > > ...
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail=
.com>
> > > > > > ---
> > > > >
> > > > > FWIW,
> > > > >
> > > > > Reviewed-by: Mark Greer <mgreer@animalcreek.com>
> > >
> > > Hi Ricardo.
> > >
> > > I don't think anyone is maintaining neard nowadays.  :(
> >
> > I would say that's correct. I moved on to different areas and don't have
> > time to maintain it anymore. I also released my kernel NFC maintainer
> > role. Sorry about that.
> >
> > > I don't really have any suggestions for you on how to proceed.
> > >
> > > Samuel, any thoughts?
> >
> > What about moving the neard repo to github and have you or Ricardo (or
> > both) maintain it from there?
>
> I'm okay with that but I am really busy these days.  I'll do what I
> can but I know I won't be very prompt.  Ricardo, can you help me with
> that?
>
> Mark
> --



-- =

Ricardo Ribalda
--===============8401818778417676054==--

