Content-Type: multipart/mixed; boundary="===============8728145606573179065=="
MIME-Version: 1.0
From: krzk@kernel.org
To: linux-nfc@lists.01.org
Subject: Re: [PATCH net-next 2/2] net: nfc: s3fwrn5: Support a UART interface
Date: Mon, 23 Nov 2020 09:19:40 +0100
Message-ID: <20201123081940.GA9323@kozik-lap>
In-Reply-To: <20201123075658epcms2p5a6237314f7a72a2556545d3f96261c93@epcms2p5>
List-Id: <oe-linux-nfc.lists.linux.dev>

--===============8728145606573179065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 04:56:58PM +0900, Bongsu Jeon wrote:
> Since S3FWRN82 NFC Chip, The UART interface can be used.
> S3FWRN82 uses NCI protocol and supports I2C and UART interface.
> =

> Signed-off-by: Bongsu Jeon <bongsu.jeon@samsung.com>

Please start sending emails properly, e.g. with git send-email, so all
your patches in the patchset are referencing the first patch.

> ---
>  drivers/nfc/s3fwrn5/Kconfig  |  12 ++
>  drivers/nfc/s3fwrn5/Makefile |   2 +
>  drivers/nfc/s3fwrn5/uart.c   | 250 +++++++++++++++++++++++++++++++++++
>  3 files changed, 264 insertions(+)
>  create mode 100644 drivers/nfc/s3fwrn5/uart.c
> =

> diff --git a/drivers/nfc/s3fwrn5/Kconfig b/drivers/nfc/s3fwrn5/Kconfig
> index 3f8b6da58280..6f88737769e1 100644
> --- a/drivers/nfc/s3fwrn5/Kconfig
> +++ b/drivers/nfc/s3fwrn5/Kconfig
> @@ -20,3 +20,15 @@ config NFC_S3FWRN5_I2C
>  	  To compile this driver as a module, choose m here. The module will
>  	  be called s3fwrn5_i2c.ko.
>  	  Say N if unsure.
> +
> +config NFC_S3FWRN82_UART
> +	tristate "Samsung S3FWRN82 UART support"
> +	depends on NFC_NCI && SERIAL_DEV_BUS

What about SERIAL_DEV_BUS as module? Shouldn't this be
SERIAL_DEV_BUS || !SERIAL_DEV_BUS?

> +	select NFC_S3FWRN5
> +	help
> +	  This module adds support for a UART interface to the S3FWRN82 chip.
> +	  Select this if your platform is using the UART bus.
> +
> +	  To compile this driver as a module, choose m here. The module will
> +	  be called s3fwrn82_uart.ko.
> +	  Say N if unsure.
> diff --git a/drivers/nfc/s3fwrn5/Makefile b/drivers/nfc/s3fwrn5/Makefile
> index d0ffa35f50e8..d1902102060b 100644
> --- a/drivers/nfc/s3fwrn5/Makefile
> +++ b/drivers/nfc/s3fwrn5/Makefile
> @@ -5,6 +5,8 @@
>  =

>  s3fwrn5-objs =3D core.o firmware.o nci.o
>  s3fwrn5_i2c-objs =3D i2c.o
> +s3fwrn82_uart-objs =3D uart.o
>  =

>  obj-$(CONFIG_NFC_S3FWRN5) +=3D s3fwrn5.o
>  obj-$(CONFIG_NFC_S3FWRN5_I2C) +=3D s3fwrn5_i2c.o
> +obj-$(CONFIG_NFC_S3FWRN82_UART) +=3D s3fwrn82_uart.o
> diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
> new file mode 100644
> index 000000000000..b3c36a5b28d3
> --- /dev/null
> +++ b/drivers/nfc/s3fwrn5/uart.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * UART Link Layer for S3FWRN82 NCI based Driver
> + *
> + * Copyright (C) 2020 Samsung Electronics
> + * Author: Bongsu Jeon <bongsu.jeon@samsung.com>

You copied a lot from existing i2c.c. Please keep also the original
copyrights.

> + * All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/nfc.h>
> +#include <linux/netdevice.h>
> +#include <linux/of.h>
> +#include <linux/serdev.h>
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>
> +
> +#include "s3fwrn5.h"
> +
> +#define S3FWRN82_UART_DRIVER_NAME "s3fwrn82_uart"

