DIRS := $(wildcard */ )
SKIP := build img out
NO_SLASH := $(DIRS:/=)
NO_SLASH := $(filter-out $(SKIP),$(NO_SLASH))

all: $(NO_SLASH)

$(NO_SLASH):
	@cd $@; latexmk -pdf $@.tex -f 


zip: all
	@mkdir -p out
	for f in $(NO_SLASH); do cp $f/$f.pdf out/$f.pdf; done
	zip -r out out

clean:
	rm -rf out/
	rm -rf out.zip

.PHONY: all zip clean $(NO_SLASH)
