#!/usr/bin/env bash
set -e

NICHE="${1:-coffee}"
VIDEO_PATH="${2:-}"
OUT_DIR="./dist-${NICHE}"

mkdir -p "$OUT_DIR/frames"

HAS_FRAMES="false"
FRAME_COUNT=120

if [[ -n "$VIDEO_PATH" && -f "$VIDEO_PATH" ]] && command -v ffmpeg >/dev/null 2>&1; then
  ffmpeg -y -i "$VIDEO_PATH" -vf "fps=24,scale=1280:-1:flags=lanczos" -vframes 120 -q:v 80 "$OUT_DIR/frames/frame_%04d.webp" >/dev/null 2>&1
  FRAME_COUNT=$(ls -1 "$OUT_DIR/frames"/frame_*.webp 2>/dev/null | wc -l)
  HAS_FRAMES="true"
fi

case "$NICHE" in
  burger)
    BRAND="SMASH // LAB"; ACCENT="#ff5500"; BG_DARK="#090706"
    HERO_TAG="// 01. THE CUT — 100% WAGYU BRISKET"; HERO_TITLE="THE ART OF THE SEAR"; HERO_SUB="Scroll to experience the Maillard reaction at 230°C."
    STEP1_CODE="// 02. THE GRILL — 139°C TO 230°C"; STEP1_TITLE="CRUST LOCKED IN 60 SECONDS"; STEP1_DESC="Hand-smashed on seasoned cast iron to caramelize every edge while locking in bone-marrow juices."
    STEP2_CODE="// 03. THE ANATOMY"; STEP2_TITLE="AGED CHEDDAR & SMOKED GARLIC AIOLI"; STEP2_DESC="Layered over toasted brioche with house-fermented pickles and charred onion jam."
    STEP3_CODE="// 04. SIGNATURE BUILD"; STEP3_TITLE="DOUBLE TRUFFLE SMASH"; STEP3_DESC="Ready in 4 minutes. Order via Voice AI or customize your patty weight below."
    ITEM1_NAME="01 // THE CLASSIC SMASH"; ITEM1_PRICE="$16"; ITEM1_META="Double Wagyu • American Cheese • House Sauce"
    ITEM2_NAME="02 // TRUFFLE & BONE MARROW"; ITEM2_PRICE="$22"; ITEM2_META="Black Truffle Glaze • Aged Gruyère • Brioche"
    ITEM3_NAME="03 // SPICY SEOUL GLAZE"; ITEM3_PRICE="$19"; ITEM3_META="Gochujang Honey • Kimchi Slaw • Crispy Shallots"
    ;;
  camera)
    BRAND="LUCID ONE"; ACCENT="#00e5ff"; BG_DARK="#05070a"
    HERO_TAG="// 01. PRECISION OPTICS — F/1.2"; HERO_TITLE="BUILT TO CAPTURE LIGHT"; HERO_SUB="Scroll to disassemble the 61MP Full-Frame Optical Core."
    STEP1_CODE="// 02. ADAPTIVE APERTURE"; STEP1_TITLE="NANO-COATED ASPHERICAL GLASS"; STEP1_DESC="Zero chromatic aberration with sub-micron surface precision and ultra-fast silent focus motors."
    STEP2_CODE="// 03. EXMOR-X SENSOR"; STEP2_TITLE="5-AXIS IN-BODY STABILIZATION"; STEP2_DESC="15+ stops of dynamic range engineered for low-light cinema and raw studio photography."
    STEP3_CODE="// 04. AEROSPACE CHASSIS"; STEP3_TITLE="MILLED MAGNESIUM ALLOY"; STEP3_DESC="Weather-sealed body with tactile dials and instant wireless RAW transfer."
    ITEM1_NAME="01 // LUCID ONE BODY"; ITEM1_PRICE="$2,499"; ITEM1_META="61MP Full-Frame • 8K 60fps RAW • 5-Axis IBIS"
    ITEM2_NAME="02 // 35MM F/1.2 PRIME"; ITEM2_PRICE="$1,199"; ITEM2_META="Nano AR Coating II • Linear XD Motors"
    ITEM3_NAME="03 // CINEMA RIG EDITION"; ITEM3_PRICE="$3,899"; ITEM3_META="Body + 35mm Prime + OLED Viewfinder + Cage"
    ;;
  *)
    BRAND="RÖSTWERK"; ACCENT="#d97706"; BG_DARK="#070504"
    HERO_TAG="// 01. SINGLE ORIGIN — ETHIOPIA YIRGACHEFFE"; HERO_TITLE="WAIT FOR THE BEAN TO EXPLODE"; HERO_SUB="Scroll to trigger the 214°C first-crack roasting physics."
    STEP1_CODE="// 02. THE FIRST CRACK — 214°C"; STEP1_TITLE="AROMA UNLOCKED AT CELLULAR LEVEL"; STEP1_DESC="Precision drum roasting expands each bean, releasing caramelized sugars and volcanic bergamot oils."
    STEP2_CODE="// 03. THE ALCHEMY"; STEP2_TITLE="9-BAR ESPRESSO EXTRACTION"; STEP2_DESC="Micro-sieved crema meets silky cold-aerated oat milk and torched raw demerara sugar."
    STEP3_CODE="// 04. THE SIGNATURE POUR"; STEP3_TITLE="BRÛLÉE NITRO LATTE"; STEP3_DESC="Caramelized crust on top, velvet cold brew underneath. Experience it live."
    ITEM1_NAME="01 // BRÛLÉE LATTE"; ITEM1_PRICE="$7.50"; ITEM1_META="Torched Sugar Crust • Double Ristretto • Oat Milk"
    ITEM2_NAME="02 // RASPBERRY WEB MOCHA"; ITEM2_PRICE="$8.00"; ITEM2_META="70% Dark Ghana Cocoa • Raspberry Reduction"
    ITEM3_NAME="03 // KYOTO COLD DRIP"; ITEM3_PRICE="$6.50"; ITEM3_META="18-Hour Slow Ice Extraction • Smoked Vanilla"
    ;;
