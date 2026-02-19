# resume-latex

My personal resume, written in LaTeX with a modular build system that compiles multiple tailored versions from shared source files.

---

## How It Works

### Structure

```
resume-latex/
├── Makefile
├── shared/                  # Common content across all resumes
│   ├── preamble.tex         # Packages, formatting, custom commands
│   ├── heading.tex          # Name, contact info, availability
│   ├── education.tex        # Education section
│   ├── skills.tex           # Technical skills section
│   └── interests.tex        # Interests and additional skills
├── resume-games/            # Game development focused resume
│   ├── main.tex             # Entry point, inputs shared + local files
│   ├── main_default.tex     # Wrapper: compiles with short URLs
│   ├── main_fullurls.tex    # Wrapper: compiles with full URLs
│   ├── experience.tex       # Resume-specific experience
│   └── projects.tex         # Resume-specific projects
├── resume-games-ai/         # Game dev + AI focused resume
│   └── ...
└── resume-web-ai/           # Web development + AI focused resume
    └── ...
```

### URL Variants

Each resume compiles into two variants using a LaTeX boolean flag:

- **Default** (`main_default.tex`) — LinkedIn and GitHub show as `LinkedIn` and `GitHub` for ATS-friendly submissions
- **Full URLs** (`main_fullurls.tex`) — Shows full URLs like `linkedin.com/in/santiordon` for printed or portfolio copies

The wrapper files set `\showfullurlfalse` or `\showfullurltrue` before inputting `main.tex`, which controls the output via an `\ifshowfullurl` block in `preamble.tex`.

---

## Building

### Prerequisites

- [BasicTeX](https://www.tug.org/mactex/morepackages.html) (or any TeX Live distribution)
- `latexmk`

Install on macOS:
```bash
brew install --cask basictex
tlmgr install latexmk enumitem titlesec fancyhdr babel preprint collection-fontsrecommended marvosym
```

Install on Windows:
1. Download and install [MiKTeX](https://miktex.org/download)
2. During installation, set "Install missing packages on-the-fly" to **Yes**
3. Install `make` via [Chocolatey](https://chocolatey.org/):
```powershell
choco install make
```
4. MiKTeX will automatically download any missing LaTeX packages on first compile, so no manual `tlmgr` installs are needed.

### Commands

```bash
make both      # Compile all 6 variants (3 resumes × 2 URL styles)
make all       # Compile all 3 default variants
make fullurl   # Compile all 3 full URL variants
make clean     # Remove all auxiliary and output files

# Individual resumes
make games
make games-full
make games-ai
make games-ai-full
make web-ai
make web-ai-full
```

All output PDFs are placed in the `output/` directory.

---

## Modifying

- **Shared content** (education, skills, heading): edit files in `shared/`
- **Resume-specific content**: edit `experience.tex` or `projects.tex` in the relevant resume folder
- **Adding a new resume**: create a new folder with `main.tex`, `main_default.tex`, `main_fullurls.tex`, `experience.tex`, and `projects.tex`, then add it to the `DIRS` variable in the `Makefile`

---

## Based On

[Jake's Resume Template]([https://github.com/sb2nov/resume](https://www.overleaf.com/latex/templates/jakes-resume/syzfjbzwjncs)) by Jake Gutierrez, licensed under MIT.
