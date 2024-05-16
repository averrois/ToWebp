# toWebP

[![Version 1.0](https://img.shields.io/badge/Version-1.1.0-blue.svg)](https://github.com/your-username/towebp.sh/releases) [![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)  [![Build Passing](https://img.shields.io/badge/Build-Passing-green.svg)](https://travis-ci.org/your-username/towebp.sh)

## Overview

**toWebP** is a simple Bash script that converts images of specific types (JPEG, JPG, and PNG) to WebP format, compresses them with a default value of `90`, and deletes the original files. The script can be run locally or installed globally on Linux, macOS, and other Unix-like systems. This repository contains a folder `/images` with three images in different file formats for you to test right away.

## Quick Start

**Note:** As described, this script will remove the original image files after converting them to WebP format. Ensure you have backups before running this script.

Want to get started quickly? Here's a quick rundown for your command-line interface (CLI):

1. Clone the repository: `git clone https://github.com/averrois/towebp.sh.git`
2. Navigate into the cloned repository: `cd towebp.sh`
3. Make the script executable: `chmod +x towebp.sh`
4. Run the script: `./towebp.sh`

This will convert all JPEG, JPG, and PNG images **in the current directory** to WebP format with a default compression quality of 90.

## Installation

### Cloning the Repository with Git

To install `towebp.sh`, clone the repository using Git:

```bash
git clone https://github.com/averrois/towebp.sh.git
```
Then, navigate into the cloned repository:

```bash
cd towebp.sh
```
Make the script executable:

```bash
chmod +x towebp.sh
```
### Downloading as ZIP Archive

If you don't have Git installed, you can download a ZIP archive of the repository from GitHub:

[Download the latest release](https://github.com/your-username/towebp.sh/archive/master.zip)

1. Extract the ZIP archive and navigate into the extracted directory

### Local Installation

To run the script locally, simply make the script executable: `chmod +x towebp.sh`

### Global Installation

To install `towebp.sh` globally, move the script to a directory in your system's PATH (e.g., `/usr/local/bin`):

```bash
sudo mv towebp.sh /usr/local/bin
```

## Usage

### Basic Usage

Run the script **in the directory containing the images** you want to convert:

```bash
./towebp.sh
```

This will convert all JPEG, JPG, and PNG images in the current directory to WebP format with a default compression quality of `90`.

### Custom Compression Quality

To specify a custom compression quality, pass the quality value as an argument:

```bash
./towebp.sh 80
```

This will convert the images with a compression quality of `80`.

### Help

To display the help message, run the script with the `-h` or `--help` argument:

```bash
./towebp.sh -h
```

This will display the usage message:

```
USAGE: towebp.sh <quality>
```

## Requirements

The script requires the `cwebp` command-line tool to be installed. If it's not installed, the script will provide instructions on how to install it based on your operating system. More information is available on [develoeprs.google.com](https://developers.google.com/speed/webp/download).

## Supported Operating Systems

The script is compatible with the following operating systems:

* Linux (e.g., Ubuntu, Debian)
* macOS (via [Homebrew](https://brew.sh/))
* FreeBSD
* Windows (via MSYS or Cygwin)

## Changelog

### v1.1.0

* **Check** if the WebP compressor is installed and provides installation instructions based on the OS type
* **Allow** the user to specify a custom compression quality
* **Add** a help message with usage syntax
* **Convert** images to WebP format and remove the original files

### v1.0.0

* **Release** of the initial version of the script laid the foundation for the improvements made in v1.1.0.

## Author

* [**averrois**](https://github.com/averrois/)

## Contributors

* [**thaikolja**](https://github.com/thaikolja) <[kolja.nolte@gmail.com](mailto:kolja.nolte@gmail.com)>

## License

**toWebP** is licensed under the [MIT License](https://opensource.org/licenses/MIT).
