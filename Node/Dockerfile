FROM node
RUN apt-get update && apt-get install -y \
    software-properties-common \
    nginx \
    curl \
    nano \
    curl  
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./nginx/default /etc/nginx/sites-available/default
COPY . .
EXPOSE 80
CMD ["sh", "-c", "node index.js & nginx -g 'daemon off;'"]






#CMD ["sh", "-c", "python app.py & nginx -g 'daemon off;'"]


