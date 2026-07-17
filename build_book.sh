#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD="$ROOT/build"

mkdir -p "$BUILD"
rm -f "$BUILD/Forvaltningsret.aux" \
      "$BUILD/Forvaltningsret.log" \
      "$BUILD/Forvaltningsret.out" \
      "$BUILD/Forvaltningsret.toc" \
      "$BUILD/Forvaltningsret-final.aux" \
      "$BUILD/Forvaltningsret-final.log" \
      "$BUILD/Forvaltningsret-final.out" \
      "$BUILD/Forvaltningsret-final.pdf" \
      "$BUILD/Forvaltningsret-final.tex" \
      "$BUILD/Forvaltningsret-final.toc" \
      "$BUILD/Forvaltningsret.pdf"
cd "$ROOT"

pandoc manuscript.md \
  --from=markdown+raw_tex+pipe_tables+strikeout+autolink_bare_uris \
  --to=latex \
  --standalone \
  --number-sections \
  --top-level-division=chapter \
  --template="$ROOT/template.tex" \
  --metadata=lang:da \
  -o "$BUILD/Forvaltningsret.tex"

# Pandoc emits \def\LTcaptype{none}, which breaks recent longtable.
python3 "$ROOT/fix_latex.py" "$BUILD/Forvaltningsret.tex"

xelatex -interaction=nonstopmode -halt-on-error -jobname=Forvaltningsret-final -output-directory="$BUILD" "$BUILD/Forvaltningsret.tex"
xelatex -interaction=nonstopmode -halt-on-error -jobname=Forvaltningsret-final -output-directory="$BUILD" "$BUILD/Forvaltningsret.tex"

cp "$BUILD/Forvaltningsret-final.pdf" "$ROOT/Forvaltningsret_Scott_Brodie_Forsyth.pdf"
cp "$BUILD/Forvaltningsret-final.pdf" "$BUILD/Forvaltningsret.pdf"
printf 'Built %s\n' "$ROOT/Forvaltningsret_Scott_Brodie_Forsyth.pdf"
