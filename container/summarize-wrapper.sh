#!/bin/bash
# Inject ANTHROPIC_API_KEY for cli/claude backend without exposing it in the
# general bash env (the agent hook strips it from all bash subprocesses)
if [ -z "$ANTHROPIC_API_KEY" ] && [ -f /tmp/.sk ]; then
  export ANTHROPIC_API_KEY=$(cat /tmp/.sk 2>/dev/null)
fi
exec summarize-real "$@"
