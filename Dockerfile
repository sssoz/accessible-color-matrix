FROM node:14

# Install Elm
RUN npm install -g elm

# Create app directory
WORKDIR /usr/src/app

# Copy app files
COPY . .

# Install dependencies
RUN npm install

# Build the app
RUN npm run build

# Install a simple static file server
RUN npm install -g serve

# Expose the app on port 3000
EXPOSE 3000

# Command to run the app
CMD ["serve", "-s", "dist", "-l", "3000"]