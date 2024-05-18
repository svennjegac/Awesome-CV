.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
SVEN_DIR = sven
RESUME_DIR = examples/resume
CV_DIR = examples/cv
SVEN_CV_DIR = sven/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
SVEN_CV_SRCS = $(shell find $(SVEN_CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

sven-cv.pdf: $(SVEN_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(SVEN_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
