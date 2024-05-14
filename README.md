# ToWebp

This is a simple Bash script that converts all non-WebP images (JPG, JPEG, and PNG) in the current directory to WebP format. The script takes a single argument, which specifies the quality level for the WebP conversion.

**Warning:** This script will **remove** the original image files after converting them to WebP format. Ensure you have backups before running this script.

## usage:

The script is based on the `cwebp` command-line tool, which is part of the WebP image converter utilities. The main difference between this script and directly using `cwebp` is that this script automates the conversion process for all compatible images in the current directory. With `cwebp`, you would need to convert each image individually.

To use the script, simply run:

``` sh
towebp 90 #90 is the quality level
```

This command will convert all JPG, JPEG, and PNG images in the current directory to WebP format with a quality level of 90.
## installation process:

First, clone this repo or just copy the script on it to `.sh` file type,  or you can follow this steps:

1. Clone this repository:

``` sh
git clone https://github.com/averrois/ToWebp.git
```

2. Navigate to the repository directory:

``` sh
cd ToWebp
```

3. Make the script executable:

``` sh
chmod +x /towebp.sh
```

4. (Optional) Move or copy the script to a directory in your system's `PATH` for easy access from any location:

``` sh
sudo mv towebp.sh /usr/local/bin/towebp
```


Now, you can run the script from any directory by typing `towebp <quality>`.

**Note:** This script requires the `cwebp` command-line tool to be installed on your system. If you don't have it installed, you may need to install the appropriate package for your distribution (e.g., `webp` on Ubuntu/Debian or `libwebp-tools` on CentOS/RHEL).
