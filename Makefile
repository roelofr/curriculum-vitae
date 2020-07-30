.PHONY: clean images

curriculum-vitae.pdf: curriculum-vitae.tex
	test -d ./build || mkdir build
	latexmk \
		-auxdir=./build \
		-outdir=./build \
		-lualatex \
		-quiet \
		curriculum-vitae.tex
	mv build/curriculum-vitae.pdf curriculum-vitae.pdf

motivatiebrief.pdf: motivatiebrief.tex
	test -d ./build || mkdir build
	latexmk \
		-auxdir=./build \
		-outdir=./build \
		-lualatex \
		-quiet \
		motivatiebrief.tex
	mv build/motivatiebrief.pdf motivatiebrief.pdf

clean:
	latexmk \
		-auxdir=./build \
		-outdir=./build \
		-CA \
		curriculum-vitae.tex

images:
	for file in images/*.svg; \
	do \
		echo processing \'$$file\'; \
		inkscape -D $$file --export-pdf=$${file%.*}.pdf; \
	done
