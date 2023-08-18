FROM python:3.8
RUN apt-get update && apt-get install -y \
    software-properties-common \
    nginx \
    curl \
    nano \
    curl  
WORKDIR /app
COPY ./nginx/default /etc/nginx/sites-available/default
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN service nginx start
COPY . .
EXPOSE 80
CMD ["sh", "-c", "python app.py & nginx -g 'daemon off;'"]







