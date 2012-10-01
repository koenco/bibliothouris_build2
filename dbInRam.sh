#execute this with sudo!
rm -rf /var/lib/.mysql
cp -R /var/lib/mysql /var/lib/.mysql

/var/www/buildfiles/mysql_tmpfs.sh

service mysql restart
