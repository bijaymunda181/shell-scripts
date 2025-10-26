
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Bijay — Modern Landing</title>
    <meta name="description" content="Professional, responsive landing page template for personal or small business." />

    <!-- Google Font (optional) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;800&display=swap" rel="stylesheet">

    <style>
        :root{
          --bg:#0f1724;
          --card:#0b1220;
          --accent:#4a90ff;
          --muted:#9aa6bf;
          --glass: rgba(255,255,255,0.03);
          font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
          color-scheme: dark;
        }
        *{box-sizing:border-box}
        html,body{height:100%;margin:0;background:linear-gradient(180deg,#071126 0%, #071b2a 60%);color:#e6eef8}
        .wrap{max-width:1100px;margin:32px auto;padding:28px}
        header{display:flex;align-items:center;justify-content:space-between;gap:16px}
        .brand{display:flex;align-items:center;gap:12px}
        .logo{
          width:56px;height:56px;border-radius:12px;
          display:grid;place-items:center;font-weight:800;color:#07263b;
          background:linear-gradient(135deg, #7dd3fc, #4a90ff);
          box-shadow:0 6px 18px rgba(74,144,255,0.18);
        }
        nav a{color:var(--muted);text-decoration:none;margin-left:18px;font-weight:600}
        nav a:hover{color:var(--accent)}
        .hero{
          display:grid;grid-template-columns:1fr 420px;gap:28px;margin-top:24px;align-items:center;
        }
        .card{
          background:linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
          border-radius:14px;padding:28px;box-shadow:0 6px 30px rgba(2,6,23,0.6);backdrop-filter: blur(6px);
        }
        .hero-left h1{font-size:32px;margin:0 0 12px 0;line-height:1.05}
        .lead{color:var(--muted);margin:0 0 18px 0}
        .cta{display:flex;gap:12px}
        .btn{
          display:inline-block;padding:12px 18px;border-radius:10px;text-decoration:none;font-weight:700;
          background:var(--accent);color:white;box-shadow:0 8px 20px rgba(74,144,255,0.12);
        }
        .btn.secondary{
          background:transparent;border:1px solid rgba(255,255,255,0.06);color:var(--muted);font-weight:600;
        }
        .features{display:grid;grid-template-columns:repeat(3,1fr);gap:14px;margin-top:20px}
        .feature{background:var(--glass);padding:12px;border-radius:10px;text-align:center}
        .feature h3{margin:6px 0 0 0;font-size:15px}
        .hero-right{
          padding:18px;border-radius:12px;background:linear-gradient(180deg, rgba(255,255,255,0.02), transparent);
        }
        .stats{display:flex;gap:10px;flex-wrap:wrap}
        .stat{flex:1;min-width:120px;padding:12px;border-radius:10px;background:rgba(255,255,255,0.02);text-align:center}
        .stat b{display:block;font-size:20px}
        main{margin-top:26px;display:grid;grid-template-columns:1fr 360px;gap:26px}
        .content-section{background:var(--card);padding:20px;border-radius:12px}
        .contact form{display:flex;flex-direction:column;gap:10px}
        input,textarea{padding:10px;border-radius:8px;border:1px solid rgba(255,255,255,0.04);background:transparent;color:inherit}
        input::placeholder,textarea::placeholder{color:var(--muted)}
        footer{margin-top:28px;text-align:center;color:var(--muted);font-size:14px;padding-bottom:20px}
        /* responsive */
        @media (max-width:900px){
          .hero{grid-template-columns:1fr; }
          main{grid-template-columns:1fr}
          nav a{display:none}
        }
    </style>
</head>
<body>
<div class="wrap">
    <header>
        <div class="brand">
            <div class="logo" aria-hidden="true">B</div>
            <div>
                <div style="font-weight:800">Bijay</div>
                <div style="font-size:12px;color:var(--muted)">Linux Admin • Monitoring • DevOps</div>
            </div>
        </div>

        <nav aria-label="Main navigation">
            <a href="#about">About</a>
            <a href="#services">Services</a>
            <a href="#contact">Contact</a>
        </nav>
    </header>

    <section class="hero">
        <div class="card hero-left">
            <h1>Reliable server monitoring & modern web presence</h1>
            <p class="lead">Deploy fast. Monitor deeply. Respond quickly. Built for system administrators and small teams who need clear dashboards and stable infrastructure.</p>

            <div class="cta">
                <a class="btn" href="#contact">Get Started</a>
                <a class="btn secondary" href="#services">Learn More</a>
            </div>

            <div class="features" aria-hidden="false" style="margin-top:18px">
                <div class="feature">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" style="display:block;margin:0 auto 6px">
                        <path d="M3 12h18" stroke="#9fbff8" stroke-width="1.6" stroke-linecap="round"/>
                    </svg>
                    <h3>Fast Setup</h3>
                </div>
                <div class="feature">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" style="display:block;margin:0 auto 6px">
                        <circle cx="12" cy="12" r="9" stroke="#9fbff8" stroke-width="1.6"/>
                    </svg>
                    <h3>Secure</h3>
                </div>
                <div class="feature">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" style="display:block;margin:0 auto 6px">
                        <path d="M4 19h16" stroke="#9fbff8" stroke-width="1.6" stroke-linecap="round"/>
                    </svg>
                    <h3>Scalable</h3>
                </div>
            </div>
        </div>

        <aside class="card hero-right" aria-labelledby="site-stats">
            <h2 id="site-stats" style="margin:0 0 10px 0">Live Snapshot</h2>
            <div class="stats">
                <div class="stat">
                    <small>Uptime</small>
                    <b>99.98%</b>
                </div>
                <div class="stat">
                    <small>Servers</small>
                    <b>150+</b>
                </div>
                <div class="stat">
                    <small>Alerts</small>
                    <b>Automated</b>
                </div>
            </div>

            <div style="margin-top:14px;color:var(--muted);font-size:14px">
                Want dashboards? <strong style="color:var(--accent)">Grafana + Prometheus</strong> ready.
            </div>
        </aside>
    </section>

    <main>
        <section id="about" class="content-section">
            <h3>About</h3>
            <p style="color:var(--muted)">I’m Bijay — a Linux administrator experienced in server management, monitoring, and automation. This template is a clean starting point to show credentials, services, and a contact form visitors can use to reach you.</p>

            <h4 id="services" style="margin-top:18px">What I offer</h4>
            <ul style="color:var(--muted);line-height:1.7">
                <li>Server provisioning & management (CentOS, Amazon Linux, Ubuntu)</li>
                <li>Monitoring stack: Prometheus, Node Exporter, Grafana</li>
                <li>Automation & backups using shell scripts / Ansible</li>
            </ul>
        </section>

        <aside id="contact" class="content-section contact" aria-labelledby="contact-heading">
            <h3 id="contact-heading">Contact</h3>
            <p style="color:var(--muted);margin-top:6px">Send a message and I’ll get back to you.</p>

            <!-- Note: this form is static. Add backend to accept submissions. -->
            <form onsubmit="event.preventDefault(); alert('Thanks — form example only (no server).');">
                <label class="sr-only" style="display:none">Name</label>
                <input type="text" placeholder="Your name" required>

                <input type="email" placeholder="Email address" required>

                <textarea placeholder="Message" rows="5" required></textarea>

                <button class="btn" type="submit">Send Message</button>
            </form>

            <div style="margin-top:12px;color:var(--muted);font-size:13px">
                Or email: <a href="mailto:bijay@example.com" style="color:var(--accent)">bijay@example.com</a>
            </div>
        </aside>
    </main>

    <footer>
        <div>© <span id="year"></span> Bijay — Built for reliability & clarity</div>
    </footer>
</div>

<script>
    // small client-side niceties
    document.getElementById('year').textContent = new Date().getFullYear();
</script>
</body>
</html>
