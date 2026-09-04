#!/usr/bin/env bash
# Renders _og/og.html to assets/og.png at 1200x630, the size link previews want.
# Edit og.html, run this, commit both. Chrome does the rendering so the web
# fonts resolve exactly as they do on the site.
set -euo pipefail
cd "$(dirname "$0")/.."
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
"$CHROME" --headless=new --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 --window-size=1200,630 \
  --virtual-time-budget=6000 \
  --screenshot="assets/og.png" "file://$PWD/_og/og.html" 2>/dev/null
echo "wrote assets/og.png"
