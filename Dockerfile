FROM node:20-alpine

# Create app directory and set working environment
# This is a Nuxt.js application running in production mode
WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application
COPY . .

# Build the application
RUN yarn build

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["node", ".output/server/index.mjs"]
