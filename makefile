NO_COLOR="\033[0m"
RED = "\033[38;5;009m"
GREEN = "\033[38;5;010m"
YELLOW = "\033[38;5;011m"
ORANGE = "\033[38;5;214m"
LIGHTPURPLE = "\033[38;5;177m"
PURPLE = "\033[38;5;135m"
CYAN = "\033[38;5;014m"
LIGHTGRAY = "\033[38;5;252m"
DARKGRAY = "\033[38;5;242m"
BRIGHTRED = "\033[91m"
BOLD = "\033[1m"

BUILD_DIR=tmp

XELATEX = xelatex -output-directory=$(BUILD_DIR)

TARGET_TEX := $(wildcard *.tex) 
TARGET_PDF := $(TARGET_TEX:.tex=.pdf)

.PHONY: clean

all: $(TARGET_PDF)

deploy: build
	@echo -n $(DARKGRAY)
	mv cv.pdf build/cv.pdf
	cp index.html build/index.html
	@echo -n $(NO_COLOR)

%.pdf: %.tex $(BUILD_DIR) awesome-cv.cls
	@echo $(GREEN)"Building $<"
	@echo -n $(DARKGRAY)
	$(XELATEX) $<
	mv $(BUILD_DIR)/$@ ./
	@echo -n $(NO_COLOR)

$(BUILD_DIR):
	@echo -n $(YELLOW)
	mkdir $(BUILD_DIR)
	@echo -n $(NO_COLOR)

build:
	@echo -n $(YELLOW)
	mkdir build
	@echo -n $(NO_COLOR)

clean:
	@echo -n $(RED)
	@echo cleaning...
	@echo -n $(NO_COLOR)
	@rm $(TARGET_PDF)  2> /dev/null || true
	@rm -fr $(BUILD_DIR)  2> /dev/null || true
	@rm -fr build  2> /dev/null || true
