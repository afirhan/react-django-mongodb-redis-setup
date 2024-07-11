# Use the Python 3.9 Alpine base image
FROM python:3.9.19-alpine3.20

# Set metadata labels
LABEL maintainer="Firhan Ali <alifirhan.fa@gmail.com>"
LABEL description="Customized image for business purposes developed by Firhan Ali."

# Set environment variable
ENV PYTHONUNBUFFERED 1

# Install necessary packages for building
RUN apk add --no-cache --virtual .build-deps \
    ca-certificates gcc postgresql-dev linux-headers musl-dev \
    libffi-dev jpeg-dev zlib-dev

# Install Python dependencies
# Copy the requirements file into the container
COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt && \
    rm /app/requirements.txt

# Remove unnecessary files
RUN find /usr/local \
    \( -type d -a -name test -o -name tests \) \
    -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
    -exec rm -rf '{}' +

# Find and install runtime dependencies
RUN runDeps="$( \
    scanelf --needed --nobanner --recursive /usr/local \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | sort -u \
            | xargs -r apk info --installed \
            | sort -u \
)" \
&& apk add --virtual .rundeps $runDeps

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application code
COPY . .

# Expose the port the Django app runs on
EXPOSE 8000

# Start the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]