# Define the projectgrid environment
function lx_projectgrid(com, _)
    # Get the content between \begin{projectgrid} and \end{projectgrid}
    content = Franklin.content(com.braces[1])
    return """
    <div class="project-grid">
        $content
    </div>
    """
end

# Define the project helper function
function hfun_project(params)
    path = params[1]
    image = params[2]
    title = params[3]
    date = params[4]
    
    return """
    <div class="project-item">
        <a href="$path">
            <img src="$image" alt="$title">
            <div class="project-title">$title</div>
            <div class="project-date">$date</div>
        </a>
    </div>
    """
end