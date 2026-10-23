#stage1 = builder stage 
FROM node:18 AS builder

#set working directory
WORKDIR /app

#copy package file
COPY package*.json ./

#install dependencies
RUN npm install

#copy application source code
COPY . .


#stage2 = runtime  
FROM node:18-slim

#set working directory
WORKDIR /app

#copy package file
COPY --from=builder /app /app

#application port
EXPOSE 3000

#START APPLICATION
CMD ["node","index.js"]


