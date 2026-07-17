
# Stage 1: Build React app
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
# Stage 2: Serve with Nginx
FROM nginx:alpine
# Copy build folder from previous stage
COPY --from=build /app/build /usr/share/nginx/html
# Expose port 80 for container
EXPOSE 80
# Start Nginx
CMD ["nginx", "-g", "daemon off;"]