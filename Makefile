help:
	@echo 'make install:    Add pre-commit GIT hook that strips the notebook binary data'
	@echo 'make hook:       Add pre-commit GIT hook that strips the notebook binary data'
	@echo 'make clean:      Add hook that clears notebook binary data'
	@echo 'make run:        Run notebooks'

install: hook
	pip install nbconvert  --user
	pip install nbval

test:
	py.test --nbval *.ipynb

hook:
	cp .hooks/pre-commit .git/hooks/pre-commit

unhook:
	rm .git/hooks/*

clean:
	jupyter-nbconvert --ClearOutputPreprocessor.enabled=True --inplace **.ipynb
	# jupyter-nbconvert --ClearOutputPreprocessor.enabled=True --inplace */*.ipynb

install: hook
	pip install nbconvert  
	pip install jupyterlab

run:
	jupyter-lab .

.PHONY: install
