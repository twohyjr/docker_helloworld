HTTP_BODY=curl http://a8305d7693ea04868ba1d66ee1441a0d-906805300.us-east-1.elb.amazonaws.com/

# # example using the status
if [ ! $HTTP_BODY -eq "Hello, World!"  ]; then
  echo "The body does not equal Hello, World!"
  exit 1
fi