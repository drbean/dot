#. ~/dot/cygwin/web_pack.sh

cd ~/moosh

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified';  } else { echo 'New Composer Installer!'; unlink('composer-setup.php');  } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar install
php composer.phar dumpautoload
ln -s /home/owuser/moosh/moosh.php /usr/local/bin/Moosh
chmod 775 /usr/local/bin/Moosh
