# FROM python:3.11-slim

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     curl \
#     docker.io \
#     && rm -rf /var/lib/apt/lists/*

# WORKDIR /app

# # Copy requirements and install Python dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# # Copy application files
# COPY app.py .

# # Create non-root user
# RUN useradd -m -u 1000 appuser && chown -R appuser:appuser /app
# USER appuser

# # Health check
# HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
#   CMD curl -f http://localhost:5001/ || exit 1

# EXPOSE 5001


FROM node:22-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 4000

CMD ["npm", "start"]
