!/bin/bash

echo "Enter the city name"
read city

url="$(curl http://wttr.in/$city)"
echo "The weather report is ${url}"