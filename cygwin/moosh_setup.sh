#. ~/dot/cygwin/web_pack.sh

cd ~/moosh

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified';  } else { echo 'Installer corrupt'; unlink('composer-setup.php');  } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar install
php composer.phar dumpautoload
ln -s /home/$USER/moosh/moosh.php /usr/local/bin/Moosh
chmod 775 /usr/local/bin/Moosh
