h=httpd,httpd-devel,httpd-mod_php7,httpd-mod_ssl
cyg_pack -p $h
p=php,php-json,php-iconv,php-zip,php-phar,php-zlib,php-tokenizer,\
php-simplexml,php-xmlwriter,php-mbstring,php-pgsql,php-curl,\
php-ctype,php-gd,php-intl,php-fileinfo,php-xmlrpc,php-soap,\
php-xmlreader,php-opcache
cyg_pack -p $p
