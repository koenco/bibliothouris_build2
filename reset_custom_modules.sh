cd /var/www/bibliothouris_build/sites/all/modules
rm -rf custom

git init
git remote add origin https://github.com/koenco/bibliothouris_modules.git
git clone https://github.com/koenco/bibliothouris_modules.git

mv bibliothouris_modules custom

cd /var/www/bibliothouris_build/sites/all/themes

rm -rf custom

git init
git remote add origin https://github.com/koenco/bibliothouris_themes.git
git clone https://github.com/koenco/bibliothouris_themes.git

mv bibliothouris_themes custom
