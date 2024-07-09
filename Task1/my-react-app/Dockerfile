# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /my-react-app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Install a simple HTTP server to serve the static files
RUN npm install -g serve

# Command to run the application
CMD ["serve", "-s", "build"]

# Expose the port the app runs on
EXPOSE 3000
