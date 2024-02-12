# Python version Python3.12
PYTHON = python3.12

# Define application name and source directory
APP_NAME = twelve_factor_app_framework
APP_DIR = .


# Pip environment configuration
PIP_ENV = ../venvs/12factor_env

# Define paths
REQUIREMENTS_DIR = .
REQUIREMENTS_FILE = ${REQUIREMENTS_DIR}/requirements.txt
REQUIREMENTS_IN = ${REQUIREMENTS_DIR}/requirements.in

# Targets
all: run

# Create virtual environment
venv:
	$(PYTHON) -m virtualenv $(PIP_ENV)

# Activate virtual environment
activate:
	@source $(PIP_ENV)/bin/activate

# Install dependencies from pip-compile
install-deps: venv activate
	$(PYTHON) -m pip install -r $(REQUIREMENTS_IN)
	$(PYTHON) -m pip install pip-tools
	pip-compile $(REQUIREMENTS_IN) --output-file $(REQUIREMENTS_FILE)
	$(PYTHON) -m pip install -r $(REQUIREMENTS_FILE)

# Clean virtual environment
deactivate:
	deactivate

clean:
	rm -rf $(PIP_ENV)

# Run Flask app
run: install-deps activate
	$(PYTHON) $(APP_DIR)/app.py

# Test Flask app
test: install-deps activate
	# Add your test commands here
	@echo "Not integrated"

flake-linter:
	@flake8

black-formatter:
	@black .

# Help message
help:
	@echo "Available targets:"
	@echo "  all         : Build and run the application"
	@echo "  venv        : Create a virtual environment"
	@echo "  activate   : Activate the virtual environment"
	@echo "  install-deps: Install dependencies using pip-compile"
	@echo "  deactivate : Deactivate the virtual environment"
	@echo "  clean       : Clean the virtual environment"
	@echo "  run         : Run the Flask application"
	@echo "  test        : Run tests for the Flask application"
	@echo "  help        : Show this help message"

.PHONY: all venv activate install-deps deactivate clean run test prod-requirements
