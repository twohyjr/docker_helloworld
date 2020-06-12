FROM nginx

# stops the logging every time we hit the page
RUN rm -v /etc/nginx/nginx.conf

# use our own defined nginx config file
COPY nginx.conf /etc/nginx/

# put the static file into the servable location
COPY web /usr/share/nginx/html

EXPOSE 80

deploy:
    provider: elasticbeanstalk
    region: "us-east-1"
    app: docker-react
    env: "DockerReact-env"
    bucket_name: "elasticbeanstalk-us-east-1-926110576269"
    bucker_path: "docker-react" #the app name
    on:
        branch: master #when we push to master DEPLOY!
    access_key_id: $AWS_ACCESS_KEY
    secret_access_key: $AWS_SECRET_KEY
