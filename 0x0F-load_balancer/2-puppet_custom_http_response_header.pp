# Installs a Nginx server, sets hello to file, allows redirection

exec {'install':
  provider => shell,
  command  => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/www.youtube.com\/watch?v=dQw4w9WgXcQ permanent;/" /etc/nginx/sites-available/default ; sudo service nginx start ; sed -i "s/^\tlocation \/ {/\tlocation \/ {\n\t\tadd_header X-Served-By \"$HOSTNAME\";/" /etc/nginx/sites-available/default ; service nginx restart',
}