#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 10s;

# url=$(curl -i https://${DOMAIN})
#     echo $url > url.txt

# target=$(docker-compose port flow 8000)

# curl http://${target}/fapi/password/ \
#   -H 'accept: text/plain, */*; q=0.01' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/json; charset=UTF-8' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' \
#   -H 'x-requested-with: XMLHttpRequest' \
#   --data-raw '{"login":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'","passwordreply":"'${ADMIN_PASSWORD}'"}' \
#   --compressed