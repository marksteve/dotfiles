.PHONY: all python

all:
	true

python: requirements.txt
	pip-sync --user

requirements.txt: requirements.in
	pip-compile --no-index requirements.in > requirements.txt
