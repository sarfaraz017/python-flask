# Use the official Python image from the Docker Hub
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set the environment variable to production
ENV FLASK_ENV=production

# Expose the port that Flask will run on
EXPOSE 5000

# Command to run the app using gunicorn for production
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]

