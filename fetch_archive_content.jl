using Downloads
using Dates

# Base URL for the Wayback Machine capture
base_url = "https://web.archive.org/web/20240529013351/http://www.rehmi.info"

# Project structure with URLs and destination paths
projects = [
    # Defying Gravity
    ("/?/Defying_Gravity/ZeroN/", "projects/defying-gravity/zeron.md", "2011"),
    
    # Wearables and Textiles
    ("/?/E-textiles/Wearable_Computing/", "projects/wearables-and-textiles/wearable-computing.md", "2000"),
    ("/?/E-textiles/MIDI_Jacket/", "projects/wearables-and-textiles/midi-jacket.md", "1997"),
    ("/?/E-textiles/j4k3t_20/", "projects/wearables-and-textiles/j4k3t-20.md", "2006"),
    ("/?/E-textiles/Sp4rkl3/", "projects/wearables-and-textiles/sp4rkl3.md", "2008"),
    ("/?/E-textiles/Interactive_Tablecloth/", "projects/wearables-and-textiles/interactive-tablecloth.md", "2009"),
    ("/?/E-textiles/uTartan/", "projects/wearables-and-textiles/utartan.md", "2009"),
    ("/?/E-textiles/Stretchable_cable/", "projects/wearables-and-textiles/stretchable-cable.md", "2005"),
    
    # Sensors
    ("/?/Sensors/tauFish/", "projects/sensors/taufish.md", "1999"),
    
    # Inertial Sensing
    ("/?/Inertial_Sensing/Particle_Trap_IMU/", "projects/inertial-sensing/particle-trap-imu.md", "2003"),
    ("/?/Inertial_Sensing/Haltere_IMU/", "projects/inertial-sensing/haltere-imu.md", "2010"),
    ("/?/Inertial_Sensing/MEMS_Accelerometer/", "projects/inertial-sensing/mems-accelerometer.md", "1999"),
    
    # Other
    ("/?/Other/Functional_Digital_Materials/", "projects/other/functional-digital-materials.md", "2009"),
    ("/?/Other/Sandcastles/", "projects/other/sandcastles.md", "2012"),
    ("/?/Other/Pengachu/", "projects/other/pengachu.md", "2001"),
    ("/?/Other/Hello_Radio/", "projects/other/hello-radio.md", "2009"),
    ("/?/Other/Intrabody_Power/", "projects/other/intrabody-power.md", "1996")
]

# Function to convert HTML content to Franklin markdown
function convert_to_franklin(html, title, date)
    # Basic frontmatter
    frontmatter = """
    +++
    title = "$title"
    project_date = "$date"
    tags = ["archive"]
    +++

    # $title

    \\toc

    """
    
    # TODO: Add content conversion logic here
    
    return frontmatter * html
end

# Fetch and convert each project
for (url, dest_path, date) in projects
    full_url = base_url * url
    try
        println("Fetching $full_url...")
        
        # Get page content
        content = String(Downloads.download(full_url))
        
        # Extract title from URL
        title = replace(basename(dest_path), ".md" => "")
        title = replace(title, "-" => " ")
        title = titlecase(title)
        
        # Convert content to Franklin format
        franklin_content = convert_to_franklin(content, title, date)
        
        # Create directories if needed
        mkpath(dirname(dest_path))
        
        # Save the file
        write(dest_path, franklin_content)
        println("✓ Successfully created $dest_path")
        
    catch e
        println("✗ Failed to process $url: $e")
    end
end