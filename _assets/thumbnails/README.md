# Project Thumbnails Directory

This directory contains thumbnail images for all projects, organized by category:

- defying-gravity/
- wearables-and-textiles/
- sensors/
- inertial-sensing/
- other/

## Image Migration Strategy

1. Images from the original website are being migrated from:
   `/web/20240529013351im_/http://www.rehmi.info/content/[category]/[project]/thumb.jpg`

2. New structure organizes images as:
   `/_assets/thumbnails/[category]/[project]/thumb.jpg`

3. Project pages reference images using the Franklin.jl path structure:
   `/assets/thumbnails/[category]/[project]/thumb.jpg`

## Original Categories Mapping

- 19.Defying_Gravity -> defying-gravity
- 17.E-textiles -> wearables-and-textiles
- 8.Sensors -> sensors
- 6.Inertial_Sensing -> inertial-sensing
- 5.Other -> other