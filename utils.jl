using Franklin

# Generate table of contents
function hfun_tableofcontents()
    out = """
        <div class="table-of-contents">
            <h2>Table of Contents</h2>
            {{toc}}
        </div>
        """
    return out
end

# Generate list of recent projects
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