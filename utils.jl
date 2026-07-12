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

# Tag pages use Franklin's built-in {{taglist}} hfun, which tracks tagged pages
# site-wide (including projects/<slug>/index.md subdirectories) — do not
# override it here.

function get_page_var(path, key, default="")
    vars = Franklin.pagevar(path)
    return get(vars, Symbol(key), default)
end

# True for an individual project page (projects/<slug>/index.md), false for
# the projects index, the upcoming list, and every non-project page.
function _is_project_page()
    rpath = something(locvar(:fd_rpath), "")
    startswith(rpath, "projects/") &&
        rpath ∉ ("projects/index.md", "projects/upcoming.md")
end

# Breadcrumb shown at the top of individual project pages only. Invoked from
# _layout/head.html as {{breadcrumb}}.
function hfun_breadcrumb()
    _is_project_page() || return ""
    title = something(locvar(:title), "")
    return """
        <nav class="breadcrumb" aria-label="Breadcrumb">
          <a href="/projects/">Projects</a> / <span>$title</span>
        </nav>
    """
end

# Tag chips appended to the bottom of individual project pages only. Invoked
# from _layout/foot.html as {{project_tags}}.
function hfun_project_tags()
    _is_project_page() || return ""
    tags = locvar(:tags, default=String[])
    isempty(tags) && return ""
    io = IOBuffer()
    write(io, "<div class=\"post-tags\">Tags: ")
    for (i, tag) in enumerate(tags)
        i > 1 && write(io, " ")
        write(io, "<a href=\"/tag/$tag/\">$tag</a>")
    end
    write(io, "</div>")
    return String(take!(io))
end