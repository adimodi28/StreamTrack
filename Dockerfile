# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install numpy first
RUN pip install numpy==1.21.6

# Install the rest of the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Verify Altair installation
RUN python -c "import altair; print(altair.__version__)"

# Copy the rest of the application code into the container
COPY . .

# Command to run the application
CMD ["streamlit", "run", "app.py", "--server.port=8000", "--server.address=0.0.0.0"]
