#!/bin/bash

# Create a temporary file
temp_file=$(mktemp)

# Run awk and output to the temporary file
awk '
  /\\newcommand{\\GREENSTARTS}/ { greenstarts_defined=1 }
  /\\newcommand{\\GREENENDS}/ { greenends_defined=1 }
  /\\GREENSTARTS/ {
    if (greenstarts_defined) {
      green_nesting_level++
    }
  }
  /\\GREENENDS/ {
    if (greenends_defined && green_nesting_level > 0) {
      green_nesting_level--
    } else {
      # Skip printing this line if GREENENDS is not properly nested
      next
    }
  }
  { print }
' ./diff.tex > "$temp_file"

# # Run awk and output to the temporary file
# awk '
#   /\\newcommand{\\GREENSTARTS}/ { found_greenstarts=1 }
#   /\\newcommand{\\GREENENDS}/ { found_greenends=1 }
#   /\\newcommand{\\REDSTARTS}/ { found_redstarts=1 }
#   /\\newcommand{\\REDENDS}/ { found_redends=1 }
#   !found_greenstarts && /\\GREENSTARTS/ { next }
#   !found_greenends && /\\GREENENDS/ { next }
#   !found_redstarts && /\\REDSTARTS/ { next }
#   !found_redends && /\\REDENDS/ { next }
#   { print }
# ' ./diff.tex > "$temp_file"


# Replace the original file with the temporary file
mv "$temp_file" ./diff.tex

## EOF


# No, it does not work. if GREENSTARTS is tagged before their definition, it will corrupse.

# So, all pairs of GREENSTARTS and GREENENDS should be coupled approprietly below their definition lines.

# Now, it's devastating: GREENENDS can remain even when GREENSTARTS is not tagged yet. fix the above shell script (awk command)

# %% Diff
# \usepackage{xcolor}
# % Define commands for highlighting
# % diff
# \usepackage[most]{tcolorbox} % for boxes with transparency
# % Define colors with transparency (opacity value)
# \definecolor{GreenBG}{rgb}{0,1,0}
# \definecolor{RedBG}{rgb}{1,0,0}

# % Define tcolorbox environments for highlighting
# \newtcbox{\greenhighlight}[1][]{%
#   on line,
#   colframe=GreenBG,
#   colback=GreenBG!50!white, % 50% transparent green
#   boxrule=0pt,
#   arc=0pt,
#   boxsep=0pt,
#   left=1pt,
#   right=1pt,
#   top=2pt,
#   bottom=2pt,
#   tcbox raise base
# }

# \newtcbox{\redhighlight}[1][]{%
#   on line,
#   colframe=RedBG,
#   colback=RedBG!50!white, % 50% transparent red
#   boxrule=0pt,
#   arc=0pt,
#   boxsep=0pt,
#   left=1pt,
#   right=1pt,
#   top=2pt,
#   bottom=2pt,
#   tcbox raise base
# }

# \newcommand{\REDSTARTS}{\color{red}}
# \newcommand{\REDENDS}{\color{black}}
# \newcommand{\GREENSTARTS}{\color{green}}
# \newcommand{\GREENENDS}{\color{black}}

# % % Uncomment or provide the original definitions for these commands
# % \newcommand{\REDSTARTS}{\color{red}}
# % \newcommand{\REDENDS}{\color{black}} % Switch back to the default text color
# % \newcommand{\GREENSTARTS}{\color{green}}
# % \newcommand{\GREENENDS}{\color{black}} % Switch back to the default text color

# % % Redefine the highlighting commands to use the tcolorbox environments
# % \renewcommand{\REDSTARTS}{\begingroup\colorlet{oldcolor}{.}\color{red}}
# % \renewcommand{\REDENDS}{\color{oldcolor}\endgroup}
# % \renewcommand{\GREENSTARTS}{\begingroup\colorlet{oldcolor}{.}\color{green}}
# % \renewcommand{\GREENENDS}{\color{oldcolor}\endgroup}

# % % Define a command to apply the tcolorbox highlighting
# % \newcommand{\highlight}[2]{\tcbox[colframe=#1,colback=#1!50!white,on line]{#2}}

# % % Use the new \highlight command within the redefined \REDSTARTS and \GREENSTARTS
# % \renewcommand{\REDSTARTS}{\highlight{RedBG}}
# % \renewcommand{\GREENSTARTS}{\highlight{GreenBG}}


# \GREENENDS 

