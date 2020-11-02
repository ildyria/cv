XELATEX = xelatex

.PHONY: clean cv.pdf

cv.pdf: 
	${XELATEX} cv.tex

build:
	mkdir build

deploy: build
	mv cv.pdf build/cv.pdf
	cp index.html build/index.html

clean:
	@echo cleaning...
	@rm *.aux 2> /dev/null || true
	@rm *.log 2> /dev/null || true
	@rm *.out 2> /dev/null || true
	@rm *.toc 2> /dev/null || true
	@rm *.snm 2> /dev/null || true
	@rm *.nav 2> /dev/null || true
	@rm *.vrb 2> /dev/null || true
	@rm *.bbl 2> /dev/null || true
	@rm *.blg 2> /dev/null || true
	@rm *.idx 2> /dev/null || true
	@rm *.lol 2> /dev/null || true
	@rm *.fls 2> /dev/null || true
	@rm *.fdb_latexmk 2> /dev/null || true
	@rm -fr build  2> /dev/null || true
