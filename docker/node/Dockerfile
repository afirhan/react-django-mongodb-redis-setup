FROM node:20.14.0-alpine3.20

LABEL maintainer="Firhan Ali <alifirhan.fa@gmail.com>"
LABEL description="Customized image for business purposes developed by Firhan Ali."

# Set the working directory in the container
WORKDIR /app

RUN npm cache clean --force

# Copy package.json and package-lock.json
COPY frontend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY frontend/ .

# Install all dependencies and build app
RUN npm install

# Start the React app
CMD ["npm", "start"]