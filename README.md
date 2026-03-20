# UX Survey Analysis Skill for Claude Code

An autonomous UX research analyst that runs 4-step survey analysis directly in Claude Code.

## What it does

Given a CSV of survey responses, the skill:

1. **Open Coding** — reads all responses, creates a codebook with mutually exclusive codes, assigns one code per response
2. **Intensity Rating** — rates each response 1–5 (soft → vocal detractor) with calibration examples
3. **Verification & Audit** — re-checks 10 random codes, audits all high-intensity ratings, recounts frequencies
4. **Final Report** — executive summary, drivers with quotes, high-risk segment, quick wins vs. systemic issues, next steps

Saves a complete markdown report to `output/YYYY-MM-DD-survey-report.md`.

## Install

**Option 1: Direct install from GitHub (no cloning needed)**

```bash
# Project-level (recommended)
mkdir -p .claude/commands && curl -o .claude/commands/ux-survey.md \
  https://raw.githubusercontent.com/zues/ux-survey-skill/main/commands/ux-survey.md

# Or user-level (available in all projects)
mkdir -p ~/.claude/commands && curl -o ~/.claude/commands/ux-survey.md \
  https://raw.githubusercontent.com/zues/ux-survey-skill/main/commands/ux-survey.md
```

**Option 2: Clone and install**

```bash
git clone https://github.com/zues/ux-survey-skill.git
cd ux-survey-skill
bash install.sh
```

**Option 3: Manual copy**

```bash
# Project-level (recommended)
cp commands/ux-survey.md .claude/commands/ux-survey.md

# Or user-level (available in all projects)
cp commands/ux-survey.md ~/.claude/commands/ux-survey.md
```

## Folder structure

Set up your survey data like this:

```
surveys/
├── input/
│   └── my-survey-data.csv      ← your CSV file
├── context.md                   ← product context (see template)
└── output/                      ← reports saved here automatically
```

Copy `context-template.md` to `surveys/context.md` and fill it in. The agent reads this before every analysis to understand your product.

## Usage

```
/ux-survey /path/to/surveys/input/my-survey-data.csv
```

The agent will:
1. Derive all paths from the CSV location
2. Load and confirm product context
3. Run all 4 steps autonomously
4. Save the report

## Requirements

- Claude Code CLI
- Python 3 (used for calculations via Bash)

## CSV format

Any CSV with survey responses works. The agent will detect columns automatically and ask you to confirm. Open-text response columns are analyzed; multiple-choice columns are counted.
