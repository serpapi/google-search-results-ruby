.PHONY: test

all: dep
	rake doc test

lint:
	rake lint

test:
	rake test

dep:
	bundle install

release:
	gem build
	gem release
	gem tag
