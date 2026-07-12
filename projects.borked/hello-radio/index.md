+++
title = "Hello Radio"
project_date = "2009"
tags = ["hardware", "radio", "communication", "archive"]
+++

# Hello Radio

{{showtags}}

The Hello Radio (Fall 2009) is a \$10 wireless transceiver with impressive specifications:
* 256kbps maximum speed
* 1km maximum range
* Low-cost implementation

## Technical Details

### Hardware Design
* RF circuitry optimization
* Signal processing systems
* Antenna design
* Power efficiency measures
* Cost-effective component selection

### Implementation
* PCB layout for minimal cost
* Component optimization
* Testing methodology
* Performance verification

## Build Documentation

### Version 016

The Hello Radio 016 version was assembled and documented by Shelby Doyle. Below are all the necessary files and instructions for building this version.

\fig{assets/images/hello-radio/hello_radio_016_SED.jpg}

### Board Artwork
For PCB fabrication, two main files are provided:
- [Top layer image](assets/hello-radio/files/hello_radio_016-top.png)
- [Cutout image](assets/hello-radio/files/hello_radio_016-cutout.png)

### Build Files
The following files are required for construction:
- [Schematic (PDF)](assets/hello-radio/files/hello_radio_016-sch.pdf)
- [Board Layout (PDF)](assets/hello-radio/files/hello_radio_016-brd.pdf)
- [Assembly Diagram](assets/hello-radio/files/hello_radio_016-assembly.pdf)
- [Bill of Materials](assets/hello-radio/files/hello_radio_016-bom.txt)

### Software and Firmware
Source files and bootloader:
- [Makefile](assets/hello-radio/files/makefile)
- [Hello Radio Hex](assets/hello-radio/files/hello_radio.hex)
- [Hello Radio Source](assets/hello-radio/files/hello_radio.c)
- [HAL Header](assets/hello-radio/files/hal_hello_radio-016.h)
- [ATmega Bootloader](assets/hello-radio/files/ATmegaBOOT_168_pro_8MHz.hex)

### Design Files
Eagle CAD files:
- [Schematic](assets/hello-radio/files/hello_radio_016.sch)
- [Board](assets/hello-radio/files/hello_radio_016.brd)
- [Library](assets/hello-radio/files/hello_radio_016.lbr)

### Fabrication Instructions

For milling the top traces:
- Use a 1/64" end mill
- Set diameter to 0.38 mm
- Command:
```bash
png_path hello_radio_016-top.png hello-radio_016-top.path 1 0.38 4 0.5 0.5
```

\fig{assets/images/hello-radio/hello_radio_016-top.png}

For via holes and board cutout:
- Use a 1/32" end mill
- Set diameter to 0.79 mm
- Command:
```bash
png_path hello_radio_016-top.png hello-radio_016-top.path 1 0.79 4 0.5 0.5
```

\fig{assets/images/hello-radio/hello_radio_016-cutout.png}

## Performance Specifications

* Data Rate: Up to 256kbps
* Range: Up to 1km
* Cost: \$10 per unit
* Operation: Full transceiver capabilities

## Applications

* Low-cost communication systems
* Educational platforms
* Experimental radio projects
* Wireless networking
* Remote sensing
* Data collection

## Credits

Project developed by Brian Mayton, David Cranor, and Rehmi Post.

## Documentation

* Circuit designs
* Build instructions
* Testing procedures
* Performance data
* Component list