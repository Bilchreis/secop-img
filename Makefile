DIRS := $(wildcard */ )
SKIP := build img out libs
NO_SLASH := $(DIRS:/=)
NO_SLASH := $(filter-out $(SKIP),$(NO_SLASH))

all: $(NO_SLASH)

$(NO_SLASH):
	@cd $@; TEXINPUTS=../libs//: latexmk -pdf $@.tex -f


out: all
	@mkdir -p out
	for f in $(NO_SLASH) ; do cp $$f/$$f.pdf out/$$f.pdf; done

zip: out
	zip -r out out

clean:
	rm -rf out/
	rm -rf out.zip

.PHONY: all out zip clean $(NO_SLASH)
