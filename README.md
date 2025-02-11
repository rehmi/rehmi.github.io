# Rehmi Post's Academic Portfolio

This repository contains my academic portfolio website, built using [Franklin.jl](https://franklinjl.org/). The site showcases research projects, publications, and academic work.

## Site Structure

```
.
├── _assets/
│   └── thumbnails/          # Project thumbnail images
├── _css/
│   ├── adjust.css          # Franklin.jl style overrides
│   ├── custom.css          # Custom styling for projects, cards, etc.
│   ├── franklin.css        # Franklin.jl base styles
│   └── minimal-mistakes.css # Theme base styles
├── _layout/
│   ├── config.md           # Global variables and commands
│   ├── head.html           # HTML head section
│   ├── foot.html           # Page footer
│   └── masthead.html       # Navigation header
├── projects/
│   ├── defying-gravity/    # ZeroN and levitation projects
│   ├── inertial-sensing/   # IMU and motion sensing projects
│   ├── sensors/            # General sensor projects
│   └── wearables-and-textiles/ # E-textiles and wearable projects
└── utils.jl                # Custom Franklin functions
```

## Main Features

- Grid-based project showcase on homepage
- Organized research areas:
  - Inertial Sensing
  - Sensors
  - Wearables & E-textiles
  - Defying Gravity
- Responsive design with custom project cards
- Detailed project pages with technical content

## Development Progress

### Completed
- [x] Basic Franklin.jl setup
- [x] Main navigation structure
- [x] Homepage with featured projects grid
- [x] Project card layout and styling
- [x] MIDI Jacket project page template
- [x] Custom CSS for responsive design
- [x] Global commands for media embeds

### To Do
- [ ] Add remaining project pages
- [ ] Create publications section
- [ ] Add project images and thumbnails
- [ ] Implement tag-based navigation
- [ ] Add interactive demos section
- [ ] Complete About and Contact pages

## Content Organization

The site content is being migrated from the original content/ directory structure, maintaining the organizational hierarchy while modernizing the presentation.

### Project Page Template

Each project page follows this structure:
```markdown
+++
title = "Project Title"
tags = ["category1", "category2"]
project_date = "YYYY-MM-DD"
hasmath = true/false
+++

# Project Title

## Overview
Brief project description

## Technical Details
Technical content, diagrams, equations

## Results & Impact
Outcomes and applications

## Publications
Related papers and presentations

## Related Work
Links to related projects
```

## Usage

To run the site locally:
1. Install Julia and Franklin.jl
2. Clone this repository
3. Run `julia -e 'using Franklin; serve()'`
4. Visit http://localhost:8000/

## Note About Content

The original content is being reorganized from a deep directory structure containing various project materials, documentation, and assets. The new structure maintains the academic focus while improving accessibility and presentation.