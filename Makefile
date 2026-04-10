# Helper to generate source info and test locally (requires makepkg on host)
.PHONY: all srcinfo clean

all: srcinfo

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src