esac

cat << HTML > "$OUT_DIR/index.html"
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${BRAND} — Interactive 3D Experience</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;600;700&family=Syne:wght@700;800&display=swap" rel="stylesheet">
  <style>
    :root { --accent: ${ACCENT}; --bg: ${BG_DARK}; }
    body { background-color: var(--bg); color: #f5f5f4; font-family: 'Space Grotesk', sans-serif; overflow-x: hidden; }
    h1, h2, .font-display { font-family: 'Syne', sans-serif; }
    .glass { background: rgba(18, 16, 15, 0.65); backdrop-filter: blur(16px); border: 1px solid rgba(255,255,255,0.08); }
    #webgl-canvas { position: fixed; top: 0; left: 0; width: 100vw; height: 100vh; z-index: 1; pointer-events: none; }
    .content-layer { position: relative; z-index: 10; }
  </style>
</head>
<body>
  <canvas id="webgl-canvas"></canvas>
  <header class="fixed top-0 left-0 w-full z-50 px-6 py-4 flex justify-between items-center glass">
    <div class="flex items-center gap-3">
      <span class="w-2.5 h-2.5 rounded-full animate-ping" style="background: var(--accent)"></span>
      <span class="font-display font-extrabold tracking-widest text-lg">${BRAND}</span>
    </div>
    <div class="flex items-center gap-3">
      <span id="temp-readout" class="text-xs font-mono px-2.5 py-1 rounded bg-white/5 border border-white/10" style="color: var(--accent)">024°C // IDLE</span>
      <button onclick="speakText('Welcome to ${BRAND}. Scroll to inspect our 3D process or select an item below.')" class="px-4 py-2 rounded-full text-xs font-bold uppercase text-black" style="background: var(--accent)">🎙️ AI Concierge</button>
    </div>
  </header>

  <main id="scrolly" class="content-layer">
    <section class="h-screen flex flex-col justify-center items-center text-center px-6">
      <p class="text-xs font-mono tracking-[0.3em] uppercase mb-4 px-3 py-1 rounded-full glass" style="color: var(--accent)">${HERO_TAG}</p>
      <h1 class="text-5xl md:text-8xl font-extrabold max-w-5xl leading-none mb-6">${HERO_TITLE}</h1>
      <p class="text-stone-400 max-w-xl text-base md:text-lg">${HERO_SUB}</p>
    </section>
    <section class="h-screen flex items-center px-6 md:px-20">
      <div class="glass p-8 rounded-2xl max-w-lg">
        <div class="text-xs font-mono mb-2" style="color: var(--accent)">${STEP1_CODE}</div>
        <h2 class="text-3xl font-bold mb-4">${STEP1_TITLE}</h2>
        <p class="text-stone-300 text-sm">${STEP1_DESC}</p>
      </div>
    </section>
    <section class="h-screen flex items-center justify-end px-6 md:px-20">
      <div class="glass p-8 rounded-2xl max-w-lg">
        <div class="text-xs font-mono mb-2" style="color: var(--accent)">${STEP2_CODE}</div>
        <h2 class="text-3xl font-bold mb-4">${STEP2_TITLE}</h2>
        <p class="text-stone-300 text-sm">${STEP2_DESC}</p>
      </div>
    </section>
    <section class="h-screen flex items-center justify-center text-center px-6">
      <div class="glass p-10 rounded-3xl max-w-2xl">
        <div class="text-xs font-mono mb-2" style="color: var(--accent)">${STEP3_CODE}</div>
        <h2 class="text-4xl md:text-6xl font-extrabold mb-4">${STEP3_TITLE}</h2>
        <p class="text-stone-300 mb-6">${STEP3_DESC}</p>
        <a href="#lineup" class="inline-block px-8 py-4 rounded-full font-bold text-black uppercase text-xs" style="background: var(--accent)">Explore Menu ↓</a>
      </div>
    </section>
  </main>

  <section id="lineup" class="content-layer py-24 px-6 md:px-20 bg-black/85 backdrop-blur-xl border-t border-white/10">
    <div class="max-w-6xl mx-auto grid md:grid-cols-3 gap-6">
      <div class="glass rounded-2xl p-6"><div class="flex justify-between mb-3"><span class="text-xs font-mono text-stone-400">SIGNATURE</span><span class="font-bold" style="color:var(--accent)">${ITEM1_PRICE}</span></div><h3 class="text-xl font-bold mb-2">${ITEM1_NAME}</h3><p class="text-stone-400 text-xs mb-4">${ITEM1_META}</p></div>
      <div class="glass rounded-2xl p-6"><div class="flex justify-between mb-3"><span class="text-xs font-mono text-stone-400">LIMITED</span><span class="font-bold" style="color:var(--accent)">${ITEM2_PRICE}</span></div><h3 class="text-xl font-bold mb-2">${ITEM2_NAME}</h3><p class="text-stone-400 text-xs mb-4">${ITEM2_META}</p></div>
      <div class="glass rounded-2xl p-6"><div class="flex justify-between mb-3"><span class="text-xs font-mono text-stone-400">CRAFT</span><span class="font-bold" style="color:var(--accent)">${ITEM3_PRICE}</span></div><h3 class="text-xl font-bold mb-2">${ITEM3_NAME}</h3><p class="text-stone-400 text-xs mb-4">${ITEM3_META}</p></div>
    </div>
  </section>

  <script>
    gsap.registerPlugin(ScrollTrigger);
    const canvas = document.getElementById('webgl-canvas'), ctx = canvas.getContext('2d');
    const tempReadout = document.getElementById('temp-readout');
    const ACCENT = "${ACCENT}";
    let width = canvas.width = window.innerWidth, height = canvas.height = window.innerHeight;
    window.addEventListener('resize', () => { width = canvas.width = window.innerWidth; height = canvas.height = window.innerHeight; });
    const state = { progress: 0 };
    const nodes = Array.from({ length: 130 }, (_, i) => ({
      angle: (i / 130) * Math.PI * 24, radius: 15 + (i * 2.2), yOffset: (Math.random() - 0.5) * 300,
      size: 3 + (i % 8), speed: 0.4 + Math.random() * 1.2, shade: i % 3 === 0 ? ACCENT : '#ffffff'
    }));
    function render() {
      ctx.clearRect(0, 0, width, height);
      const p = state.progress, cx = width / 2, cy = height / 2, explosion = Math.sin(p * Math.PI);
      tempReadout.textContent = \`\${Math.round(24 + p * 206)}°C // \${p < 0.25 ? 'IDLE' : p < 0.7 ? '3D EXPLODE' : 'READY'}\`;
      const grad = ctx.createRadialGradient(cx, cy, 10, cx, cy, 160 + explosion * 260);
      grad.addColorStop(0, ACCENT + '55'); grad.addColorStop(1, 'transparent');
      ctx.fillStyle = grad; ctx.beginPath(); ctx.arc(cx, cy, 360, 0, Math.PI * 2); ctx.fill();
      nodes.forEach(n => {
        const a = n.angle + p * 6 * n.speed, spread = explosion * n.radius * 1.8;
        const x = cx + Math.cos(a) * (25 + spread), y = cy + Math.sin(a) * (25 + spread * 0.65) + (n.yOffset * explosion);
        ctx.save(); ctx.translate(x, y); ctx.rotate(a); ctx.fillStyle = n.shade; ctx.globalAlpha = 0.5;
        ctx.beginPath(); ctx.ellipse(0, 0, n.size * 1.4, n.size * 0.8, 0, 0, Math.PI * 2); ctx.fill(); ctx.restore();
      });
      requestAnimationFrame(render);
    }
    render();
    gsap.to(state, { progress: 1, ease: 'none', scrollTrigger: { trigger: '#scrolly', start: 'top top', end: 'bottom bottom', scrub: 0.6 } });
    function speakText(t) { if ('speechSynthesis' in window) { window.speechSynthesis.cancel(); window.speechSynthesis.speak(new SpeechSynthesisUtterance(t)); } }
  </script>
</body>
</html>
HTML
echo "[✓] Built $OUT_DIR"
