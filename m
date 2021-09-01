Content-Type: multipart/mixed; boundary="===============3602655320879977969=="
MIME-Version: 1.0
From: LinMa <linma@zju.edu.cn>
To: linux-nfc@lists.01.org
Subject: set dev->rfkill to NULL in device cleanup routine
Date: Wed, 01 Sep 2021 07:39:43 +0000
Message-ID: <5b6649e2.af5bf.17ba04c8d62.Coremail.linma@zju.edu.cn>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============3602655320879977969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In nfc_unregister_device() function, the dev->rfkill is forgotten to set to=
 NULL after the rfkill_destroy(). This may lead to possible cocurrency UAF =
in other functions like nfc_dev_up().



The FREE chain is like


void nfc_unregister_device(struct nfc_dev *dev)
{
  int rc;
  pr_debug("dev_name=3D%s\n", dev_name(&dev->dev));
  if (dev->rfkill) {
    rfkill_unregister(dev->rfkill);
    rfkill_destroy(dev->rfkill);
  // ......
}



The USE chain is like


static int nfc_genl_dev_up(struct sk_buff *skb, struct genl_info *info)
{
  struct nfc_dev *dev;
  int rc;
  u32 idx;
  if (!info->attrs[NFC_ATTR_DEVICE_INDEX])
    return -EINVAL;
  idx =3D nla_get_u32(info->attrs[NFC_ATTR_DEVICE_INDEX]);
  dev =3D nfc_get_device(idx);
  if (!dev)
    return -ENODEV;
  rc =3D nfc_dev_up(dev);

  // ......
}


int nfc_dev_up(struct nfc_dev *dev)
{
  int rc =3D 0;
  pr_debug("dev_name=3D%s\n", dev_name(&dev->dev));
  device_lock(&dev->dev);
  if (dev->rfkill && rfkill_blocked(dev->rfkill)) { // dev->rfkill is not N=
ULL here
    rc =3D -ERFKILL;
    goto error;
  }
  // ......
}


The FREE chain and USE chain can be like below (as there is no locking prot=
ection).


Therefore, the below patch can be added.


Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 net/nfc/core.c | 1 +
 1 file changed, 1 insertion(+)
diff --git a/net/nfc/core.c b/net/nfc/core.c
index 573c80c6ff7a..d0b3224e65d7 100644
--- a/net/nfc/core.c
+++ b/net/nfc/core.c
@@ -1157,6 +1157,7 @@ void nfc_unregister_device(struct nfc_dev *dev)
  if (dev->rfkill) {
  rfkill_unregister(dev->rfkill);
  rfkill_destroy(dev->rfkill);
+ dev->rfkill =3D NULL;
  }
  if (dev->ops->check_presence) {
--
2.32.0
--===============3602655320879977969==--

