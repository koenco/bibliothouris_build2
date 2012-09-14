cd /var/www

drush make build/bibliothouris.make bibliothouris_build --prepare-install

cd bibliothouris_build

drush site-install --db-url=mysql://root:mysqlroot@localhost/bibliothouris_test --account-name=admin --account-pass=admin --site-name=bibliothouris -y

cd sites/all/modules

mkdir custom

cd custom

git init
git remote add origin https://github.com/koenco/bibliothouris_modules.git
git pull origin master

drush en views_ui -y

drush en devel -y
drush en devel_generate -y
drush en masquerade -y
drush en diff -y
drush dl uuid_features && drush en uuid_features -y
drush dl features_extra && drush en fe_block -y

drush en bibliotouris_book -y
