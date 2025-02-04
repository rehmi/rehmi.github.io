+++
title = "Rehmi Post's Portfolio"
hascode = false
hasmath = false
style = ".project-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1.5rem;
    padding: 1rem;
}

.project-category {
    margin: 2rem 0;
}

.project-category h2 {
    font-size: 1.5rem;
    color: #666;
    border-bottom: 1px solid #ddd;
    padding-bottom: 0.5rem;
    margin-bottom: 1.5rem;
    font-style: italic;
}

.project-card {
    display: flex;
    text-decoration: none;
    color: inherit;
    background: white;
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    height: 200px;
}

.project-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.project-card .image-container {
    flex: 0 0 200px;
    position: relative;
    overflow: hidden;
}

.project-card img {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.project-card .card-content {
    flex: 1;
    padding: 1.5rem;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.project-card h3 {
    margin: 0 0 0.5rem 0;
    font-size: 1.2rem;
    color: #333;
}

.project-card .project-date {
    font-size: 0.9rem;
    color: #666;
    font-style: italic;
    margin-bottom: 0.75rem;
}

.project-card .project-description {
    font-size: 0.95rem;
    color: #444;
    line-height: 1.4;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.hero-section {
    background-color: #5e616c;
    background-image: url('/assets/minimal-mistakes/mm-home-page-feature.jpg');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 4rem 2rem;
    text-align: center;
    margin-bottom: 2rem;
}

.hero-section h1 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.hero-section p {
    font-size: 1.2rem;
    max-width: 800px;
    margin: 0 auto;
}

.feature-section {
    text-align: center;
    padding: 2rem;
    background: #f8f9fa;
    margin: 2rem 0;
    border-radius: 8px;
}

@media (max-width: 600px) {
    .project-card {
        flex-direction: column;
        height: auto;
    }
    
    .project-card .image-container {
        width: 100%;
        padding-top: 100%;
        flex: none;
    }
    
    .project-card .card-content {
        padding: 1rem;
    }
}"
+++

~~~
<div class="hero-section">
  <h1>Welcome to Rehmi Post's Portfolio</h1>
  <p>This is a collection of Rehmi Post's work in various fields including sensors, wearable technology, and more.</p>
</div>
~~~

# Selected Projects _(1995—2014)_

## Navigation
* [About](/about/)
* [Projects](/projects/)
* [Publications](/publications/)
* [Contact Me](/contact-me/)

## _Defying Gravity_

~~~
<div class="project-grid">
  <a href="/projects/defying-gravity/zeron/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/defying-gravity/zeron/thumb.jpg" alt="ZeroN levitated interaction element">
    </div>
    <div class="card-content">
      <h3>ZeroN levitated interaction element</h3>
      <div class="project-date">2011</div>
      <div class="project-description">A new tangible interaction element that can be levitated and moved freely by computer in 3D space.</div>
    </div>
  </a>
</div>
~~~

## _Wearables and Textiles_

~~~
<div class="project-grid">
  <a href="/projects/wearables-and-textiles/wearable-computing/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/wearables-and-textiles/wearable-computing/thumb.jpg" alt="Wearable Computing">
    </div>
    <div class="card-content">
      <h3>Wearable Computing</h3>
      <div class="project-date">1995 - 2000</div>
      <div class="project-description">Early research and development in integrating computing systems into clothing.</div>
    </div>
  </a>

  <a href="/projects/wearables-and-textiles/midi-jacket/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/wearables-and-textiles/midi-jacket/thumb.jpg" alt="MIDI Jacket">
    </div>
    <div class="card-content">
      <h3>MIDI Jacket</h3>
      <div class="project-date">1997</div>
      <div class="project-description">Musical interface integrated into clothing using conductive fabric circuits.</div>
    </div>
  </a>

  <a href="/projects/wearables-and-textiles/j4k3t-20/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/wearables-and-textiles/j4k3t-20/thumb.jpg" alt="j4k3t 2.0">
    </div>
    <div class="card-content">
      <h3>j4k3t 2.0</h3>
      <div class="project-date">Feb 2006</div>
      <div class="project-description">Second generation wearable computing platform.</div>
    </div>
  </a>

  <a href="/projects/wearables-and-textiles/sparkle/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/wearables-and-textiles/sparkle/thumb.jpg" alt="Sp4rkl3">
    </div>
    <div class="card-content">
      <h3>Sp4rkl3</h3>
      <div class="project-date">Jan 2008</div>
      <div class="project-description">Interactive textile display using embedded LEDs and conductive patterns.</div>
    </div>
  </a>

  <a href="/projects/wearables-and-textiles/interactive-tablecloth/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/wearables-and-textiles/interactive-tablecloth/thumb.jpg" alt="Interactive Tablecloth">
    </div>
    <div class="card-content">
      <h3>Interactive Tablecloth</h3>
      <div class="project-date">2009, Aug–</div>
      <div class="project-description">A smart textile surface that responds to touch and object placement.</div>
    </div>
  </a>

  <a href="/projects/wearables-and-textiles/utartan/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/wearables-and-textiles/utartan/thumb.jpg" alt="µTartan">
    </div>
    <div class="card-content">
      <h3>µTartan</h3>
      <div class="project-date">2009, Aug–</div>
      <div class="project-description">Microscale weaving patterns for electronic textile integration.</div>
    </div>
  </a>

  <a href="/projects/wearables-and-textiles/stretchable-cable/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/wearables-and-textiles/stretchable-cable/thumb.jpg" alt="Stretchable Cable">
    </div>
    <div class="card-content">
      <h3>Stretchable Cable</h3>
      <div class="project-date">2005, Sep</div>
      <div class="project-description">Elastic electronic connections for wearable devices.</div>
    </div>
  </a>
</div>
~~~

## _Sensors_

~~~
<div class="project-grid">
  <a href="/projects/sensors/taufish/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/sensors/taufish/thumb.jpg" alt="Multitouch Table at MoMA">
    </div>
    <div class="card-content">
      <h3>Multitouch Table at MoMA</h3>
      <div class="project-date">1999</div>
      <div class="project-description">Interactive multitouch table installation at the Museum of Modern Art.</div>
    </div>
  </a>
</div>
~~~

## _Inertial Sensing_

~~~
<div class="project-grid">
  <a href="/projects/inertial-sensing/particle-trap-imu/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/inertial-sensing/particle-trap-imu/thumb.jpg" alt="Particle Trap IMU">
    </div>
    <div class="card-content">
      <h3>Particle Trap IMU</h3>
      <div class="project-date">2003</div>
      <div class="project-description">Inertial measurement using trapped particles.</div>
    </div>
  </a>

  <a href="/projects/inertial-sensing/haltere-imu/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/inertial-sensing/haltere-imu/thumb.gif" alt="Haltere IMU">
    </div>
    <div class="card-content">
      <h3>Haltere IMU</h3>
      <div class="project-date">2009-2010</div>
      <div class="project-description">Bio-inspired inertial measurement system.</div>
    </div>
  </a>

  <a href="/projects/inertial-sensing/mems-accelerometer/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/inertial-sensing/mems-accelerometer/thumb.jpg" alt="MEMS Interferometric Accelerometer">
    </div>
    <div class="card-content">
      <h3>MEMS Interferometric Accelerometer</h3>
      <div class="project-date">Fall 1999</div>
      <div class="project-description">High-precision MEMS-based acceleration sensing.</div>
    </div>
  </a>
</div>
~~~

## _Other Projects_

~~~
<div class="project-grid">
  <a href="/projects/other/functional-digital-materials/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/other/functional-digital-materials/thumb.jpg" alt="Functional Digital Materials">
    </div>
    <div class="card-content">
      <h3>Functional Digital Materials</h3>
      <div class="project-date">2009, Jun–</div>
      <div class="project-description">Research into programmable matter and digital materials.</div>
    </div>
  </a>

  <a href="/projects/other/sandcastles/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/other/sandcastles/thumb.jpg" alt="Sandcastles">
    </div>
    <div class="card-content">
      <h3>Sandcastles</h3>
      <div class="project-date">2010-2012</div>
      <div class="project-description">Study of granular material behavior.</div>
    </div>
  </a>

  <a href="/projects/other/pengachu/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/other/pengachu/thumb.jpg" alt="Pengachu">
    </div>
    <div class="card-content">
      <h3>Pengachu</h3>
      <div class="project-date">2000-2001</div>
      <div class="project-description">Interactive robotic companion project.</div>
    </div>
  </a>

  <a href="/projects/other/hello-radio/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/other/hello-radio/thumb.jpg" alt="Hello Radio">
    </div>
    <div class="card-content">
      <h3>Hello Radio</h3>
      <div class="project-date">Fall 2009</div>
      <div class="project-description">Experimental radio communication system.</div>
    </div>
  </a>

  <a href="/projects/other/intrabody-power/" class="project-card">
    <div class="image-container">
      <img src="/assets/thumbnails/other/intrabody-power/thumb.jpg" alt="Intrabody Power">
    </div>
    <div class="card-content">
      <h3>Intrabody Power</h3>
      <div class="project-date">1996</div>
      <div class="project-description">Power transmission through the human body.</div>
    </div>
  </a>
</div>
~~~

~~~
<div class="feature-section">
  <h2>Note About This Site</h2>
  <p>While this site is under construction, you can visit the <a href="http://rehmi.info">old website</a> for complete information.</p>
</div>

<footer>
© Copyright E. Rehmi Post 2024 | <a href="/feed/">RSS</a>
</footer>
~~~