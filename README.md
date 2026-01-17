# Databases for Analytics

A professional project focused on learning and implementing databases for analytics workflows.

## Overview

This repository contains structured exercises, documentation, and code examples for understanding professional database design and analytics practices. It combines hands-on exercises with comprehensive guides for setting up and managing analytics databases.

## Features

- **6 Progressive Exercises**: Structured exercises covering database fundamentals to advanced analytics
- **Professional Documentation**: MkDocs-based site with guides and policies  
- **Python Package**: Reusable analytics utilities in `src/databases_for_analytics/`
- **Testing Framework**: Unit tests with pytest and coverage reporting
- **CI/CD Pipeline**: Automated testing and documentation deployment via GitHub Actions

## Quick Start

### Prerequisites

- Python 3.14 or higher
- [uv](https://docs.astral.sh/uv/) package manager (recommended)
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/denisecase/databases-for-analytics.git
cd databases-for-analytics
```

2. Set up the environment and install dependencies:
```bash
uv sync --extra dev --extra docs
```

### Running Tests

Execute the test suite with coverage:
```bash
uv run pytest
```

### Building Documentation

Build the MkDocs site locally:
```bash
uv run mkdocs serve
```

Visit `http://localhost:8000` to view the documentation.

## Project Structure

```
├── src/databases_for_analytics/     # Main package code
├── tests/                           # Unit tests
├── exercises/                       # 6 progressive exercises
├── docs/                            # Documentation source (Markdown)
├── notebooks/                       # Jupyter notebooks (if applicable)
├── pyproject.toml                   # Python project configuration
├── mkdocs.yaml                      # Documentation configuration
└── README.md                        # This file
```

## Exercises

The project includes 6 exercises:
- **Exercise 01**: Database fundamentals
- **Exercise 02**: Schema design
- **Exercise 03**: Queries and performance
- **Exercise 04**: Data modeling for analytics
- **Exercise 05**: Advanced analytics patterns
- **Exercise 06**: Real-world case studies

See [exercises/](exercises/) directory for details.

## Documentation

Comprehensive documentation is available at:
- **[Applied Computing Fundamentals](https://denisecase.github.io/applied-computing-fundamentals/)** - Foundational concepts
- **[Pro Analytics 02: Setup and Workflow Guide](https://denisecase.github.io/pro-analytics-02/)** - Professional setup and workflow

Local documentation (after building):
- Visit `http://localhost:8000` after running `uv run mkdocs serve`

## Development

### Code Quality

The project uses professional code quality tools:
- **Ruff**: Python linting and formatting
- **Pytest**: Unit testing with coverage
- **Pyright**: Static type checking (optional)

### Running Linting

```bash
uv run ruff check src tests
uv run ruff format src tests
```

### Type Checking

```bash
uv run pyright src
```

## Dependencies

### Core
- `datafun-toolkit>=0.9.4`: Analytics utilities

### Development
- `pytest`, `pytest-cov`: Testing
- `ruff`: Code quality
- `pyright`: Type checking
- `pre-commit`: Git hooks

### Documentation
- `mkdocs`, `mkdocs-material`: Documentation generation
- `mkdocstrings`: API documentation

See `pyproject.toml` for complete dependencies.

## CI/CD

The repository uses GitHub Actions for:
- **Continuous Integration**: Run tests on every push
- **Documentation**: Build and deploy MkDocs site to GitHub Pages
- **Link Validation**: Check documentation links

View workflows in `.github/workflows/`

## Policies and Guidelines

- **[Policies](docs/root/POLICIES.md)**: Project policies and requirements
- **[Skills](docs/root/SKILLS.md)**: Learning objectives
- **[For Instructors](docs/root/INSTRUCTORS.md)**: Teaching guidance

## Citation

If you use this project in your work, please cite it:

```bibtex
@software{case2024databases,
  title={Databases for Analytics},
  author={Case, Denise},
  year={2024},
  url={https://github.com/denisecase/databases-for-analytics}
}
```

See [CITATION.cff](CITATION.cff) for details.

## Structural Explainability

This repository uses the [Structural Explainability Annotation Standard](https://github.com/structural-explainability/.github/blob/main/ANNOTATIONS.md) to document decisions and constraints in code and configuration.

See [ANNOTATIONS.md](ANNOTATIONS.md) for details.

## License

See LICENSE file for license information.

## Contributing

Contributions are welcome! Please ensure:
1. Code passes linting: `uv run ruff check .`
2. Tests pass: `uv run pytest`
3. Documentation builds: `uv run mkdocs build --strict`

## Contact

For questions or issues, please open a [GitHub issue](https://github.com/denisecase/databases-for-analytics/issues).

---

**Start with the [exercises](exercises/) or explore the [documentation](https://your-username.github.io/databases-for-analytics/).**
