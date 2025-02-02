# Common commands 

\newcommand{\prettyshow}[1]{@@code-output \show{#1} @@}

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