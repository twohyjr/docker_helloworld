#!/bin/bash

HTTP_BODY=$(curl http://a8305d7693ea04868ba1d66ee1441a0d-906805300.us-east-1.elb.amazonaws.com:80)

str1="Hello, World!"
str2=$HTTP_BODY

if [ "$str1" != "$str2" ]; then
    echo "Strings are not equal"
    exit 1
else
    echo "Strings are equal"
fi