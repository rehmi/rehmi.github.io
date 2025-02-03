<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Rehmi Post"
mintoclevel = 2

# Default date for projects without a specified date
project_date = "2000-01-01"

# Default date format for projects
project_date_format = "yyyy-mm-dd"


# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Rehmi Post"
website_descr = "Research portfolio"
website_url   = "https://rehmi.github.io/"

# Tag settings
tag_page_path = "tag"
tag_page_layout = "_layout/tag.html"

# Ensure consistent handling of dates
date_format = "yyyy-mm-dd"
date_format_short = "yyyy-mm-dd"

+++

<!--
Add here global latex commands to use throughout your pages.
-->
\input{tag_commands.md}

<!-- Basic formatting commands -->
\newcommand{\note}[1]{@@note #1 @@}

<!-- Figure and media commands -->
\newcommand{\fig}[1]{
~~~
<figure>
  <img src="/assets/#1" alt="#1">
</figure>
~~~
}

\newcommand{\youtube}[1]{
~~~
<div class="youtube-container">
<iframe src="https://www.youtube.com/embed/#1" 
frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; 
gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
~~~
}

\newcommand{\vimeo}[1]{
~~~
<div class="vimeo-container">
<iframe src="https://player.vimeo.com/video/#1" 
frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
</div>
~~~
}

<!-- Code and output commands -->
\newcommand{\prettyshow}[1]{@@code-output \show{#1} @@}

<!-- Layout and container commands -->
\newcommand{\style}[2]{~~~<div style="#1">~~~ #2 ~~~</div>~~~}

<!-- Two-column layout -->
\newcommand{\columns}[2]{
~~~
<div class="row">
  <div class="column">
~~~ #1 ~~~
  </div>
  <div class="column">
~~~ #2 ~~~
  </div>
</div>
~~~
}