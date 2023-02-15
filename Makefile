all: 
	mkdir -p out
	biber --output-directory out/ dokumentation
	pdflatex -interaction=nonstopmode -output-directory=out/ dokumentation.tex
debug:
	mkdir -p out
	biber --output-directory out/ dokumentation
	pdflatex -output-directory=out/ dokumentation.tex
clean:
	rm -r out
