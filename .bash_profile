# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# fedora22 ~/.bashrc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

#greg
# export PATH=$HOME/.cabal/bin:$PATH
# /etc/profile.d/cabalinstall.sh does it for me
export HISTSIZE=50000

export EDITOR=v

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export 


#greg
# screen needs 700 on socketdir?
if [ "$(uname)" == "CYGWIN_NT-6.1" ]; then
	export SCREENDIR=/cygdrive/c/temp
	if [ ! -d $SCREENDIR ]; then
		mkdir $SCREENDIR
	fi
	chmod 700 $SCREENDIR
fi


# export DESKTOP_SESSION=xmonad-gnome
# .bashrc
