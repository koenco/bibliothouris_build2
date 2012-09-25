cd /var/www

drush make buildfiles/bibliothouris.make bibliothouris_build --prepare-install

cd bibliothouris_build


#
#  Edit following line with your mysql database, username and password
#  (e.g. username: root
#        password: mysqlroot
#        db:       bibliothouris_build
#   --db-url=mysqlroot://root:mysqlroot@localhost/bibliothouris_build
#
drush site-install --db-url=mysql://root:mysqlroot@localhost/bibliothouris_build --account-name=admin --account-pass=admin --site-name=Bibliothouris -y

cd sites/all/modules

mkdir custom

cd custom

git init
git remote add origin https://github.com/koenco/bibliothouris_modules.git
git pull origin master

cd /var/www/bibliothouris_build/sites/all/themes
mkdir custom
cd custom

git init
git remote add origin https://github.com/koenco/bibliothouris_themes.git
git pull origin master
drush en alphorn -y
drush vset theme_default alphorn

cd /var/www/bibliothouris_build/sites
mkdir files
chmod 777 -R files 

drush dl ds && drush en ds -y
drush dl panels && drush en panels -y

drush en uuid diff devel devel_generate masquerade simpletest fe_block entitycache views_ui node_export date date_popup uuid_features phone genpass email_registration autoassignrole administerusersbyrole simpletest_clone omega_tools -y

drush en bibliotouris_book -y
drush en bibliothouris_user -y

drush fr bibliothouris_user -y
drush fr bibliotouris_book -y

drush en bibliothouris_views -y
drush fr bibliothouris_views -y

drush en bibliothouris_data -y

drush ucrt emp --mail="emp@emp.be" --password="emp"
drush urol employee emp

drush ucrt member --mail="member@member.be" --password="member"

drush node-export-import --file=/var/www/bibliothouris_build/sites/all/modules/custom/data/got.export 
