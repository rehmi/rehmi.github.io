# Custom tag commands

\newcommand{\taglist}{
~~~
<div class="tag-content">
{{for p in pages_with_tag}}
  <div class="tag-entry">
    <h2><a href="{{fill p.url}}">{{fill p.title}}</a></h2>
    <p>{{fill p.description}}</p>
    <div class="tag-meta">
      Tags: {{for t in p.tags}}<a href="/tag/{{fill t}}/">#{{fill t}}</a> {{end}}
    </div>
  </div>
{{end}}
</div>
~~~
}