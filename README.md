# DHBW Latex Template

This project includes a version of the DHBW template for LaTeX. You can use either `APA` or `IEEE` style (need to be
configured inside the `ads/header.tex` file).

## Usage

> :bulb: This project requires a working LaTeX installation. I recommend using [TeX Live](https://www.tug.org/texlive/).
> Additionally you need to install [just](https://github.com/casey/just) to run the build commands.

Within the root directory a `Justfile` is provided. You can use the following commands:

- `just` or `just help`: Show all available commands
- `just build` or `just build`: Build the document

If you are using Linux you can also benifit from the `just drawio` command. This command will convert all `.drawio`
files to `.pdf` files. You will need to install the
[Draw.io AppImage](https://github.com/jgraph/drawio-desktop/releases).

## Contributors

| Name           | Email                                                                         |
| -------------- | ----------------------------------------------------------------------------- |
| Felix Hoffmann | [felix.emmanuel.hoffmann@gmail.com](mailto:felix.emmanuel.hoffmann@gmail.com) |
