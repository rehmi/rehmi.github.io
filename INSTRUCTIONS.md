# Project Status and Continuation Instructions - Rehmi Post Portfolio Website

## Current Status

A Franklin.jl-based portfolio website has been partially constructed with:

1. Main architecture:
   - index.md (landing page with 5 key projects)
   - projects/index.md (chronological list of all completed projects)
   - projects/upcoming.md (projects needing content work)

2. Completed Project Pages (in projects/):
   - sandcastles/
   - zeron/
   - midi-jacket/
   - taufish/
   - particle-trap-imu/
   - stretchable-cable/
   - mems-accelerometer/
   - wearable-computing/
   - sparkle/
   - j4k3t-20/

3. Projects Needing Content Work:
   - haltere-imu/
   - pengachu/
   - hello-radio/
   - utartan/
   - interactive-tablecloth/
   - intrabody-power/
   - functional-digital-materials/

## Project Structure

- All project pages are stored directly under projects/ (flat structure)
- Media files are stored in the same directory as their project's index.md
- Project card styling is consistent across all index pages
- Navigation structure links About, Projects, Publications, Contact

## Next Steps

1. Complete Incomplete Projects:
   - Check _material directories in OLD/portfolio/content/[category]/[project]/ for additional content
   - Research publications and documentation for each project
   - Consider web archives of original project pages
   - Potentially conduct brief interviews for missing historical information

2. Asset Organization:
   - Verify all thumbnails are in correct /assets/thumbnails/[category]/[project]/ locations
   - Ensure consistent image sizes and quality
   - Consider optimization for web delivery

3. Content Enhancement:
   - Add tags to all projects for better categorization
   - Consider adding "Related Projects" sections
   - Add publication links where relevant
   - Include more technical details where available

4. Style Improvements:
   - Consider adding category labels to project cards
   - Implement tag-based filtering
   - Add breadcrumb navigation
   - Consider light/dark mode support

## Project Standards

1. Project Page Template:
```markdown
+++
title = "Project Title"
project_date = "YYYY-MM-DD"
tags = ["tag1", "tag2"]
project_thumb = "/assets/thumbnails/category/project/thumb.jpg"
+++

# Project Title

![Main project image](image.jpg)

## Overview
Brief description

## Technical Details/Innovation
Core technical content

## Additional Sections
Project-specific content

## Publications/Press/Team
Credits and references
```

2. Image Standards:
   - Thumbnails: 200x200px minimum
   - Full-width images: 800px wide minimum
   - Use descriptive alt text
   - Include captions where relevant

3. Content Guidelines:
   - Technical accuracy
   - Chronological precision
   - Credit all collaborators
   - Link to related publications
   - Include press coverage where available

## Source Materials Location

Original content can be found in:
```
OLD/portfolio/content/
├── 19.Defying_Gravity/
├── 17.E-textiles/
├── 8.Sensors/
├── 6.Inertial_Sensing/
└── 5.Other/
```

Ignore directories starting with '_' except '_material' which may contain valuable content.

## Technical Setup

1. Franklin.jl is the static site generator
2. Project uses custom CSS for responsive card layouts
3. All paths are relative to site root
4. RSS feed functionality is planned but not implemented

## Additional Notes

- The site preserves academic focus while modernizing presentation
- Original content is being reorganized from a deep directory structure
- Historical accuracy and technical detail are priorities
- Project dates range from 1995-2014

To resume work:
1. Review this status document
2. Check projects/upcoming.md for incomplete projects
3. Examine _material directories for additional content
4. Follow project standards for consistency
5. Test all links and media files after changes
