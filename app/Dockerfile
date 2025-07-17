# Stage 1: Build the application
FROM node:23-alpine AS build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Create the final production image
FROM node:23-alpine AS production

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/node_modules ./node_modules
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/package*.json ./

COPY .env ./

EXPOSE 3000

ENTRYPOINT [ "node", "dist/src/main" ]
