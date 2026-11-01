# 3D Scrollytelling Website Engine & Flagship Demos 🚀

[![Vercel Deployment](https://img.shields.io/badge/Vercel-Deployed-black?style=flat&logo=vercel)](https://premium-3d-websites-engine.vercel.app)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GSAP 3](https://img.shields.io/badge/GSAP-ScrollTrigger-green.svg)](https://greensock.com)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-CSS-38bdf8.svg)](https://tailwindcss.com)

A high-performance **3D Scrollytelling Website Engine** and flagship showcase engineered for luxury niches. Transform video sequences or procedural kinetic particle physics into fluid, Apple-grade 60FPS interactive web experiences with zero compilation overhead.

---

## 🌟 Live Production Showcase

| Experience | Theme / Niche | Key Tech Specs | Live Link |
| :--- | :--- | :--- | :--- |
| **Showcase Hub** | Main Portal & Studio Preview | Three.js / Canvas Kinetic Orbit & In-Page Simulator | [Launch Hub ↗](https://premium-3d-websites-engine.vercel.app/) |
| **☕ RÖSTWERK** | Ethiopian Roastery & Extraction | 214°C First-Crack Particle Kinetics & AI Concierge | [Launch Demo ↗](https://premium-3d-websites-engine.vercel.app/coffee) |
| **🍔 SMASH // LAB** | Wagyu Artisanal Burger | 230°C Maillard Reaction & Cast-Iron Sizzle | [Launch Demo ↗](https://premium-3d-websites-engine.vercel.app/burger) |
| **📸 LUCID ONE** | 61MP Optical Disassembly | Sub-Micron Aspherical Glass & Sensor Stack | [Launch Demo ↗](https://premium-3d-websites-engine.vercel.app/camera) |

---

## ✨ Features

- **⚡ 60 FPS Sub-Millisecond Scrub**: Hardware-accelerated canvas rendering synchronized with GSAP ScrollTrigger.
- **🎙️ AI Voice Concierge**: Native Web Speech API audio synthesis guides visitors through roasting temperatures, optics specs, and ingredients.
- **💎 Spatial Glassmorphism UI**: High-density blurred backdrops, glowing dynamic accent tokens, and responsive mobile-first typography.
- **🛠️ Automated CLI Engine (`3d-forge.sh`)**: Slices 120 high-fidelity WebP frames from any video via FFmpeg (Lanczos 24fps) or generates procedural particle kinetics out of the box.
- **🌐 Zero-Config Vercel Edge Deployment**: Instant static file delivery with HTTP/3, caching, and clean URL routing.

---

## 🚀 Quickstart & CLI Usage

### 1. Clone the repository
```bash
git clone https://github.com/knightriderisback/premium-3d-websites-engine.git
cd premium-3d-websites-engine
```

### 2. Run the 3D Forge Engine
Generate a complete bespoke experience for any niche:

```bash
# Generate with procedural WebGL/Canvas kinetic particles:
./3d-forge.sh coffee
./3d-forge.sh burger
./3d-forge.sh camera

# Or pass a video to automatically slice 120 high-fidelity WebP frames:
./3d-forge.sh coffee ./assets/beans-roast.mp4
```

Each command builds a production-ready directory (`./dist-coffee`, `./dist-burger`, `./dist-camera`) containing the complete HTML/JS/CSS bundle.

### 3. Deploy to Vercel
```bash
vercel --prod
```

---

## 📁 Repository Structure

```
├── 3d-forge.sh          # CLI generator engine (FFmpeg frame slicer & procedural generator)
├── index.html           # Main Showcase Hub & in-page live studio simulator
├── vercel.json          # Clean URL routing & security headers
├── package.json         # Project metadata & build scripts
├── .gitignore           # Git ignore rules
├── dist-coffee/         # Flagship 01: RÖSTWERK (Coffee Roastery)
│   └── index.html
├── dist-burger/         # Flagship 02: SMASH // LAB (Wagyu Burger)
│   └── index.html
└── dist-camera/         # Flagship 03: LUCID ONE (61MP Camera Optics)
    └── index.html
```

---

## 👨‍💻 Author

**Hemant Engole**  
GitHub: [@knightriderisback](https://github.com/knightriderisback)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
