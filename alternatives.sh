# v alternative
/usr/sbin/alternatives --install /usr/bin/v v /usr/bin/vim 50 --slave /usr/share/man/man1/v.1.gz v-man /usr/share/man/man1/vim.1.gz
# links alternative
alternative=(w3m lynx links)
index=( ${!alternative[*]} )
for i in ${index[*]} ; do /usr/sbin/alternatives --install /usr/bin/lynk lynk /usr/bin/${alternative[$i]} $((50+i)) --slave /usr/share/man/man1/lynk.1.gz lynk-man /usr/share/man/man1/${alternative[$i]}.1.gz ; done

