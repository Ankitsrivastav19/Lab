# Use an official Python runtime as the base image
 FROM python:3.9-slim
#
# # Set the working directory to /app
 WORKDIR /app
#
# # Copy the current directory contents into the container at /app
 COPY . /app
#
# # Install required dependencies
 RUN pip install --no-cache-dir -r requirements.txt
#
# # Expose the application port (assuming your Flask app runs on port 5000)
 EXPOSE 5000
#
# # Set the entrypoint to run the application using gunicorn
 CMD ["gunicorn", "app:app", "-b", "0.0.0.0:5000"]
#
