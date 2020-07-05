.PHONY: test

all: dep
	rake doc test

lint:
	rake lint

test:
	rake test

dep:
	bundle install

build:
	gem build

# run oobt out box test on the package created locally
oobt: build
	gem install `ls -t1 *.gem | head -1`
	ruby oobt/demo.rb

release: oobt
	gem release
	gem tag
