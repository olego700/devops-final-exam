# === Stage 1: Build ===
FROM python:3.10-slim AS builder

WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the application code
COPY app.py ./

# === Stage 2: Run ===
FROM python:3.10-slim

WORKDIR /app

# Copy the installed packages and application from the builder stage
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /app/app.py ./

# Expose port 5001 for the application
EXPOSE 5001

# Set environment variables for AWS credentials
ENV AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY
ENV AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_KEY

# Run the application
CMD ["python", "app.py"]
