.PHONY: run test clean setup-env install-deps run-dev run-test run-staging run-prod

# Run the development server
run:
	python manage.py runserver

# Run tests
test:
	python manage.py test

# Clean pyc files
clean:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete

# Environment setup
setup-env:
	@echo "Setting up environment..."
	@if [ ! -f .env ]; then \
		cp .env.example .env; \
		echo "Created .env file from .env.example"; \
		echo "Please edit .env file with your settings"; \
	else \
		echo ".env file already exists"; \
	fi

# Install dependencies
install-deps:
	@echo "Installing dependencies..."
	pip install -r requirements.txt

# Run with specific environment settings
run-dev:
	@echo "Running with development settings..."
	@export DJANGO_ENVIRONMENT=development && python manage.py runserver

run-test:
	@echo "Running with test settings..."
	@export DJANGO_ENVIRONMENT=testing && python manage.py runserver

run-staging:
	@echo "Running with staging settings..."
	@export DJANGO_ENVIRONMENT=staging && python manage.py runserver

run-prod:
	@echo "Running with production settings..."
	@export DJANGO_ENVIRONMENT=production && python manage.py runserver
