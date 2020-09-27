for p in httpd httpd-devel httpd-mod_php7 httpd-mod_ssl
	do cyg_pack -p $p
	done
for p in php php-json php-iconv php-zip php-phar php-zlib php-tokenizer\
	php-simplexml php-xmlwriter php-mbstring php-pgsql php-curl\
	php-ctype php-gd php-intl php-fileinfo php-xmlrpc php-soap\
	php-xmlreader php-opcache
	do cyg_pack -p $p
	done
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '795f976fe0ebd8b75f26a6dd68f78fd3453ce79f32ecb33e7fd087d39bfeb978342fb73ac986cd4f54edd0dc902601dc') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
php composer.phar install
php composer.phar dumpautoload
