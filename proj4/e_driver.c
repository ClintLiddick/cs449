/* 
 * e_driver
 * CS0449 - Project 4
 * Clinton Liddick
 * 07/16/14
 */

#include <linux/fs.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/module.h>

#include <asm/uaccess.h>

#include "e.h"

/*
 * function called on read()
 */
static ssize_t e_driver_read(struct file * file, char * buf, 
			  size_t count, loff_t *ppos)
{
	int total_e = count + (int) *ppos;
	char e_buf[total_e];
	e(e_buf,total_e);

	/*
	 * Besides copying the string to the user provided buffer,
	 * this function also checks that the user has permission to
	 * write to the buffer, that it is mapped, etc.
	 */
	if (copy_to_user(buf, &e_buf[*ppos], count))
		return -EINVAL;
	/*
	 * Tell the user how much data we wrote.
	 */
	*ppos = count;

	return count;
}

/*
 * The only file operation we care about is read.
 */

static const struct file_operations e_driver_fops = {
	.owner		= THIS_MODULE,
	.read		= e_driver_read,
};

static struct miscdevice e_driver = {
	/*
	 * We don't care what minor number we end up with, so tell the
	 * kernel to just pick one.
	 */
	MISC_DYNAMIC_MINOR,
	/*
	 * Name ourselves /dev/e
	 */
	"e_driver",
	/*
	 * What functions to call when a program performs file
	 * operations on the device.
	 */
	&e_driver_fops
};

static int __init
e_driver_init(void)
{
	int ret;

	/*
	 * Create the "e_driver" device in the /sys/class/misc directory.
	 */
	ret = misc_register(&e_driver);
	if (ret)
		printk(KERN_ERR
		       "Unable to register e_driver misc device\n");

	return ret;
}

module_init(e_driver_init);

static void __exit
e_driver_exit(void)
{
	misc_deregister(&e_driver);
}

module_exit(e_driver_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Clinton Liddick <cwl12@pitt.edu>");
MODULE_DESCRIPTION("e_driver minimal module");
MODULE_VERSION("dev");
