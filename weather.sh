
# f="$1"
# url="https://weatherdbi.herokuapp.com/data/weather/${f}"
# json="$(wget -qO- "$url")"
# temp=$(echo $json|jq -r ."currentConditions|(.temp.c)")
# humidity=$(echo $json|jq -r ."currentConditions|.humidity")
# description=$(echo $json|jq -r ."region")
# if [ ${humidity} == null ]
# then
#     echo "please enter valid city name"
    
# else
#     echo "It is currently ${description}"
#     echo "Temperature: ${temp}℉ "
#     echo "Humidity: ${humidity}"
    
# fi

f="$1"

url="https://weatherdbi.herokuapp.com/data/weather/${f}"
json=$(curl -X GET "$url")
temp=$(echo $json| jq '.currentConditions.temp.c')
humidity=$(echo $json| jq '.currentConditions.humidity')
description=$(echo $json| jq ".region")
if [ ${humidity} == null ]
then
    echo "please enter valid city name"

else
    echo "It is currently ${description}"
    echo "Temperature: ${temp}℉ "
    echo "Humidity: ${humidity}"
    
fi