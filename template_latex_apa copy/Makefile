all: 
	biber --output-directory out/ dokumentation
	pdflatex -interaction=nonstopmode -output-directory=out/ dokumentation.tex
debug:
	biber --output-directory out/ dokumentation
	pdflatex -output-directory=out/ dokumentation.tex
clean:
	rm out/*