FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy everything inside the app/ folder into /app/app/ in container
COPY app/ ./app/

# Install Python dependencies from app/requirements.txt
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Run Streamlit
CMD ["streamlit", "run", "app/main_app.py"]
