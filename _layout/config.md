<!--
Add here global page variables to use throughout your website.
-->
+++
author = "E. Rehmi Post"
mintoclevel = 2
title = "Rehmi Post's Portfolio" # Default title for pages that don't specify one

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Rehmi Post's Portfolio"
website_descr = "Academic portfolio of E. Rehmi Post"
website_url   = "https://rehmi.github.io/"
+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\style}[1]{~~~<style>#1</style>~~~}

\newcommand{\hero}[1]{~~~<div class="hero-section">#1</div>~~~}

\newcommand{\grid}[1]{~~~<div class="project-grid">#1</div>~~~}

\newcommand{\feature}[1]{~~~<div class="feature-section">#1</div>~~~}