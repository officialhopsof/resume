#!/bin/bash

# Resume PDF Generation Setup Script
# This script installs the necessary dependencies for md2pdf.sh

# Check if running in quiet mode
QUIET_MODE=false
if [ "$1" = "--quiet" ]; then
    QUIET_MODE=true
fi

# Print message only if not in quiet mode
print_msg() {
    if [ "$QUIET_MODE" = false ]; then
        echo "$1"
    fi
}

# Print message always (for installations)
print_always() {
    echo "$1"
}

print_msg "=== Resume PDF Generation Setup ==="
print_msg ""
print_msg "This script will install the required dependencies:"
print_msg "  - pandoc: Universal document converter"
print_msg "  - weasyprint: HTML to PDF renderer"
print_msg ""

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    print_always "Error: Homebrew is not installed."
    print_always "Please install Homebrew first:"
    print_always "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    return 1 2>/dev/null || exit 1
fi

print_msg "✓ Homebrew is installed"
print_msg ""

# Install pandoc
if command -v pandoc &> /dev/null; then
    print_msg "✓ pandoc is already installed ($(pandoc --version | head -n1))"
else
    print_always "Installing pandoc..."
    brew install pandoc
    if [ $? -eq 0 ]; then
        print_always "✓ pandoc installed successfully"
    else
        print_always "✗ Failed to install pandoc"
        return 1 2>/dev/null || exit 1
    fi
fi

print_msg ""

# Install weasyprint
if command -v weasyprint &> /dev/null; then
    print_msg "✓ weasyprint is already installed ($(weasyprint --version))"
else
    print_always "Installing weasyprint..."
    brew install weasyprint
    if [ $? -eq 0 ]; then
        print_always "✓ weasyprint installed successfully"
    else
        print_always "✗ Failed to install weasyprint"
        return 1 2>/dev/null || exit 1
    fi
fi

print_msg ""
print_msg "=== Setup Complete! ==="
print_msg ""
print_msg "You can now use md2pdf.sh to convert markdown files to PDF:"
print_msg "  ./md2pdf.sh path/to/your-file.md"
print_msg ""
print_msg "Example:"
print_msg "  ./md2pdf.sh tilt/brandon-murphy-resume.md"

