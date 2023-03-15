#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ...";
sleep 10s;

pref=$(cat ./databases/preferences.json);
config=$(cat ./databases/config.json);
cookie_secret=$(echo $config | jq -r '.cookie_secret');

prevLogin=$(echo $pref | jq -r '.user.login' );

prevRaw=$(echo $pref | jq -r '.user.raw' );
prevPasswordTemp=$(echo -n $prevRaw$cookie_secret | sha256sum);
prevPassword=${prevPasswordTemp:0:64};

newRaw=${ADMIN_PASSWORD}
newPasswordTemp=$(echo -n $newRaw$cookie_secret | sha256sum);
newPassword=${newPasswordTemp:0:64};

sed -i "s@$prevLogin@root@g" ./databases/preferences.json;
sed -i "s@$prevPassword\",@$newPassword\"@g" ./databases/preferences.json;
sed -i "s@\"raw\": \"$prevRaw\"@@g" ./databases/preferences.json;

docker-compose down;
docker-compose up -d;
