FLUTTER = flutter

.PHONY: all run build clean test
all: run

run:
	${FLUTTER} run
build:
	${FLUTTER} build appbundle
clean:
	${FLUTTER} clean