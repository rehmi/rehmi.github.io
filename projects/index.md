+++
title = "Selected Projects (1995—2014)"
hasplotly = false
+++

<!-- Add custom CSS for project cards -->
~~~
<style>
.project-grid {
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
    height: 200px; /* Fixed height for consistency */
}

.project-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.project-card .image-container {
    flex: 0 0 200px; /* Fixed width equal to height for square */
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

@media (max-width: 600px) {
    .project-card {
        flex-direction: column;
        height: auto;
    }
    
    .project-card .image-container {
        width: 100%;
        padding-top: 100%; /* Makes it square */
        flex: none;
    }
    
    .project-card .card-content {
        padding: 1rem;
    }
}
</style>
~~~

# Selected Projects _(1995—2014)_

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
            <div class="project-description">Early research and development in integrating computing systems into clothing and everyday wear.</div>
        </div>
    </a>
    
    <a href="/projects/wearables-and-textiles/midi-jacket/" class="project-card">
        <div class="image-container">
            <img src="/assets/thumbnails/wearables-and-textiles/midi-jacket/thumb.jpg" alt="MIDI Jacket">
        </div>
        <div class="card-content">
            <h3>MIDI Jacket</h3>
            <div class="project-date">1997</div>
            <div class="project-description">A musical interface integrated directly into clothing using conductive fabric circuits and washable electronics.</div>
        </div>
    </a>
    
    <a href="/projects/wearables-and-textiles/j4k3t-20/" class="project-card">
        <div class="image-container">
            <img src="/assets/thumbnails/wearables-and-textiles/j4k3t-20/thumb.jpg" alt="j4k3t 2.0">
        </div>
        <div class="card-content">
            <h3>j4k3t 2.0</h3>
            <div class="project-date">Feb 2006</div>
            <div class="project-description">Second generation wearable computing platform with improved integration and functionality.</div>
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

[Content continues with Sensors, Inertial Sensing, and Other sections following the same pattern...]