.PHONY: all image run

all: image run

image:
	docker build --pull --tag stackoverflow-73318918:latest .

run:
	docker run --interactive --tty --rm --publish 15672:15672 stackoverflow-73318918:latest
