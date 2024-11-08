FROM node:17-slim
WORKDIR /usr/app

# Install dependencies and build the project.
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Expose port (default for Express apps is 3000, change if needed)
EXPOSE 5200

# Run the web service on container startup.
CMD ["node", "dist/server.js"]