Remove the define, it is used only once.

> +#define S3FWRN82_NCI_HEADER 3
> +#define S3FWRN82_NCI_IDX 2
> +#define S3FWRN82_EN_WAIT_TIME 20
> +#define NCI_SKB_BUFF_LEN 258
> +
> +struct s3fwrn82_uart_phy {
> +	struct serdev_device *ser_dev;
> +	struct nci_dev *ndev;
> +	struct sk_buff *recv_skb;
> +
> +	unsigned int gpio_en;
> +	unsigned int gpio_fw_wake;
> +
> +	/* mutex is used to synchronize */

Please do not write obvious comments. Mutex is always used to
synchronize, what else is it for? Instead you must describe what exactly
is protected with mutex.

> +	struct mutex mutex;
> +	enum s3fwrn5_mode mode;
> +};
> +
> +static void s3fwrn82_uart_set_wake(void *phy_id, bool wake)
> +{
> +	struct s3fwrn82_uart_phy *phy =3D phy_id;
> +
> +	mutex_lock(&phy->mutex);
> +	gpio_set_value(phy->gpio_fw_wake, wake);
> +	msleep(S3FWRN82_EN_WAIT_TIME);
> +	mutex_unlock(&phy->mutex);
> +}
> +
> +static void s3fwrn82_uart_set_mode(void *phy_id, enum s3fwrn5_mode mode)
> +{
> +	struct s3fwrn82_uart_phy *phy =3D phy_id;
> +
> +	mutex_lock(&phy->mutex);
> +	if (phy->mode =3D=3D mode)
> +		goto out;
> +	phy->mode =3D mode;
> +	gpio_set_value(phy->gpio_en, 1);
> +	gpio_set_value(phy->gpio_fw_wake, 0);
> +	if (mode =3D=3D S3FWRN5_MODE_FW)
> +		gpio_set_value(phy->gpio_fw_wake, 1);
> +	if (mode !=3D S3FWRN5_MODE_COLD) {
> +		msleep(S3FWRN82_EN_WAIT_TIME);
> +		gpio_set_value(phy->gpio_en, 0);
> +		msleep(S3FWRN82_EN_WAIT_TIME);
> +	}
> +out:
> +	mutex_unlock(&phy->mutex);
> +}
> +
> +static enum s3fwrn5_mode s3fwrn82_uart_get_mode(void *phy_id)
> +{
> +	struct s3fwrn82_uart_phy *phy =3D phy_id;
> +	enum s3fwrn5_mode mode;
> +
> +	mutex_lock(&phy->mutex);
> +	mode =3D phy->mode;
> +	mutex_unlock(&phy->mutex);
> +	return mode;
> +}

All this duplicates I2C version. You need to start either reusing common
blocks.

