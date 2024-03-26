# Set Python image to use:
FROM python:3.10.11-slim-bullseye

# Keeps Python from generating .pyc files in the container:
ENV PYTHONDONTWRITEBYTECODE=1
# Turns off buffering for easier container logging:
ENV PYTHONUNBUFFERED=1

# Install requirements:
RUN python -m pip install --upgrade pip
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Set Working directory and copy files:
WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder:
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Expose Streamlit default port:
EXPOSE 5000

# Set streamlit server command with default port:
CMD ["streamlit", "run", "main.py", "--server.port=5000", "--server.address=0.0.0.0"]
