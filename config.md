<!--
Add here global page variables to use throughout your website.
-->
+++
using DelimitedFiles

author = "Rehmi Post"
mintoclevel = 2

# uncomment and adjust the following line if the expected base URL of your website is something like [www.thebase.com/yourproject/]
# please do read the docs on deployment to avoid common issues: https://franklinjl.org/workflow/deploy/#deploying_your_website
# prepath = "yourproject"

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = [
	"node_modules/",
	"misc/",
	"inactive/",
	"menu1.md",
	"inactive/menu1.md",
	"demos/"
]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Franklin Template"
website_descr = "Example website using Franklin"
website_url   = "https://tlienart.github.io/FranklinTemplates.jl/"

mintoclevel = 2
maxtoclevel = 3
mathjax = false
weave = false
generate_sitemap = true

isAppleARM = Sys.isapple() && Sys.ARCH === :aarch64

# supports question 001
members_from_csv = eachrow(readdlm("_assets/members.csv", ',', skipstart=1))
+++

@def ignore = [
	"node_modules/",
	"misc/",
	"inactive/",
	"menu1.md",
	"inactive/menu1.md",
	"demos/"
	]

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}

<!-- supports question 003 -->
\newcommand{\prettyshow}[1]{@@code-output \show{#1} @@}
