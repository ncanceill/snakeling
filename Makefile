python = python3.11
MAXLINE = 120

SETUP_FILES = pyproject.toml

BUILD_DIR = dist
DOC_DIR = docs
SRC_DIR = src
VENV = venv

.PHONY: package doc format lint type test clean

package: format $(BUILD_DIR) $(VENV)
	$(VENV)/bin/python -m build -o $(BUILD_DIR) .

doc: $(VENV)
	$(VENV)/bin/pdoc -o $(DOC_DIR) \
	--footer-text="v$$($(VENV)/bin/python -m setuptools_scm)" \
	$(filter-out %.egg-info/,$(wildcard $(SRC_DIR)/*/))

format: $(VENV)
	$(VENV)/bin/isort -l $(MAXLINE) --profile black --no-sections --combine-as --gitignore .
	$(VENV)/bin/black --line-length=$(MAXLINE) .

lint: $(VENV)
	$(VENV)/bin/flake8 --max-line-length=$(MAXLINE) .

type: $(VENV)
	$(VENV)/bin/mypy .

test: $(VENV)
	$(VENV)/bin/python -m unittest

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(DOC_DIR):
	mkdir -p $(DOC_DIR)

$(VENV): $(SETUP_FILES)
	$(python) -m venv $(VENV)
	$(VENV)/bin/pip install -U pip
	$(VENV)/bin/pip install -e .[dev,doc,quality,testing]
	touch $(VENV)

clean:
	rm -rf $(BUILD_DIR) $(DOC_DIR) $(VENV) ./*.egg-info ./build $(PDOC)/$(LOGO).html
	git clean -f
