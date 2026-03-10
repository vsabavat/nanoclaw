#!/bin/bash
set -e
cd /app && npx tsc --outDir /tmp/dist 2>&1 >&2
ln -s /app/node_modules /tmp/dist/node_modules
chmod -R a-w /tmp/dist
cat > /tmp/input.json
# Cache ANTHROPIC_API_KEY to a private file so the summarize wrapper can inject it
# for cli/claude runs without exposing it in the general bash env
node -e "try{const d=JSON.parse(require('fs').readFileSync('/tmp/input.json','utf8'));const k=(d.secrets||{}).ANTHROPIC_API_KEY||'';if(k){require('fs').writeFileSync('/tmp/.sk',k,{mode:0o600})}}catch(e){}" 2>/dev/null||true
node /tmp/dist/index.js < /tmp/input.json