> +
> +static int s3fwrn82_uart_write(void *phy_id, struct sk_buff *out)
> +{
> +	struct s3fwrn82_uart_phy *phy =3D phy_id;
> +	int err;
> +
> +	err =3D serdev_device_write(phy->ser_dev,
> +				  out->data, out->len,
> +				  MAX_SCHEDULE_TIMEOUT);
> +	if (err < 0)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static const struct s3fwrn5_phy_ops uart_phy_ops =3D {
> +	.set_wake =3D s3fwrn82_uart_set_wake,
> +	.set_mode =3D s3fwrn82_uart_set_mode,
> +	.get_mode =3D s3fwrn82_uart_get_mode,
> +	.write =3D s3fwrn82_uart_write,
> +};
> +
> +static int s3fwrn82_uart_read(struct serdev_device *serdev,
> +			      const unsigned char *data,
> +			      size_t count)
> +{
> +	struct s3fwrn82_uart_phy *phy =3D serdev_device_get_drvdata(serdev);
> +	size_t i;
> +
> +	for (i =3D 0; i < count; i++) {
> +		skb_put_u8(phy->recv_skb, *data++);
> +
> +		if (phy->recv_skb->len < S3FWRN82_NCI_HEADER)
> +			continue;
> +
> +		if ((phy->recv_skb->len - S3FWRN82_NCI_HEADER)
> +				< phy->recv_skb->data[S3FWRN82_NCI_IDX])
> +			continue;
> +
> +		s3fwrn5_recv_frame(phy->ndev, phy->recv_skb, phy->mode);
> +		phy->recv_skb =3D alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
> +		if (!phy->recv_skb)
> +			return 0;
> +	}
> +
> +	return i;
> +}
> +
> +static struct serdev_device_ops s3fwrn82_serdev_ops =3D {

const

> +	.receive_buf =3D s3fwrn82_uart_read,
> +	.write_wakeup =3D serdev_device_write_wakeup,
> +};
> +
> +static const struct of_device_id s3fwrn82_uart_of_match[] =3D {
> +	{ .compatible =3D "samsung,s3fwrn82-uart", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, s3fwrn82_uart_of_match);
> +
> +static int s3fwrn82_uart_parse_dt(struct serdev_device *serdev)
> +{
> +	struct s3fwrn82_uart_phy *phy =3D serdev_device_get_drvdata(serdev);
> +	struct device_node *np =3D serdev->dev.of_node;
> +
> +	if (!np)
> +		return -ENODEV;
> +
> +	phy->gpio_en =3D of_get_named_gpio(np, "en-gpios", 0);
> +	if (!gpio_is_valid(phy->gpio_en))
> +		return -ENODEV;
> +
> +	phy->gpio_fw_wake =3D of_get_named_gpio(np, "wake-gpios", 0);

You should not cast it it unsigned int. I'll fix the s3fwrn5 from which
you copied this apparently.

> +	if (!gpio_is_valid(phy->gpio_fw_wake))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int s3fwrn82_uart_probe(struct serdev_device *serdev)
> +{
> +	struct s3fwrn82_uart_phy *phy;
> +	int ret =3D -ENOMEM;
> +
> +	phy =3D devm_kzalloc(&serdev->dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		goto err_exit;
> +
> +	phy->recv_skb =3D alloc_skb(NCI_SKB_BUFF_LEN, GFP_KERNEL);
> +	if (!phy->recv_skb)
> +		goto err_free;
> +
> +	mutex_init(&phy->mutex);
> +	phy->mode =3D S3FWRN5_MODE_COLD;
> +
> +	phy->ser_dev =3D serdev;
> +	serdev_device_set_drvdata(serdev, phy);
> +	serdev_device_set_client_ops(serdev, &s3fwrn82_serdev_ops);
> +	ret =3D serdev_device_open(serdev);
> +	if (ret) {
> +		dev_err(&serdev->dev, "Unable to open device\n");
> +		goto err_skb;
> +	}
> +
> +	ret =3D serdev_device_set_baudrate(serdev, 115200);

Why baudrate is fixed?

> +	if (ret !=3D 115200) {
> +		ret =3D -EINVAL;
> +		goto err_serdev;
> +	}
> +
> +	serdev_device_set_flow_control(serdev, false);
> +
> +	ret =3D s3fwrn82_uart_parse_dt(serdev);
> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	ret =3D devm_gpio_request_one(&phy->ser_dev->dev,
> +				    phy->gpio_en,
> +				    GPIOF_OUT_INIT_HIGH,
> +				    "s3fwrn82_en");

This is weirdly wrapped.

> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	ret =3D devm_gpio_request_one(&phy->ser_dev->dev,
> +				    phy->gpio_fw_wake,
> +				    GPIOF_OUT_INIT_LOW,
> +				    "s3fwrn82_fw_wake");
> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	ret =3D s3fwrn5_probe(&phy->ndev, phy, &phy->ser_dev->dev, &uart_phy_op=
s);
> +	if (ret < 0)
> +		goto err_serdev;
> +
> +	return ret;
> +
> +err_serdev:
> +	serdev_device_close(serdev);
> +err_skb:
> +	kfree_skb(phy->recv_skb);
> +err_free:
> +	kfree(phy);

Eee.... why? Did you test this code?

> +err_exit:
> +	return ret;
> +}
> +
> +static void s3fwrn82_uart_remove(struct serdev_device *serdev)
> +{
> +	struct s3fwrn82_uart_phy *phy =3D serdev_device_get_drvdata(serdev);
> +
> +	s3fwrn5_remove(phy->ndev);
> +	serdev_device_close(serdev);
> +	kfree_skb(phy->recv_skb);
> +	kfree(phy);

This does not look like tested...

Best regards,
Krzysztof
--===============8728145606573179065==--

