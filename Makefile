.PHONY: test

version=$(shell grep VERSION lib/search/serp_api_search.rb | cut -d "\"" -f2)

all: dep
	rake doc test

lint:
	rake lint

test:
	rake test

dep:
	bundle install

build:
	gem build google_search_results

# run oobt out box test on the package created locally
oobt: build
	gem install `ls -t1 *.gem | head -1`
	ruby oobt/demo.rb

tag: 
	@echo create git tag $(version)
	git tag $(version)
	git push origin $(version)

release: oobt
	gem push `ls -t1 *.gem | head -1`

