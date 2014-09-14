# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

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

# export DESKTOP_SESSION=xmonad-gnome
