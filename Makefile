JSON_FILES = $(shell find data/ -type f -name '*.json')
MARKDOWN_FILES = $(patsubst %.json, %.md, $(JSON_FILES))

%.md : %.json
	node ./node_modules/.bin/json -I -f "$<"
	node ./build/tomarkdown.js "$<" > "$@"

.PHONY: all clean

all: $(MARKDOWN_FILES)

clean:
	find data -iname "*.md" | xargs rm
