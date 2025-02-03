using Franklin

function hfun_tableofcontents()
    out = """
        <div class="table-of-contents">
            <h2>Table of Contents</h2>
            {{toc}}
        </div>
        """
    return out
end

function hfun_recent_projects()
    projects = [
        ("TauFish", "/projects/sensors/taufish/", "Novel approaches to orientation sensing"),
        ("MIDI Jacket", "/projects/wearables-and-textiles/midi-jacket/", "Wearable musical interface"),
        ("Particle Trap IMU", "/projects/inertial-sensing/particle-trap-imu/", "Innovative inertial measurement"),
        ("ZeroN", "/projects/defying-gravity/zeron/", "Levitated interaction elements")
    ]

    io = IOBuffer()
    write(io, "<div class=\"project-grid\">")
    for (name, url, desc) in projects
        write(io, """
            <div class="project-card">
                <h3><a href="$url">$name</a></h3>
                <p>$desc</p>
            </div>
            """)
    end
    write(io, "</div>")
    return String(take!(io))
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