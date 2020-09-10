Content-Type: multipart/mixed; boundary="===============8885162168935876660=="
MIME-Version: 1.0
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-nfc@lists.01.org
Subject: Re: [PATCH v2 1/9] dt-bindings: net: nfc: s3fwrn5: Convert to dtschema
Date: Thu, 10 Sep 2020 12:53:07 +0200
Message-ID: <CAJKOXPeexek3Dq1Ly6z=PO51ULTWy+v13i-NDQm-Mz8YAET+iA@mail.gmail.com>
In-Reply-To: <20200908194520.GA786466@bogus>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8885162168935876660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Sep 2020 at 21:45, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, 06 Sep 2020 17:36:46 +0200, Krzysztof Kozlowski wrote:
> > Convert the Samsung S3FWRN5 NCI NFC controller bindings to dtschema.
> > This is conversion only so it includes properties with invalid prefixes
> > (s3fwrn5,en-gpios) which should be addressed later.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  .../devicetree/bindings/net/nfc/s3fwrn5.txt   | 25 --------
> >  .../bindings/net/nfc/samsung,s3fwrn5.yaml     | 61 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 62 insertions(+), 25 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/net/nfc/s3fwrn5.t=
xt
> >  create mode 100644 Documentation/devicetree/bindings/net/nfc/samsung,s=
3fwrn5.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> ./Documentation/devicetree/bindings/net/nfc/samsung,s3fwrn5.yaml: $id: re=
lative path/filename doesn't match actual path or filename
>         expected: http://devicetree.org/schemas/net/nfc/samsung,s3fwrn5.y=
aml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/=
nfc/samsung,s3fwrn5.example.dt.yaml: s3fwrn5(a)27: 's3fwrn5,en-gpios', 's3f=
wrn5,fw-gpios' do not match any of the regexes: '^#.*', '^(at25|devbus|dmac=
ap|dsa|exynos|fsi[ab]|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p=
|max8952|max8997|max8998|mpmc),.*', '^(pinctrl-single|#pinctrl-single|Power=
PC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(=
simple-audio-card|st-plgpio|st-spics|ts),.*', '^70mai,.*', '^GEFanuc,.*', '=
^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z=
0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abilis,.*', '^abracon,.*', '^acer,.*', '^acm=
e,.*', '^actions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapte=
va,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^advantech,.*', '^aeroflexga=
isler,.*', '^al,.*', '^allegro,.*', '^allo,.*', '^allwinner,.*', '^alphasca=
le,.*', '^alps,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^=
amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampire,.*', '^ams,.*', '^amstao=
s,.*', '^analogix,.*', '^andestech,.*', '^anvo,.*', '^apm,.*', '^aptina,.*'=
, '^arasan,.*', '^archermind,.*', '^arctic,.*', '^arcx,.*', '^aries,.*', '^=
arm,.*', '^armadeus,.*', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^a=
sc,.*', '^aspeed,.*', '^asus,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^au=
videa,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', =
'^axentia,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananap=
i,.*', '^beacon,.*', '^beagle,.*', '^bhf,.*', '^bitmain,.*', '^boe,.*', '^b=
osch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bticino,.*', '^buf=
falo,.*', '^bur,.*', '^calaosystems,.*', '^calxeda,.*', '^capella,.*', '^ca=
scoda,.*', '^catalyst,.*', '^cavium,.*', '^cdns,.*', '^cdtech,.*', '^cellwi=
se,.*', '^ceva,.*', '^checkpoint,.*', '^chipidea,.*', '^chipone,.*', '^chip=
spark,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,=
.*', '^cirrus,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*=
', '^compulab,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.=
*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csq,.*',=
 '^cubietech,.*', '^cypress,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*'=
, '^davicom,.*', '^dell,.*', '^delta,.*', '^denx,.*', '^devantech,.*', '^dh=
,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dioo,.*', '^dlc,.*', '^d=
lg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dptechni=
cs,.*', '^dragino,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebs-systa=
rt,.*', '^ebv,.*', '^eckelmann,.*', '^edt,.*', '^eeti,.*', '^einfochips,.*'=
, '^elan,.*', '^elgin,.*', '^elida,.*', '^embest,.*', '^emlid,.*', '^emmicr=
o,.*', '^empire-electronix,.*', '^emtrion,.*', '^endless,.*', '^ene,.*', '^=
energymicro,.*', '^engicam,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp=
,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*', =
'^evervision,.*', '^exar,.*', '^excito,.*', '^ezchip,.*', '^facebook,.*', '=
^fairphone,.*', '^faraday,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^fe=
iyang,.*', '^firefly,.*', '^focaltech,.*', '^frida,.*', '^friendlyarm,.*', =
'^fsl,.*', '^fujitsu,.*', '^gardena,.*', '^gateworks,.*', '^gcw,.*', '^ge,.=
*', '^geekbuying,.*', '^gef,.*', '^gemei,.*', '^geniatech,.*', '^giantec,.*=
', '^giantplus,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^goodix=
,.*', '^google,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^han=
nstar,.*', '^haoyu,.*', '^hardkernel,.*', '^hideep,.*', '^himax,.*', '^hisi=
licon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '^honeywell,.*=
', '^hoperun,.*', '^hp,.*', '^hsg,.*', '^hugsun,.*', '^hwacom,.*', '^hydis,=
.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^ifi,.=
*', '^ilitek,.*', '^img,.*', '^imi,.*', '^incircuit,.*', '^inet-tek,.*', '^=
infineon,.*', '^inforce,.*', '^ingenic,.*', '^innolux,.*', '^inside-secure,=
.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inv=
ersepath,.*', '^iom,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^i=
tead,.*', '^ivo,.*', '^iwave,.*', '^jdi,.*', '^jedec,.*', '^jesurun,.*', '^=
jianda,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas=
,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*'=
, '^kionix,.*', '^kobo,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kyo,.=
*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^=
leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*',=
 '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^linkspri=
te,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^lltc,.*=
', '^logicpd,.*', '^logictechno,.*', '^longcheer,.*', '^loongson,.*', '^lsi=
,.*', '^lwn,.*', '^lxa,.*', '^macnica,.*', '^mapleboard,.*', '^marvell,.*',=
 '^maxbotix,.*', '^maxim,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,=
.*', '^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.=
*', '^mellanox,.*', '^memsic,.*', '^menlo,.*', '^merrii,.*', '^micrel,.*', =
'^microchip,.*', '^microcrystal,.*', '^micron,.*', '^microsoft,.*', '^mikro=
e,.*', '^mikrotik,.*', '^miniand,.*', '^minix,.*', '^miramems,.*', '^mitsub=
ishi,.*', '^mosaixtech,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*=
', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*'=
, '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxicy,.*', '^myir,.*=
', '^national,.*', '^nec,.*', '^neonode,.*', '^netgear,.*', '^netlogic,.*',=
 '^netron-dy,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^nexbox,.*=
', '^nextthing,.*', '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nor=
dic,.*', '^novtech,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia=
,.*', '^nxp,.*', '^oceanic,.*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olp=
c,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^opencores,.=
*', '^openrisc,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustec=
h,.*', '^osddisplays,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmak=
er,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom=
,.*', '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine6=
4,.*', '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^pl=
da,.*', '^plx,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^portwell,=
.*', '^poslab,.*', '^pov,.*', '^powervr,.*', '^primux,.*', '^probox2,.*', '=
^prt,.*', '^pulsedlight,.*', '^purism,.*', '^qca,.*', '^qcom,.*', '^qemu,.*=
', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qnap,.*', '^radxa,.*', '^raidso=
nic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raydium,.*', '^r=
da,.*', '^realtek,.*', '^renesas,.*', '^rervision,.*', '^richtek,.*', '^ric=
oh,.*', '^rikomagic,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^roh=
m,.*', '^ronbo,.*', '^roofull,.*', '^samsung,.*', '^samtec,.*', '^sancloud,=
.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^seagate,.*',=
 '^seirobotics,.*', '^semtech,.*', '^sensirion,.*', '^sensortek,.*', '^sff,=
.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shimafuji,.*', '^s=
hiratech,.*', '^si-en,.*', '^si-linux,.*', '^sifive,.*', '^sigma,.*', '^sii=
,.*', '^sil,.*', '^silabs,.*', '^silead,.*', '^silergy,.*', '^silex-insight=
,.*', '^siliconmitus,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^si=
peed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skyworks,.*', '^smartlab=
s,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.*=
', '^solomon,.*', '^sony,.*', '^spansion,.*', '^sprd,.*', '^sst,.*', '^ssta=
r,.*', '^st,.*', '^st-ericsson,.*', '^starry,.*', '^startek,.*', '^ste,.*',=
 '^stericsson,.*', '^summit,.*', '^sunchip,.*', '^swir,.*', '^syna,.*', '^s=
ynology,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^techn=
exion,.*', '^technologic,.*', '^techstar,.*', '^tempo,.*', '^terasic,.*', '=
^tfc,.*', '^thine,.*', '^thingyjp,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '=
^tmt,.*', '^topeet,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^tosh=
iba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tron=
fy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^tyan,.*', '^u-blox,.*', =
'^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ugoos,.*', '^uniw=
est,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^utoo,.*', '^v3,.*', '^vaisa=
la,.*', '^vamrs,.*', '^variscite,.*', '^via,.*', '^videostrong,.*', '^virti=
o,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vocore=
,.*', '^voipac,.*', '^vot,.*', '^vxt,.*', '^waveshare,.*', '^wd,.*', '^we,.=
*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^winbond,.*', '^=
winstar,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^x-powers,.*', '=
^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^=
xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^ylm,.*', '^yna,.*', '^=
yones-toptech,.*', '^ysoft,.*', '^zarlink,.*', '^zeitec,.*', '^zidoo,.*', '=
^zii,.*', '^zte,.*', '^zyxel,.*'
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/vendor-prefixes.yaml

 My bad, I'll send v3.

Best regards,
Krzysztof
--===============8885162168935876660==--

