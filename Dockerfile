FROM python:3.9-slim

# Install required system dependencies for mysqlclient
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    gcc \
    build-essential \
    libssl-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port
EXPOSE 8000

# Start the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
