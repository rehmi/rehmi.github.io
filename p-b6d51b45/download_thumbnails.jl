using Downloads

# Define the base URL for the Wayback Machine
base_url = "https://web.archive.org/web/20240529013351im_/http://www.rehmi.info/content"

# Define the thumbnail mappings [source_path => destination_path]
thumbnails = Dict(
    # Defying Gravity
    "19.Defying_Gravity/3.ZeroN/thumb.jpg" => "_assets/thumbnails/defying-gravity/zeron-thumb.jpg",
    
    # Wearables and Textiles
    "17.E-textiles/11.Wearable_Computing/thumb.jpg" => "_assets/thumbnails/wearables/wearable-computing-thumb.jpg",
    "17.E-textiles/10.MIDI_Jacket/thumb.jpg" => "_assets/thumbnails/wearables/midi-jacket-thumb.jpg",
    "17.E-textiles/8.j4k3t_20/thumb.jpg" => "_assets/thumbnails/wearables/j4k3t-20-thumb.jpg",
    "17.E-textiles/7.Sp4rkl3/thumb.jpg" => "_assets/thumbnails/wearables/sp4rkl3-thumb.jpg",
    "17.E-textiles/6.Interactive_Tablecloth/thumb.jpg" => "_assets/thumbnails/wearables/interactive-tablecloth-thumb.jpg",
    "17.E-textiles/4.uTartan/thumb.jpg" => "_assets/thumbnails/wearables/utartan-thumb.jpg",
    "17.E-textiles/3.Stretchable_cable/thumb.jpg" => "_assets/thumbnails/wearables/stretchable-cable-thumb.jpg",
    
    # Sensors
    "8.Sensors/9.tauFish/thumb.jpg" => "_assets/thumbnails/sensors/taufish-thumb.jpg",
    
    # Inertial Sensing
    "6.Inertial_Sensing/9.Particle_Trap_IMU/thumb.jpg" => "_assets/thumbnails/inertial-sensing/particle-trap-imu-thumb.jpg",
    "6.Inertial_Sensing/7.Haltere_IMU/thumb.gif" => "_assets/thumbnails/inertial-sensing/haltere-imu-thumb.gif",
    "6.Inertial_Sensing/6.MEMS_Accelerometer/thumb.jpg" => "_assets/thumbnails/inertial-sensing/mems-accelerometer-thumb.jpg",
    
    # Other
    "5.Other/6.Functional_Digital_Materials/thumb.jpg" => "_assets/thumbnails/other/functional-digital-materials-thumb.jpg",
    "5.Other/5.Sandcastles/thumb.jpg" => "_assets/thumbnails/other/sandcastles-thumb.jpg",
    "5.Other/4.Pengachu/thumb.jpg" => "_assets/thumbnails/other/pengachu-thumb.jpg",
    "5.Other/3.Hello_Radio/thumb.jpg" => "_assets/thumbnails/other/hello-radio-thumb.jpg",
    "5.Other/2.Intrabody_Power/thumb.jpg" => "_assets/thumbnails/other/intrabody-power-thumb.jpg"
)

# Download each thumbnail
for (source, dest) in thumbnails
    url = "$base_url/$source"
    try
        println("Downloading $url to $dest...")
        Downloads.download(url, dest)
        println("✓ Successfully downloaded $dest")
    catch e
        println("✗ Failed to download $dest: $e")
    end
end