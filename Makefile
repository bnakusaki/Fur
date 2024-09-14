FLUTTER = flutter

.PHONY: all run build clean test
all: run

run:
	${FLUTTER} run --dart-define-from-file=secrets.json
build:
	${FLUTTER} build appbundle
clean:
	${FLUTTER} clean