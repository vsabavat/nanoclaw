---
name: gog
description: Google Workspace CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs. Use for reading/sending emails, managing calendar events, searching Drive, reading/writing Sheets, and exporting Docs. Prefer this over the Gmail MCP for quick reads and searches.
allowed-tools: Bash(gog:*)
---

# gog — Google Workspace CLI

Fast, JSON-friendly CLI for Gmail, Calendar, Drive, Contacts, Sheets, and Docs.

Default account: `vasanth.sabavat@gmail.com`

## Gmail

```bash
gog gmail list "in:inbox newer_than:1d" --limit 10       # Recent inbox
gog gmail list "from:someone@example.com" --limit 5      # Filter by sender
gog gmail list "subject:invoice" --limit 10
gog gmail get <messageId>                                  # Full message
gog gmail get <messageId> --body                          # Body only
gog gmail send --to user@example.com --subject "Title" --body "Message"
gog gmail send --to a@b.com --subject "Re: X" --body "..." --thread <threadId>
```

## Calendar

```bash
gog calendar list                                          # List calendars
gog calendar events primary --from 2026-03-07 --to 2026-03-14  # This week
gog calendar events <calendarId> --from <iso> --to <iso>
gog calendar create primary --summary "Meeting" --start 2026-03-10T14:00:00 --end 2026-03-10T15:00:00
```

## Drive

```bash
gog drive search "quarterly report" --limit 10
gog drive search "type:spreadsheet name:budget" --limit 5
gog drive get <fileId>                                    # File metadata
gog drive download <fileId> --out /tmp/file.pdf
```

## Contacts

```bash
gog contacts list --limit 20
gog contacts search "Alice"
gog contacts get <resourceName>
```

## Sheets

```bash
gog sheets get <sheetId> "Sheet1!A1:D10"                 # Read range
gog sheets get <sheetId> "Sheet1!A1:D10" --json          # JSON output
gog sheets metadata <sheetId> --json                     # Sheet info
gog sheets update <sheetId> "Sheet1!A1:B2" --values-json '[["A","B"],["1","2"]]'
gog sheets append <sheetId> "Sheet1!A:C" --values-json '[["x","y","z"]]'
gog sheets clear <sheetId> "Sheet1!A2:Z"
```

## Docs

```bash
gog docs cat <docId>                                      # Read doc text
gog docs export <docId> --format txt --out /tmp/doc.txt  # Export to file
gog docs export <docId> --format pdf --out /tmp/doc.pdf
```

## Tips

- Use `--json` for machine-readable output
- Use `--limit` to control result count
- Sheet IDs and Doc IDs come from the URL (the long alphanumeric string)
- Calendar IDs: `primary` works for the main calendar
