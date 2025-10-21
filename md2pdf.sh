#!/bin/bash

# Check if a file was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <markdown-file.md>"
    echo "Example: $0 resume/brandon-murphy-resume.md"
    exit 1
fi

file="$1"

# Check if file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run setup to check/install dependencies
if [ -f "$SCRIPT_DIR/setup.sh" ]; then
    # Run setup in quiet mode (only show if something needs to be installed)
    source "$SCRIPT_DIR/setup.sh" --quiet
    if [ $? -ne 0 ]; then
        echo "Error: Failed to setup dependencies"
        exit 1
    fi
else
    echo "Warning: setup.sh not found, skipping dependency check"
fi

echo ""

# Get the directory and filename
dir=$(dirname "$file")
filename=$(basename "$file" .md)

echo "Converting: $file"

# Create temporary CSS file for font styling
css_file="${dir}/.resume-style.css"
cat > "$css_file" << 'EOF'
body {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11pt;
}
h1, h2, h3, h4, h5, h6 {
    font-family: Arial, Helvetica, sans-serif;
}
/* Prevent page breaks right after section headers */
h2, h3 {
    page-break-after: avoid;
    break-after: avoid;
}
/* Try to keep job sections together */
h3 {
    page-break-before: auto;
    break-before: auto;
}
/* Avoid orphans and widows */
p, li {
    orphans: 3;
    widows: 3;
}
ul {
    list-style-type: disc;
    margin-left: 1.5em;
    padding-left: 0;
    page-break-inside: avoid;
    break-inside: avoid-page;
}
li {
    margin-bottom: 0.3em;
}
/* Try to avoid breaking bold subsection headers */
strong {
    page-break-after: avoid;
    break-after: avoid;
}
EOF

# Try weasyprint first (Python-based, no LaTeX required)
if command -v weasyprint &> /dev/null; then
    pandoc "$file" -f markdown -o "${dir}/${filename}.pdf" --pdf-engine=weasyprint --css="$css_file" -V margin-left=0.5in -V margin-right=0.5in -V margin-top=0.5in -V margin-bottom=0.5in
# Fall back to pdflatex if available
elif command -v pdflatex &> /dev/null; then
    pandoc "$file" -f markdown -o "${dir}/${filename}.pdf" --pdf-engine=pdflatex -V geometry:margin=0.5in
# Try xelatex if available
elif command -v xelatex &> /dev/null; then
    pandoc "$file" -f markdown -o "${dir}/${filename}.pdf" --pdf-engine=xelatex -V geometry:margin=0.5in
# Try without specifying engine
else
    pandoc "$file" -f markdown -o "${dir}/${filename}.pdf" -V geometry:margin=0.5in
fi

if [ $? -eq 0 ]; then
    echo "✓ Created: ${dir}/${filename}.pdf"
else
    echo "✗ Failed to convert: $file"
    echo "  Install weasyprint for better results:"
    echo "  brew install weasyprint"
fi

# Clean up temporary CSS file
rm -f "$css_file"

