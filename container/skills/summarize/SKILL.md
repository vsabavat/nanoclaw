---
name: summarize
description: Summarize URLs, local files, PDFs, images, audio, and YouTube videos using the summarize CLI. Use whenever you need to quickly read or condense web pages, documents, or media — don't wait for the user to ask explicitly.
allowed-tools: Bash(summarize:*)
---

# summarize CLI

Fast, media-aware summarization from URLs, files, PDFs, images, audio/video, and YouTube.

## Quick start

```bash
summarize "https://example.com"
summarize "/path/to/file.pdf"
summarize "/path/to/audio.mp3"
echo "some text" | summarize -
```

## Length control

```bash
summarize "https://..." --length short    # ~900 chars
summarize "https://..." --length medium   # ~1800 chars (default)
summarize "https://..." --length long     # ~4200 chars
summarize "https://..." --length xl       # ~9000 chars
summarize "https://..." --length 5000     # custom char target
```

## Output formats

```bash
summarize "https://..." --format text      # plain text (default)
summarize "https://..." --format markdown  # Markdown with structure
summarize "https://..." --json             # JSON with metadata + content
```

## Extract without summarizing

```bash
summarize "https://..." --extract          # raw extracted content only
summarize "https://..." --extract --format markdown  # extracted as Markdown
```

## Pipe / stdin

```bash
cat /path/to/document.txt | summarize -
cat /path/to/file.pdf | summarize -        # binary also works
```

## Supported inputs

- Web URLs (`https://...`)
- Local files: PDFs, `.txt`, `.md`, `.json`, images (`jpg/png/webp/gif`), audio/video (`mp3/mp4/wav/m4a/webm`)
- YouTube URLs (`youtube.com`, `youtu.be`) — transcript-first, falls back to audio transcription
- Podcast RSS feeds
- Stdin (`-`)

## Useful flags

```bash
summarize "..." --force-summary               # always run LLM even for short content
summarize "..." --no-cache                    # skip cache
summarize "..." --plain                       # no progress indicators (for scripts)
```

## Notes

- Uses `cli/claude` as backend — reuses the agent's existing auth, no extra API keys needed
- Short content shorter than requested length is returned as-is (no LLM call)
- Use `--extract` when you need the raw text of a page, not a summary
