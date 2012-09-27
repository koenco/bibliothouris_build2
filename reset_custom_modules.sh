cd /var/www/bibliothouris_build/sites/all/modules/
rm -rf custom

mkdir custom
cd custom

git init
git remote add origin https://github.com/koenco/bibliothouris_modules.git
git clone https://github.com/koenco/bibliothouris_modules.git

cp -R bibliothouris_modules/* .
rm -rf bibliothouris_modules

cd /var/www/bibliothouris_build/sites/all/themes/

rm -rf custom

mkdir custom
cd custom

git init
git remote add origin https://github.com/koenco/bibliothouris_themes.git
git clone https://github.com/koenco/bibliothouris_themes.git

cp -R bibliothouris_themes/* .
rm -rf bibliothouris_themes
