cd /var/www

drush make buildfiles/bibliothouris.make bibliothouris_build --prepare-install

cd bibliothouris_build

drush site-install --db-url=mysql://root:mysqlroot@localhost/bibliothouris_build --account-name=admin --account-pass=admin --site-name=bibliothouris -y

#echo "testtest" | sudo -S chmod 777 sites/default/files

cd sites/all/modules

mkdir custom

cd custom

git init
git remote add origin https://github.com/koenco/bibliothouris_modules.git
git pull origin master

#cd /var/www/bibliothouris_build/sites/all/themes
#mkdir custom
#cd custom

#drush dl adaptivetheme

#git init
#git remote add origin https://github.com/koenco/bibliothouris_themes.git
#git pull origin master

#drush en corolla -y
#drush vset theme_default corolla 

drush dl masquerade
drush dl entitycache-1.x-dev -y
drush dl features_extra

drush en diff devel devel_generate masquerade simpletest fe_block entitycache views_ui -y
#drush dl uuid_features && drush en uuid_features -y
drush dis uuid -y

drush en bibliotouris_book -y

drush fr bibliotouris_book -y