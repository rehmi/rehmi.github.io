using Franklin

function hfun_project_card(params::Vector{String})
    # Expected order: url, thumb, title, date[, description]
    url = params[1]
    thumb = params[2]
    title = params[3]
    date = params[4]
    desc = length(params) > 4 ? params[5] : ""
    
    return """
        <a href="$url" class="project-card">
            <div class="image-container">
                <img src="$thumb" alt="$title">
            </div>
            <div class="card-content">
                <h3>$title</h3>
                <div class="project-date">$date</div>
                $(isempty(desc) ? "" : "<div class=\"project-description\">$desc</div>")
            </div>
        </a>
    """
end

function hfun_project_grid(params::Vector{String})
    # Parse params into groups of 4-5 items
    cards = String[]
    i = 1
    while i <= length(params)
        remaining = length(params) - i + 1
        if remaining >= 4
            # Get required params
            card_params = params[i:i+3]
            # Add description if available
            if remaining >= 5 && !startswith(params[i+4], "/")  # Check if next param isn't a URL
                push!(card_params, params[i+4])
                i += 5
            else
                i += 4
            end
            push!(cards, hfun_project_card(card_params))
        else
            @warn "Incomplete project card parameters starting at position $i"
            break
        end
    end
    
    return """
        <div class="project-grid">
            $(join(cards, "\n"))
        </div>
    """
end

# Previous utility functions...
function hfun_tableofcontents()
    out = """
        <div class="table-of-contents">
            <h2>Table of Contents</h2>
            {{toc}}
        </div>
        """
    return out
end

function hfun_taglist()
    tag = locvar(:fd_tag)

    pages = []
    for file in readdir(joinpath(Franklin.path(:site), "projects"); join=true)
        if endswith(file, ".md")
            pagevar = Franklin.pagevar(file)
            tags = get(pagevar, :tags, String[])
            if tag ∈ tags
                push!(pages, (file, pagevar))
            end
        end
    end

    sort!(pages, by=p->get(p[2], :title, basename(p[1])))
    io = IOBuffer()
    write(io, "<ul class=\"tag-posts\">")

    for (path, vars) in pages
        title = get(vars, :title, basename(path))
        url = Franklin.postpath(path)
        write(io, """
            <li><a href="$url">$title</a></li>
        """)
    end
    write(io, "</ul>")
    return String(take!(io))
end

function hfun_showtags()
    tags = locvar(:tags, default=String[])
    isempty(tags) && return ""

    io = IOBuffer()
    write(io, "<div class=\"post-tags\">Tags: ")
    for (i, tag) in enumerate(tags)
        i > 1 && write(io, ", ")
        url = "/tag/$tag/"
        write(io, "<a href=\"$url\">$tag</a>")
    end
    write(io, "</div>")
    return String(take!(io))
end

function get_page_var(path, key, default="")
    vars = Franklin.pagevar(path)
    return get(vars, Symbol(key), default)
end