
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

# f="$1"

# url="https://weatherdbi.herokuapp.com/data/weather/${f}"
# json=$(curl -X GET "$url")
# temp=$(echo $json| jq '.currentConditions.temp.c')
# humidity=$(echo $json| jq '.currentConditions.humidity')
# description=$(echo $json| jq ".region")
# if [ ${humidity} == null ]
# then
#     echo "please enter valid city name"

# else
#     echo "It is currently ${description}"
#     echo "Temperature: ${temp}℉ "
#     echo "Humidity: ${humidity}"
    
# fi

# f="$1"
# url="https://weatherdbi.herokuapp.com/data/weather/${f}"
# json=$(curl -X GET "$url")
# echo $json
# description=$(echo $json | sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="region"{print $2}')
# humidity=$(echo $json| grep -oP '(?<="region": ")[^"]*')
# temp=$(echo $json| sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="c"{print $2}')
# echo "It is currently ${description}"
# echo "Humidity: ${humidity}"
# echo "Temperature: ${temp}℉ "


f="$1"
url="https://weatherdbi.herokuapp.com/data/weather/${f}"
json=$(curl -X GET "$url")
echo $json
description=$(echo $json | sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="region"{print $2}')
humidity=$(echo $json| sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="humidity"{print $2}')
temp=$(echo $json| sed -e 's/[{}]/''/g' | sed s/\"//g | awk -v RS=',' -F: '$1=="temp"{print $3}')
echo "You have selected ${description}"
echo "Humidity: ${humidity}"
echo "Temperature: ${temp}℉"