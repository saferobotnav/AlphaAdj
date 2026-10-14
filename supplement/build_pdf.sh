#!/usr/bin/env bash
# Render AlphaAdj_supplementary_material.html to static/docs/AlphaAdj_supplementary_material.pdf
# with headless Chrome. Run from any directory.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
out="$here/../static/docs/AlphaAdj_supplementary_material.pdf"
profile="$(mktemp -d)"
trap 'rm -rf "$profile"' EXIT
mkdir -p "$(dirname "$out")"
"${CHROME:-google-chrome}" --headless --disable-gpu --no-sandbox \
  --user-data-dir="$profile" \
  --no-pdf-header-footer --print-to-pdf-no-header \
  --print-to-pdf="$out" \
  "file://$here/AlphaAdj_supplementary_material.html"
echo "Wrote $out"
