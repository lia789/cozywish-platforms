# CozyWish Platforms

This repository contains the CozyWish platform applications.

## Development Workflow

### Branch Structure

- `main`: Production-ready code. This branch is deployed to production.
- `development`: Active development branch where new features and bug fixes are integrated.

### Merging from Development to Main

#### 1. Verify Tests Locally

Before merging to the main branch, ensure all tests pass on the development branch:

```bash
# Checkout the development branch
git checkout development

# Pull the latest changes
git pull origin development

# Run all tests to verify they pass
make test
# or
python manage.py test
```

#### 2. Merge Process

Once all tests pass locally, follow these steps to merge to main:

```bash
# Checkout the main branch
git checkout main

# Pull the latest changes from main
git pull origin main

# Merge the development branch into main
git merge development

# If there are conflicts, resolve them and then commit
# git add .
# git commit -m "Resolve merge conflicts"

# Push the changes to the remote main branch
git push origin main
```

#### 3. Best Practices

- **Always run tests locally** before initiating a merge to main
- **Create a backup branch** before merging if you're working on critical changes
- **Document significant changes** in commit messages and pull requests
- **Perform code reviews** before merging to main
- **Avoid direct commits** to the main branch; always work through the development branch
- **Tag releases** on the main branch using semantic versioning (e.g., v1.0.0)
- **Communicate with the team** before and after merging to main

## Django Project: project_root

This is a Django project that serves as the foundation for the CozyWish platform.

### Setup

1. Create and activate the virtual environment:
   ```bash
   python -m venv CozyWish_ENV
   source CozyWish_ENV/bin/activate
   ```

2. Install dependencies:
   ```bash
   make install-deps
   # or
   pip install -r requirements.txt
   ```

3. Set up environment variables:
   ```bash
   make setup-env
   # This will create a .env file from .env.example
   # Edit the .env file with your specific settings
   ```

4. Run the development server:
   ```bash
   make run
   # or with specific environment settings
   make run-dev    # Development settings
   make run-test   # Test settings
   make run-staging # Staging settings
   make run-prod   # Production settings
   ```

### Environment Variables

The project uses python-dotenv for environment variable management. Environment variables are loaded from a `.env` file in the project root. You can create this file by copying `.env.example` and updating the values:

```bash
cp .env.example .env
```

Key environment variables:

- `DJANGO_ENVIRONMENT`: The environment to use (development, testing, staging, production)
- `SECRET_KEY`: Django secret key
- `DEBUG`: Whether to enable debug mode
- `ALLOWED_HOSTS`: Comma-separated list of allowed hosts
- `DB_*`: Database connection settings
- `EMAIL_*`: Email settings

### Project Structure

- `project_root/` - Main Django project configuration
- `project_root/settings/` - Split settings files for different environments
- `manage.py` - Django management script
- `utils/env.py` - Environment variable utilities
- `Makefile` - Commands for common tasks
- `utility_app/` - Simple utility application with a home page

### Applications

#### utility_app

A simple utility application that provides basic functionality. Access it at `/utility/` in your browser.

To run tests for the utility_app:

```bash
python manage.py test utility_app
```

