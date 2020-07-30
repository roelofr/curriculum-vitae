.PHONY: clean

curriculum-vitae.pdf: curriculum-vitae.tex
	test -d ./build || mkdir build
	latexmk \
		-auxdir=./build \
		-outdir=./build \
		-pdf \
		-quiet \
		curriculum-vitae.tex
	mv build/curriculum-vitae.pdf curriculum-vitae.pdf

clean:
	latexmk \
		-auxdir=./build \
		-outdir=./build \
		-CA \
		curriculum-vitae.tex
