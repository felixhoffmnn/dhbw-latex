SERVICE := $(shell command -v docker 2> /dev/null || command -v podman 2> /dev/null)

.PHONY: check-service build clean
.DEFAULT_GOAL := build

check-service:
	@echo "Using $(SERVICE) as the service."

build:
	@echo "Building the document..."
	$(SERVICE) run --rm -v $(CURDIR):/data:rw,z -v $(CURDIR)/out/:/data/out:rw,z -w /data texlive/texlive:latest latexmk -pdf -synctex=1 -shell-escape -interaction=nonstopmode dokumentation.tex

clean:
	@echo "Cleaning up..."
	$(SERVICE) run --rm -v $(CURDIR):/data:rw,z -v $(CURDIR)/out/:/data/out:rw,z -w /data texlive/texlive:latest latexmk -c
