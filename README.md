# 🗂️ Sitemap Generator

**Automatically discover and map your website structure.**

An open-source tool from **Meridian 127** that generates sitemaps by analyzing your website's structure. Essential for AI visibility and SEO optimization.

## ✨ Features

- **Automatic Sitemap Detection** — Finds and parses existing `sitemap.xml` files
- **Smart Web Crawling** — Falls back to automatic crawling if sitemap not found
- **Manual Mode** — Create custom site structures by hand
- **File Export** — Save results as `.txt` files with timestamp
- **Cross-Platform** — Works on macOS, Linux, and Windows (Git Bash)
- **Zero Dependencies** — Only uses `curl` and `grep` (pre-installed on most systems)

## 🎯 Why This Matters

A proper sitemap is fundamental for:
- **AI Understanding** — Helps LLMs (ChatGPT, Claude, Perplexity) discover your pages
- **Search Visibility** — Google, Bing, and other search engines need clear structure
- **SEO Optimization** — Well-organized sitemaps improve crawlability
- **Local Business Discovery** — Critical for local SEO and AI recommendations

This tool makes it simple to understand and document your site's architecture.

## 📋 Prerequisites

- **Bash** shell (macOS, Linux, or Git Bash on Windows)
- **curl** (for fetching URLs)
- **grep** (for parsing)

Most systems have these built-in. If not:

**macOS:**
```bash
brew install curl
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get install curl grep
```

**Windows:** Use Git Bash (comes with Git)

## 🚀 Installation

### Option 1: Clone from GitHub (Recommended)

```bash
git clone https://github.com/Meridian-127/sitemap-generator
cd sitemap-generator
chmod +x sitemap-generator.sh
```

### Option 2: Download Directly

```bash
curl -O https://raw.githubusercontent.com/Meridian-127/sitemap-generator/main/sitemap-generator.sh
chmod +x sitemap-generator.sh
```

## 📖 Usage

### Start the Program

```bash
./sitemap-generator.sh
```

You'll see a menu with three options:

```
╔════════════════════════════════════════╗
║     🗂️  SITEMAP GENERATOR              ║
║     Générateur de structure web        ║
╚════════════════════════════════════════╝

Choisissez une option:
1. Analyser un site (auto)
2. Créer manuellement
3. Quitter

Option (1-3):
```

### Option 1: Analyze a Website (Automatic)

```bash
Option (1-3): 1
URL du site (ex: exemple.com ou https://exemple.com): myhotel.com
```

The script will:
1. ✅ Search for `sitemap.xml`
2. ✅ If found, parse it and display all pages
3. ✅ If not found, automatically crawl the site
4. ✅ Save results to a file
5. ✅ Display on screen

**Example Output:**
```
ℹ Recherche du sitemap.xml...
✓ Sitemap trouvé!
ℹ Parsing du sitemap...

SITEMAP: myhotel.com
Source: https://myhotel.com/sitemap.xml
Date: Sun Feb 15 14:30:45 CET 2026
─────────────────────────────────────────

  📄 /
  📄 /rooms
  📄 /restaurant
  📄 /contact
  📄 /booking
```

**Save to File:**
```
Sauvegarder dans un fichier? (o/n): o
Nom du fichier (défaut: sitemap_20260215_143022.txt): 
✓ Sauvegardé dans: /Users/username/sitemap_20260215_143022.txt
```

### Option 2: Create Manually

```bash
Option (1-3): 2
Nom du site: My Hotel
```

Then enter your site structure (press `Ctrl+D` when done):

```
Accueil
Rooms
- Standard
- Deluxe
- Suite
Restaurant
Services
- Spa
- Gym
Contact
```

**Output:**
```
SITEMAP: My Hotel
─────────────────────────────────────────

Accueil
Rooms
- Standard
- Deluxe
- Suite
Restaurant
Services
- Spa
- Gym
Contact
```

### Option 3: Exit

```bash
Option (1-3): 3
```

Closes the program.

## 🎯 Examples

### Analyze a Hotel Website

```bash
./sitemap-generator.sh
# Choose: 1
# Enter: myhotel.com
# Wait for results
```

### Analyze a Restaurant

```bash
./sitemap-generator.sh
# Choose: 1
# Enter: myrestaurant.ch
# Get instant structure
```

### Create a Manual Sitemap

```bash
./sitemap-generator.sh
# Choose: 2
# Enter: My Business
# Type your structure
```

## 📁 Output Files

Files are saved in your current directory with timestamp:

```
sitemap_20260215_143022.txt
sitemap_20260215_143045.txt
sitemap_20260215_143100.txt
```

Manage your files:

```bash
# List all sitemap files
ls sitemap*.txt

# View a file
cat sitemap_20260215_143022.txt

# Open in editor
nano sitemap_20260215_143022.txt
```

## 📋 File Format

Output format is simple and readable:

```
SITEMAP: example.com
Source: https://example.com/sitemap.xml
Date: Sun Feb 15 14:30:45 CET 2026
─────────────────────────────────────────

  📄 /
  📄 /about
  📄 /services
  📄 /contact
```

Perfect for:
- Documentation
- Team sharing
- Spreadsheet import
- Presentation purposes
- AI optimization planning

## 🔧 Troubleshooting

### "Command not found: ./sitemap-generator.sh"

Make sure the file is executable:
```bash
chmod +x sitemap-generator.sh
```

### "URL vide!" Error

You must enter a valid URL:
- ✅ `google.com`
- ✅ `https://github.com`
- ✅ `wikipedia.org`

### Crawling Takes Too Long

Some sites are slow. Try:
1. Check your internet connection
2. Use a shallower crawl depth (1 instead of 2)
3. Try the site's official `sitemap.xml` first

### "Sitemap.xml non trouvé"

If automatic crawling fails:
1. Use **Option 2** (manual mode) to create your structure
2. Check if the site allows crawling (check `robots.txt`)
3. Try with `https://` prefix

## 💼 For Meridian 127 Clients

This tool is part of our commitment to **transparency** and helping you understand your website's structure.

A well-organized sitemap is the foundation of:
- ✅ AI visibility (schema.org, JSON-LD)
- ✅ Search engine optimization
- ✅ User experience
- ✅ Content strategy

**Next step:** Use our **AI Visibility Audit Tool** to optimize your structure for AI discovery.

## 📚 Learn More

- **Schema.org Documentation:** https://schema.org
- **Google Search Central:** https://developers.google.com/search
- **Sitemap Protocol:** https://www.sitemaps.org
- **Meridian 127:** https://meridian127.com
- **AI Visibility Audit Tool:** https://github.com/Meridian-127/ai-visibility-audit

## 🤝 Contributing

Found a bug or have an idea?

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## 📄 License

MIT License — Use freely, modify, and share.

Copyright (c) 2025 Meridian 127

## 🙌 About Meridian 127

We help local businesses become visible to AI systems like ChatGPT, Claude, and Perplexity.

In today's world, **if AI can't see you, your customers can't find you**.

We provide tools and strategies to optimize your digital presence for the AI-first future.

**Discover your AI visibility:** https://meridian127.com

---

**Made with precision and expertise by Meridian 127**

*Precision suisse. Exigence française. Impact global.*

```bash
# Get started in seconds
./sitemap-generator.sh
```
