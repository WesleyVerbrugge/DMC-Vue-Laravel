# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy the Vue.js project into the container at /app
COPY ./vue-project .

# Copy the shell script
COPY vue-entrypoint.sh /usr/src/app/vue-entrypoint.sh

# Give execute permissions to the shell script
RUN chmod +x /usr/src/app/vue-entrypoint.sh

# Run the shell script to install dependencies and start the development server
CMD ["/usr/src/app/vue-entrypoint.sh"]