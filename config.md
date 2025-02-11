<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Rehmi Post"
mintoclevel = 2

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/", "OLD/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Rehmi Post"
website_descr = "Research portfolio"
website_url   = "https://rehmi.github.io/"
+++

<!--
Add here global latex commands to use throughout your pages.
-->

<!-- Basic formatting commands -->
\newcommand{\note}[1]{@@note #1 @@}

<!-- Figure and media commands -->
\newcommand{\fig}[1]{~~~<figure><img src="/assets/#1" alt="#1"></figure>~~~}

\newcommand{\youtube}[1]{
~~~
<div class="youtube-container">
<iframe src="https://www.youtube.com/embed/#1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
~~~
}

\newcommand{\vimeo}[1]{
~~~
<div class="vimeo-container">
<iframe src="https://player.vimeo.com/video/#1" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
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

<!-- Project grid environment and command -->
\newenvironment{projectgrid}{
~~~
<div class="project-grid">
~~~
}{
~~~
</div>
~~~
}

\newcommand{\project}[4]{
~~~
<a href="#1" class="project-card">
  <div class="image-container">
    <img src="#2" alt="#3">
  </div>
  <div class="card-content">
    <h3>#3</h3>
    <div class="project-date">#4</div>
  </div>
</a>
~~~
}