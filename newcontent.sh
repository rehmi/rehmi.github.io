#!/bin/sh
# This is a shell archive for a Franklin.jl-based website.
# To unpack, save it in a file, remove anything before
# this line, and then unpack it by entering "sh file".

# Create main directory structure
mkdir -p rehmi.github.io/{_css,_layout,_libs,about,contact-me,publications,assets/{pdf,images}}
mkdir -p rehmi.github.io/projects/{inertial-sensing,wearables-and-textiles,sensors,other,defying-gravity}

# Create config.md
cat > rehmi.github.io/config.md << EOL
@def website_title = "Rehmi Post's Portfolio"
@def website_descr = "A collection of Rehmi Post's work in various fields including sensors, wearable technology, and more."
@def website_url   = "https://rehmi.github.io/"

@def author = "Rehmi Post"

@def mintoclevel = 2

@def ignore = ["node_modules/", "franklin", "franklin.pub"]

\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
EOL

# Create index.md
cat > rehmi.github.io/index.md << EOL
@def title = "Home"
@def tags = ["home"]

# Welcome to Rehmi Post's Portfolio

This is a collection of Rehmi Post's work in various fields including sensors, wearable technology, and more.

\tableofcontents
EOL

# Create about/index.md
cat > rehmi.github.io/about/index.md << EOL
@def title = "About"
@def tags = ["about"]

# About Rehmi Post

\toc

