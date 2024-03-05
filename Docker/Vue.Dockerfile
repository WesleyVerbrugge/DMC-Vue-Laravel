# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy the Vue.js project into the container at /app
COPY ./vue-project .

# Make port 80 available to the world outside this container
EXPOSE 8080

# Run app.js when the container launches
RUN npm install
CMD ["npm", "run", "serve"]