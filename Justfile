set dotenv-load

# Path to the drawio AppImage (only working on Linux)
drawio_path := env_var_or_default('DRAWIO_PATH', '~/Applications/drawio.AppImage')

container_runtime := env_var_or_default("CONTAINER_RUNTIME", "podman")

# Configure aliases
alias b := build
alias d := debug
alias c := clean

# Print all targets
@help:
    just -l

@_mkdir:
    mkdir -p ./data/images
    mkdir -p ./data/diagrams
    mkdir -p ./out

# Minify all images (requires `imagemin-cli`, `imagemin-pngquant`)
@minify-images:
    {{ container_runtime }} run --rm -v ./data/images:/images:Z funbox/optimizt:latest /images

# Convert all drawio files to pdf (requires `drawio` AppImage)
@drawio: _mkdir
    find ./data/diagrams -name *.drawio -exec rm -f ./data/diagrams/{}.pdf \; -exec {{ drawio_path }} --crop -x -o {}.pdf {} \;

# Build the document
@build: _mkdir
    latexmk --shell-escape -pdf -output-directory="out" -aux-directory="out" -pdflatex="pdflatex -interaction=nonstopmode" dokumentation.tex

# Build the document in debug mode
@debug: _mkdir
    latexmk --shell-escape -pdf -output-directory="out" -aux-directory="out" -pdflatex="pdflatex" -g dokumentation.tex

# Clean up auxiliary files
@clean:
    latexmk -output-directory="out" -aux-directory="out" -c