[CV](/assets/pdf/ERP-CV-20141125.pdf), 
[Google Scholar profile](http://scholar.google.com/citations?user=b_pBos8AAAAJ&hl=en), 
[Research Gate profile](http://www.researchgate.net/profile/Ernest_Post)

Rehmi Post is Lead Scientist at
[Samsung's Think Tank Team](http://thinktankteam.info), leading the ideation and development of future technologies and products.
Before joining Samsung in 2012, he was a Visiting Scientist at the MIT Center for Bits and Atoms in the Physics and Media group directed by Neil Gershenfeld, where he also earned his PhD for the development of an integrated 6-degree-of-freedom inertial measurement unit (IMU) based on trapped micro particles.  At his PhD defense, Prof. Gershenfeld gave the following introduction:

"Rehmi was one of the best examples of the students I like most who are least manageable.
In his time here he did more things than I can count, any one of which could be a thesis.
In each of those, he never backed away from doing the hard things.
I think what's most impressive is that he took perhaps the hardest, most ambitious thing that was least ready, and instead of taking the easy way out and packaging up one of the other things he'd done, he leapt into this as the endgame, and I think it came out beautifully."

His academic career started as a Kelly Scholar at the University of Maryland, where he helped implement a large multicomputer architecture under the direction of Charles Rieger and Mark Weiser.

In a subsequent tour of the computer software industry he developed compilers and interpreters for distributed computing environments and contributed to the first commercial TCP/IP protocol suite for MS-DOS.

His love of physics led him to return to school at the University of Massachusetts where he studied condensed-matter systems and worked at the Tuominen Nanostructures Lab developing superconducting "single-electron" or Coulomb blockade devices while obtaining the B.Sc. in Physics with honors.

As an Interval Fellow at the Media Lab, he earned an M.Sc. for the development of e-broidery, a means of fabricating electronic circuitry on wash-and-wear textile substrates. Examples of his pioneering work in this field have appeared widely in museum collections, including a permanent loan to the Wellcome Wing of London's Museum of Science.

As a Motorola Fellow at the Media Lab and the Center for Bits and Atoms, he earned a Ph.D. for the development of a novel inertial sensor based on the dynamics of levitated particles. While working on his dissertation, he also co-founded ThingMagic, a leader in the field of RFID.

Rehmi's research focuses on wearables and textiles, dynamics of micro- and mesoscale systems, and microelectromechanical systems (MEMS). In spare time he and Matt Reynolds developed the Pengachu pocket Linux server to help bring affordable open-source/open-hardware computing and wired/wireless networking infrastructure to users and communities around the world, and which eventually led to the development of the OLPC.
EOL

# Create contact-me/index.md
cat > rehmi.github.io/contact-me/index.md << EOL
@def title = "Contact Me"
@def tags = ["contact"]

# Contact Details

- Email: rehmi.post {at} cba.mit.edu
- Phone: +1 / 773 / 257 / 3464 (SPEAK-REHMI)
- Skype: rehmi {dot} post
EOL

# Create publications/index.md
cat > rehmi.github.io/publications/index.md << EOL
@def title = "Publications"
@def tags = ["publications"]

# Publications

\toc

## Refereed Publications

1. [ZeroN: mid-air tangible interaction enabled by computer controlled magnetic levitation](/assets/pdf/ZeroNUIST2011.pdf), 
   UIST '11 Proceedings of the 24th annual ACM symposium on User interface software and technology,
   pp. 327-336, ACM New York, NY, USA, ISBN: 978-1-4503-0716-1
   [doi:10.1145/2047196.2047239](http://dx.doi.org/10.1145/2047196.2047239)

2. [Electrostatic Power Harvesting for Material Computing](/assets/pdf/sp4rkl3-PUC-11.pdf),
   E. R. Post, K. Waal,
   Personal and Ubiquitous Computing, v. 15 no. 2 pp. 115-121 (2011),
   [doi:10.1007/s00779-010-0313-9](http://dx.doi.org/10.1007/s00779-010-0313-9)
   **[Invited Paper]**

3. [Inertial Measurement with Trapped Particles: A Microdynamical System](/assets/pdf/APL143501.pdf),
   E. R. Post, G. A. Popescu, N. Gershenfeld,
   Applied Physics Letters v. 96, no. 14, pp. 3501-3503 (2010),
   [doi:10.1063/1.3360808](http://dx.doi.org/10.1063/1.3360808)

4. [Origami Desk: integrating technological innovation and human-centric design](/assets/pdf/DIS02p399-ju.pdf),
   W. Ju, L. Bonanni, R. Fletcher, R. Hurwitz, T. Judd, R. Post, M. Reynolds, and J. Yoon. 2002.
   In Proceedings of the 4th conference on Designing interactive systems:
   processes, practices, methods, and techniques (DIS '02).
   ACM, New York, NY, USA, 399-405. [doi:10.1145/778712.778770](http://dx.doi.org/10.1145/778712.778770)

5. [An Installation of Interactive Furniture](/assets/pdf/omojola-isj393-part3.pdf),
   O. Omojola, E. R. Post, M. D. Hancher, J. P. Strachan, P. Russo, N. Gershenfeld,
   IBM Systems Journal, v. 39 pp. 861-879 (2000), [doi:10.1147/sj.393.0861](http://dx.doi.org/10.1147/sj.393.0861)

6. [E-broidery: Design and Fabrication of Textile-based Computing](/assets/pdf/post-isj393-part3.pdf),
   E. R. Post, M. Orth, P. Russo, N. Gershenfeld,
   IBM Systems Journal, v. 39 pp.840-860 (2000),
   [doi:10.1147/sj.393.0840](http://dx.doi.org/10.1147/sj.393.0840)

7. [High-resolution Micromachined Interferometric Accelerometer](/assets/pdf/APL03316.pdf),
   E. B. Cooper, E. R. Post, S. Griffith, J. Levitan, C. F. Quate, S. R. Manalis,
   Applied Physics Letters v. 76 no. 22 pp. 3316-3318 (2000),
   [doi:10.1063/1.126637](http://dx.doi.org/10.1063/1.126637)

8. [Fabric Computing Interfaces](/assets/pdf/chifabric.pdf),
   M. Orth, E. R. Post, E. B. Cooper,
   Proceedings of Conference on Human Factors in Computing Systems, (CHI '98),
   Los Angeles, ACM Press, (1998),
   [doi:10.1145/286498.286800](http://dx.doi.org/10.1145/286498.286800)

9. **Musical jacket**,
   M. Orth, J. R. Smith, E. R. Post, J. A. Strickon, and E. B. Cooper. 1998.
   In ACM SIGGRAPH 98 Electronic art and animation catalog (SIGGRAPH '98).
   ACM, New York, NY, USA.
   [doi:10.1145/281388.281456](http://dx.doi.org/10.1145/281388.281456)

10. [Intrabody Buses for Data and Power](/assets/pdf/00629919.pdf),
    E. R. Post, M. S. Reynolds, M. K.
    Gray, J. Paradiso, N. Gershenfeld; First Intl. Symp. on Wearable Computers,
    13-14 Oct 1997 pp. 52-55
    [doi:10.1109/ISWC.1997.629919](http://dx.doi.org/10.1109/ISWC.1997.629919)

11. [Smart Fabric, or  Wearable Clothing](/assets/pdf/00629937.pdf),
    E. R. Post, M. Orth, 
    First Intl. Symp. on Wearable Computers, 13-14 Oct 1997 pp. 167-168
    [doi:10.1109/ISWC.1997.629937](http://dx.doi.org/10.1109/ISWC.1997.629937)
    **[web page](http://web.media.mit.edu/~rehmi/fabric)**

12. [Thinternet: Life at the End of a Tether](/assets/pdf/isoc222.pdf),
    H. Shrikumar, E. R. Post,
    Computer Networks and ISDN Systems 27(3), 375-85 (1994)
    [doi:10.1016/0169-7552(94)90111-2](http://dx.doi.org/10.1016/0169-7552(94)90111-2)

13. [Status and Performance of the Zmob Parallel Processing System](http://scholar.google.com/scholar?cites=4144341431161335259&as_sdt=2005&sciodt=0,5&hl=en),
    M. Weiser, S. Kogge, M. McElvany, R. Pierson, R. Post, A. Thareja,
    IEEE CompCon conference, San Francisco, CA, February 1985

## Patents

1. [US8590377    Inertial Measurement Unit](http://www.google.com/patents/US8590377)

2. [US8519677    Electrostatic power harvesting for material computing](http://www.google.com/patents/US8519677)

3. [US8330580    Methods and apparatus for operating a radio device](http://www.google.com/patents/US8330580)

4. [US7999658    Methods and apparatus for operating a radio device](http://www.google.com/patents/US7999658)

5. [US7961078    Methods and apparatus for operating a radio device](http://www.google.com/patents/US7961078)

6. [US7755765    Method and apparatus for inertial sensing via measurement of trapped orbit dynamics](http://www.google.com/patents/US7755765)

7. [US7075412    Methods and apparatus for operating a radio device](http://www.google.com/patents/US7075412)

8. [US6891382    Three-dimensional characterization using a one-dimensional electrode array](http://www.google.com/patents/US6891382)

9. [US6493933    Method of making flexible electronic circuitry](http://www.google.com/patents/US6493933)

10. [US6211799    Method and apparatus for transbody transmission of power and information](http://www.google.com/patents/US6211799)

11. [US6210771    Electrically active textiles and articles made therefrom](http://www.google.com/patents/US6210771)

## Patents Pending

1. [US20150049056    Interaction Sensing](http://www.google.com/patents/US20150049056)

2. [US20150049055    Interaction Sensing](http://www.google.com/patents/US20150049055)

3. [US20150049034    Interaction Sensing](http://www.google.com/patents/US20150049034)

4. [US20150048846    Interaction Sensing](http://www.google.com/patents/US20150048846)

5. [WO2014031793A3    Electromagnetic digital materials](http://www.google.com/patents/WO2014031793A3)

## Technical Reports and Conference Papers

1. [Electrostatic Power Harvesting in Textiles](/assets/pdf/ElectrostaticPowerHarvesting.pdf),
   E. R. Post, K. Waal,
   Proc. ESA Annual Meeting on Electrostatics 2010, Paper G1

2. **Detection of Forelimb Lameness in Horses Using Inertial Sensor Data**,
   K. Waal, E. R. Post, Asteism, Inc. Technical Report ATR-01, July 2009, pp. 1-10

3. [Multi-band, Low Cost EPC Tag Reader](/assets/pdf/MIT-AUTOID-WH-012.pdf),
   M. Reynolds, J. Richards, S. Pathare, H. Tsai, Y. Maguire, E. Post, R. Pappu, and B. Schoner,
   MIT Auto-ID Center Technical Report MIT-AUTOID-WH-012, 2002, pp. 1-24.

4. [Scalable Interactive Surfaces Using Charge Source Tomography](/assets/pdf/rfish-dyd02.pdf),
   E. R. Post, U. Pawar, A. Agarwal, N. Gershenfeld,
   2nd Intl. Conference on Open Collaborative Design of Sustainable Innovation.
   December 1-2, 2002, Bangalore, India. (2002)

## Theses

1. **Inertial Measurement via Dynamics of Trapped Particles**,
   PhD Dissertation, MIT, August 2003

2. **E-broidery: An Infrastructure for Washable Computing**,
   MSc Thesis, MIT, February 1999

EOL

# Create project index files
for category in inertial-sensing wearables-and-textiles sensors other defying-gravity; do
    cat > rehmi.github.io/projects/$category/index.md << EOL
@def title = "${category^} Projects"
@def tags = ["projects", "$category"]

# ${category^} Projects

\tableofcontents

{{ projectlist }}
EOL
done

# Create individual project files
cat > rehmi.github.io/projects/inertial-sensing/particle-trap-imu.md << EOL
@def title = "Particle Trap IMU"
@def tags = ["projects", "inertial-sensing", "imu"]
@def project_date = "2003"

# Particle Trap IMU

Project Date: 2003

Miniature motion sensors are everywhere these days, detecting the orientation of cell phones, deploying air bags in cars and measuring stresses in buildings and mechanical systems. But manufacturing the sensors' tiny moving parts requires the same high-tech, billion-dollar facilities that churn out computer chips.

To address this need, for my PhD I developed a sensor consisting of a tiny metal bead suspended in a hole drilled in a circuit board.
A fluctuating electric field holds the bead aloft in a tight orbit, and disturbances of the orbit indicate the sensor's direction of motion and rotation.
This sensor opens the door to a new class of miniaturized devices that exploit the dynamics of simple physical systems instead of the mechanical interactions of precisely micromachined parts.
Such "microdynamical" devices could enable cheaper, simpler, more responsive sensors for a range of applications, including the measurement of sound, pressure, fluid-flow and magnetic fields.

This device can do the work of at least six different micromechanical sensors. It can measure acceleration in three dimensions, which would ordinarily require three accelerometers.
But it can also gauge orientation, which would usually require an additional three gyroscopes.

"If [we] can get all six degrees out of it, it would be huge," says Michael Judy, a researcher at Analog Devices, the company that built the Wii's accelerometers. "That's the holy grail right now in the human interface to electronics." Judy says that the application of motion sensing that has sparked the most interest is navigation in environments where GPS information is either unreliable or too imprecise. For instance, local spatial tracking would let hospital workers immediately determine each other's locations, even on different floors of a large building.

At the sensor's heart is a particle trap, a device commonly used in experimental physics.
Physically, the trap is very simple: two metal plates on either side of a circuit board, with a hole about the diameter of an electrical wire drilled through them.
But a computer circuit hooked up to the plates exerts precise control over the electric field they produce.

The electric field can be thought of as saddle-shaped: front to back, it curves upward at the ends, but side to side, it curves downward.
The field fluctuates as if it were rotating, and a particle at its center is like a marble on a warped turntable. The marble starts to roll down one of the downward slopes, but the turntable revolves, and the marble finds itself rolling up an uphill slope instead.
When it falls back down the slope, it repeats the whole process on the opposite side of the turntable, and so on.

A particle in the trap is thus not perfectly still but rapidly oscillating as, in effect, it rolls back and forth between upward slopes. Each of the six types of motion detected by a complete set of accelerometers and gyros disturbs the particle in a distinctive way.
EOL

cat > rehmi.github.io/projects/wearables-and-textiles/midi-jacket.md << EOL
@def title = "MIDI Jacket"
@def tags = ["projects", "wearables-and-textiles", "midi"]
@def project_date = "1997"

# MIDI Jacket

Project Date: 1997

Computing will only be truly "wearable" when it finally disappears into the fabric of everyday life.

It is perhaps safe to say that the majority of society will always wear clothing.  Textiles are one of the earliest technologies, serving many functions: affording protection from the environment, defining the wearer's identity, and providing places to carry objects.  

But the electronic gear that makes this information revolution possible still takes an awkward form. It's not truly wearable except in the sense that it will fit in your pocket or strap onto your body. The goal of this work is to integrate technology directly into clothing by replacing circuit boards with fabric circuitry and packaging components for assembly into fabric circuits.
EOL

cat > rehmi.github.io/projects/sensors/taufish.md << EOL
@def title = "Multitouch Table at MoMA"
@def tags = ["projects", "sensors", "multitouch"]
@def project_date = "1999"

# Multitouch Table at MoMA

Project Date: 1999

[Un-Private House at MoMA](http://www.moma.org/interactives/exhibitions/1999/un-privatehouse/credits.html)
 
Exhibit developed in cooperation with MoMA New York and shown at the exhibition "un-privatehouse" at MoMA in 1999. For an interactive multitouchcable, I developed a sensing array under the table surface that locates the exact x and y position of each users hands on and above the table. The rate that electrical charge on each of the electrodes in the array is measured. As a hand approaches the table, more charge is required, slowing down this rate. A model that predicts the amounts of charges as a function of the hand location is used to recognize when the hand enters a "hotspot". 
EOL

cat > rehmi.github.io/projects/other/hello-radio.md << EOL
@def title = "Hello Radio"
@def tags = ["projects", "other", "radio"]
@def project_date = "Fall 2009"

# Hello Radio

Project Date: Fall 2009

The Hello Radio is a $10 wireless transceiver with a 256kbps maximum speed and 1km maximum range.
EOL

cat > rehmi.github.io/projects/defying-gravity/zeron.md << EOL
@def title = "ZeroN levitated interaction element"
@def tags = ["projects", "defying-gravity", "interaction"]
@def project_date = "2011"

# ZeroN levitated interaction element

Project Date: 2011

The dream of liberating physical matter from gravity has existed for millennia. It is an idea found in mythology, sought after by alchemists, and visualized in science fiction. In this work, we have created a space that gives a glimpse into the possibilities of such a future where materials are free from gravitational constraints by blending the physical and digital worlds.

ZeroN is a new tangible interaction element that can be levitated and moved freely by computer in three dimensions. Both the computer and the user can move ZeroN simultaneously, allowing humans and computers to physically interact with one another in space. Users are invited to place or move the ZeroN just as they can place any other objects on surfaces.

Once levitated, ZeroN's behavior can be digitally programmed. For example, users can place the sun above physical objects to cast digital shadows, or place a planet that will start revolving based on simulated physical conditions. 

ZeroN can also record the user's motion, allowing it to be preserved and played back indefinitely. When a user moves and releases ZeroN, it continues to float and starts to move along the same path, creating a unique, tangible record of the user's physical presence and motion.

To realize this vision, we developed a magnetic control system that can levitate and actuate a permanent magnet in a pre-defined 3D volume. This is combined with an optical tracking and display system that projects images on the levitating object. Conventional levitation only enables levitating an object at one point. In the ZeroN Project, users can move a levitated object to anywhere in a predefined 3D space and leave it there without dropping it because the system constantly readjusts both magnetically and mechanically.

## Press

- [WIRED UK Magazine: Interface floating in space](/assets/images/zeron_wired_article.png)
- [FastCodesign: MIT Creates Amazing UI From Levitating Orbs](http://www.fastcodesign.com/1669799/mit-creates-amazing-ui-from-levitating-orbs)
- [ACM TechNews](http://technews.acm.org/archives.cfm?fo=2012-05-may/may-21-2012.html#583993)
- [GIZMODO: Magnetically Levitating Balls Could Be the Future of Computer Interfaces](http://gizmodo.com/5908935/magically-levitating-balls-could-be-the-future-of-computer-interfaces)
- [Engadget: ZeroN slips surly bonds, re-runs your 3D gestures in mid-air](http://www.engadget.com/2012/05/14/zeron-levitation-mit-media-labs/)
- [MIT Video : ZeroN](http://video.mit.edu/watch/zeron-11291/)
- [MIT Media Lab Labcast: ZeroN](http://labcast.media.mit.edu/?p=235)
- [WIRED.COM](http://www.wired.com/beyond_the_beyond/2012/05/showtime-zeron-from-mit-media-lab/)
- [Designboom: MIT media lab: zeroN](http://www.designboom.com/weblog/cat/16/view/21046/mit-media-lab-zeron.html)
- [Blaze: your eyes aren't fooling you- this ball is levitating.](http://www.theblaze.com/stories/your-eyes-arent-fooling-you-this-ball-is-levitating-and-heres-how/)
- [The Verge: ZeroN magnetic levitation system can playback movements in space.](http://www.theverge.com/2012/5/13/3018142/zeron-mit-media-lab-levitation)
- [Educatedearth.net: ZeroN - MIT's Revolutionary Computer Interface](http://www.educatedearth.net/story.php?id=1918)
- [Popsci: MIT's Latest User Interface Employs Gravity-Defying, Levitating Metal Orbs](http://www.popsci.com/science/article/2012-05/video-mits-latest-user-interface-employs-gravity-defying-levitating-metal-orbs/)
- [Gizmag: ZeroN system holds a ball wherever you place it, in mid-air](http://www.gizmag.com/zeron-levitates-magnetic-ball/22482/)
- [ALT1040](http://alt1040.com/2012/05/zeron-mit-media-lab-interfaz-tangible)
- [International Business Times](http://www.ibtimes.com/articles/340640/20120514/mit-researchers-develop-zeron-magnetic-levitating-device.htm)
- [The Technology Cafe](http://www.thetechnologycafe.com/mit-student-jinha-lees-computer-controlled-magic-levitation-experiment-zeron-will-blow-your-mind-viral-video/)
- [Spiegel Online: Mensch-Maschine-SchnittstelleInteragieren über schwebende Kugel](http://www.spiegel.de/wissenschaft/natur/schwebende-kugel-als-mensch-maschine-schnittstelle-a-834504.html)
- [Hungary: index.hu (hungarian news portal) Antigravitációs kezelőfelületet mutatott be az MIT](http://index.hu/tudomany/2012/05/21/antigravitacios_kezelofeluletet_mutatott_be_az_mit/)
EOL

# Create placeholder files for projects with lorem ipsum content
for category in inertial-sensing wearables-and-textiles sensors other defying-gravity; do
    for file in $(find ./content -path "*/$category/*" -type f -name "project.txt"); do
        if grep -q "Lorem ipsum" "$file"; then
            filename=$(basename "$(dirname "$file")")
            cat > rehmi.github.io/projects/$category/$filename.md << EOL
@def title = "$(sed -n 's/^title: //p' "$file")"
@def tags = ["projects", "$category"]
@def project_date = "$(sed -n 's/^date: //p' "$file")"

# $(sed -n 's/^title: //p' "$file")

Project Date: $(sed -n 's/^date: //p' "$file")

[Placeholder for project content]
EOL
        fi
    done
done

# Create _layout files
mkdir -p rehmi.github.io/_layout
cat > rehmi.github.io/_layout/head.html << EOL
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/franklin.css">
    <link rel="stylesheet" href="/css/basic.css">
    <title>{{if haskey(page, "title")}}{{fill title}} - {{end}}Rehmi Post's Portfolio</title>
</head>
<body>
{{insert nav.html}}

<div class="franklin-content">
EOL

cat > rehmi.github.io/_layout/page_foot.html << EOL
</div> <!-- end of franklin-content -->
EOL

cat > rehmi.github.io/_layout/foot.html << EOL
<div class="page-foot">
    <div class="copyright">
        &copy; {{ fill author }}. {{isnotpage /tag/*}}Last modified: {{ fill fd_mtime }}.{{end}}
    </div>
</div>
</body>
</html>
EOL

cat > rehmi.github.io/_layout/nav.html << EOL
<nav>
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about/">About</a></li>
        <li><a href="/projects/">Projects</a></li>
        <li><a href="/publications/">Publications</a></li>
        <li><a href="/contact-me/">Contact</a></li>
    </ul>
</nav>
EOL

# Create basic CSS file
mkdir -p rehmi.github.io/_css
cat > rehmi.github.io/_css/basic.css << EOL
/* Add your custom styles here */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
}

.franklin-content {
    margin: auto;
    max-width: 800px;
    padding: 20px;
}

nav ul {
    list-style-type: none;
    padding: 0;
}

nav ul li {
    display: inline;
    margin-right: 10px;
}

.page-foot {
    text-align: center;
    margin-top: 50px;
    border-top: 1px solid #ddd;
    padding-top: 20px;
}
EOL

echo "Franklin.jl website structure created successfully!"
