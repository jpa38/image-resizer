# image-resizer

Image resizer is useful to resize image for your Mardown documentation

A simple .bat to resize images from 16 to 512 px

- Windows Only
- Work with Image Magick : https://imagemagick.org/index.php

---

## Description

Generate Thumbs from predefines pixels size : 
- 16x16
- 32x32
- 64x64
- 128x128
- 256x256
- 512x512

Output format will alway be PNG.

## Installation

1. Clone repo
```bash
cd <"the path to install it">
git clone https://github.com/jpa38/image-resizer.git
```

2. Download and Unzip Image Magick : https://imagemagick.org/script/download.php in ImageMagick's folder.

```
    ResizeImagemy-app/
    ├─ ImageMagick/
    │  ├─ <copy here imageMagick sources files>
    ├─ sources/
    │  ├─ <add here image to resize>
    │  ├─ image1.png
    ├─ resize.bat
    ├─ <old images wil be deleted and new images will be added here>
```

## Usage

1. Add images in sources's folder

2. Lauch resize.bat


## Contributing

No contributing specifications


## Versionning

No versionning specifications

## Authors
- Jérôme PALANCA

## License

This project is licensed under the **MIT License**

## TODO
- [ ] Add more image format
