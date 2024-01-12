#!/bin/bash

# Create a temporary file
temp_file=$(mktemp)


# Run awk and output to the temporary file
awk '
  /\\newcommand{\\GREENSTARTS}/ { found_greenstarts=1 }
  /\\newcommand{\\GREENENDS}/ { found_greenends=1 }
  /\\newcommand{\\REDSTARTS}/ { found_redstarts=1 }
  /\\newcommand{\\REDENDS}/ { found_redends=1 }
  !found_greenstarts && /\\GREENSTARTS/ { next }
  !found_greenends && /\\GREENENDS/ { next }
  !found_redstarts && /\\REDSTARTS/ { next }
  !found_redends && /\\REDENDS/ { next }
  { print }
' ./diff.tex > "$temp_file"


# Replace the original file with the temporary file
mv "$temp_file" ./diff.tex

## EOF
