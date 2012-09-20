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

cd /var/www/bibliothouris_build/sites/all/themes
mkdir custom
cd custom

#drush dl adaptivetheme

git init
git remote add origin https://github.com/koenco/bibliothouris_themes.git
git pull origin master
drush en alphorn -y
drush vset theme_default alphorn

#drush en corolla -y

cd /var/www/bibliothouris_build/sites
mkdir files
chmod 777 -R files 
 
drush dl masquerade
drush dl entitycache-1.x-dev -y
drush dl features_extra
drush dl node_export
drush dl uuid_features-7.x-1.x-dev
drush dl phone
drush dl genpass
drush dl email_registration
drush dl autoassignrole
drush dl administerusersbyrole
drush dl simpletest_clone
drush dl uuid-1.x-dev

drush en uuid diff devel devel_generate masquerade simpletest fe_block entitycache views_ui node_export date date_popup uuid_features phone genpass email_registration autoassignrole administerusersbyrole simpletest_clone omega_tools -y
#drush dl uuid_features && drush en uuid_features -y
#drush dis uuid -y

drush en bibliotouris_book -y

drush en bibliothouris_user -y

drush fr bibliothouris_user -y
drush fr bibliotouris_book -y


drush ucrt emp --mail="emp@emp.be" --password="emp"
drush urol employee emp

drush ucrt member --mail="member@member.be" --password="member"

drush node-export-import --file=/var/www/bibliothouris_build/sites/all/modules/custom/data/got.export 
