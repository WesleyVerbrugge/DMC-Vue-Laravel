# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the Vue.js project into the container at /app
COPY ./vue-project .

# Install any needed packages specified in package.json
RUN npm install

# Make port 80 available to the world outside this container
EXPOSE 8080

# Run app.js when the container launches
CMD ["npm", "run", "serve"]