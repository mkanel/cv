LC = xelatex
PDFREADER = xreader
BUILD_DIR = bin
LFLAGS = -file-line-error -halt-on-error -output-directory=$(BUILD_DIR)

CV_NAME = maria_kaneli_cv

all: build cv aux_rm view

# CV
cv: build
	($(LC) $(LFLAGS) $(CV_NAME).tex)

view: cv
	-$(PDFREADER) bin/$(CV_NAME).pdf&

#################################################################

build:
	mkdir -p $(BUILD_DIR)

aux_rm:
	-rm -fR $(BUILD_DIR)/*.aux
	-rm -fR $(BUILD_DIR)/*.log
	-rm -fR $(BUILD_DIR)/*.out


clean:
	-rm -fR $(BUILD_DIR)
