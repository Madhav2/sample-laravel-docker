touch /storage/logs/laravel.log
printenv | grep -v "no_proxy" >> /etc/environment
service apache2 start

while :
do
   sleep 2m
done
