# DHBW Latex Template

This project includes a version of the DHBW template for LaTeX. You can use either `APA` or `IEEE` style.

## Usage

Within the root directory a `Makefile` is provided. You can use the following commands:

- `make check-service` to check if docker or podman is installed and available
- `make` or `make build` to build the document
- `make clean` to clean the build directory

All the commands are using the `texlive` docker image Therefore, you dont need to install `texlive` on your machine, as
the docker image includes all the necessary packages and tools.

## VSCode

If you are using VSCode and `docker`, you can use the following settings inside your `.vscode/settings.json`:

```json
{
  "editor.formatOnSave": true,
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.latex.outDir": "out/latex",
  "[tex]": {
    "editor.defaultFormatter": "James-Yu.latex-workshop"
  },
  "[bibtex]": {
    "editor.defaultFormatter": "James-Yu.latex-workshop"
  },
  "latex-workshop.latex.recipes": [
    {
      "name": "latexmk",
      "tools": ["latexmk"]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "latexmk",
      "command": "latexmk",
      "args": ["-pdf", "-outdir=out/latex", "%DOC%"],
      "env": {}
    }
  ],
  "latex-workshop.docker.enabled": true,
  "latex-workshop.docker.image.latex": "texlive/texlive:latest"
}
```

This will automatically build your document on save and format it using the `latex-workshop` extension and the `texlive`
docker image.

## Contributors

| Name           | Email                                                                         |
| -------------- | ----------------------------------------------------------------------------- |
| Felix Hoffmann | [felix.emmanuel.hoffmann@gmail.com](mailto:felix.emmanuel.hoffmann@gmail.com) |
