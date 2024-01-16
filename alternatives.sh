# v alternative
/usr/sbin/alternatives --install /usr/bin/v v /usr/bin/vim 50 --slave /usr/share/man/man1/v.1.gz v-man /usr/share/man/man1/vim.1.gz
# links alternative
for alternative in lynx links ; do /usr/sbin/alternatives --install /usr/bin/lynk lynk /usr/bin/$alternative 50 --slave /usr/share/man/man1/lynk.1.gz lynk-man /usr/share/man/man1/$alternative.1.gz ; done

