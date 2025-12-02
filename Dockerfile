# Use Python 3.9 slim as base
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /app

# Copy your repository into the container
COPY . /app

# Install pytest
RUN pip install --no-cache-dir pytest

# Default command: run pytest on your test file
# Adjust path if you want to run all tests instead
# CMD ["python3", "-m", "pytest", "tests/test_calc_class.py", "--junitxml=test-results.xml"]
CMD ["bash", "-c", "set -o pipefail && python3 -m pytest tests/test_calc_class.py --junitxml=test-results.xml | tee test_run.log"]
