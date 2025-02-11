# Franklin utility functions

# Recent projects list
function hfun_recent_projects()
    # This function will generate HTML for recent projects
    projects = [
        ("TauFish", "/projects/sensors/taufish/"),
        ("MIDI Jacket", "/projects/wearables/midi-jacket/"),
        ("Particle Trap IMU", "/projects/inertial-sensing/particle-trap-imu/"),
        ("ZeroN", "/projects/defying-gravity/zeron/")
    ]
    
    io = IOBuffer()
    write(io, "<div class=\"project-grid\">")
    for (name, url) in projects
        write(io, """
            <div class="project-card">
                <h3><a href="$url">$name</a></h3>
            </div>
        """)
    end
    write(io, "</div>")
    return String(take!(io))
end

# Navigation menu generator
function hfun_nav_menu()
    io = IOBuffer()
    write(io, "<nav class=\"main-nav\">")
    for (section, items) in get_page_vars("sections")
        if items isa Dict
            write(io, """
                <div class="dropdown">
                    <button class="dropbtn">$section</button>
                    <div class="dropdown-content">
                """)
            for (name, url) in items
                write(io, "<a href=\"$url\">$name</a>")
            end
            write(io, "</div></div>")
        else
            write(io, "<a href=\"$items\">$section</a>")
        end
    end
    write(io, "</nav>")
    return String(take!(io))
end