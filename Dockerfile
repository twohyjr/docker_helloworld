FROM nginx

# stops the logging every time we hit the page
RUN rm -v /etc/nginx/nginx.conf

# use our own defined nginx config file
COPY nginx.conf /etc/nginx/

# put the static file into the servable location
COPY web /usr/share/nginx/html

EXPOSE 80

