# .zlogin


UNAME=/usr/bin/uname
OS=$(${UNAME} -s)
ARCH=$(${UNAME} -m)
GREP=/usr/bin/grep

if [ `echo $- | ${GREP} -i -c i` = 1 ] 
then

	if [ -f ~/.alias ]
	then
		. ~/.alias
	fi

	if [ -e /usr/bin/sed ]
	then
		SED=/usr/bin/sed
	fi

	CHMOD=/usr/bin/chmod
	TMPDIR=/var/tmp
	MAKE=/usr/bin/make
	MKDIR=/usr/bin/mkdir
	TTY=/usr/bin/tty
	KEYCHAIN=/usr/bin/keychain

	_tty=`${TTY} | ${SED} -e 's/\/.*\///g'`
	HISTDIR=$HOME/.history/`hostname`/`tty | ${SED} -e 's/\/.$//' | ${SED} -e 's/\/.*\///g'`
	if [ ! -d ${HISTDIR} ]
	then
		${MKDIR} -p ${HISTDIR}
	fi
	HISTFILE=$HISTDIR/${_tty}
	HISTSIZE=5000
	SAVEHIST=${HISTSIZE}

	setopt HIST_IGNORE_SPACE
	setopt HIST_IGNORE_DUPS
	setopt HIST_FCNTL_LOCK

	export HISTCONTROL HISTFILE HISTDIR HISTSIZE HIST_IGNORE_SPACE HIST_IGNORE_DUPS 
	export SAVEHIST HIST_FCNTL_LOCK

	autoload -U colors && colors

	if [ $(logname) = 'root' ]
	then 
		PS1="%F{green}%n%{$reset_color%}@%m %F{green}%(3~|../%2~|%~)%{$reset_color%} %# "
	else
		PS1="%F{red}%n%{$reset_color%}@%m %F{green}%(3~|../%2~|%~)%{$reset_color%} %# "
	fi

	if [ -e ${KEYCHAIN} ]
	then
		eval `${KEYCHAIN} --eval id_ed25519`
	fi

	CDPATH=.:$HOME:/var
	PROMPT_DIRTRIM=2
	EDITOR=/usr/bin/vi
	LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64
	LESS="ReMis"
	LESSHISTFILE="-"
	MAILCHECK=0
	MANPATH=/usr/kerberos/man:/usr/share/man/de:$MANPATH
	PAGER=/usr/bin/less
	PATH=$PATH:/sbin:/usr/sbin:$HOME/bin:$HOME/mongoDB/bin:.
	PGPPATH=$HOME/.gnupg

	export CDPATH LESS PAGER MAKE PGPPATH EDITOR
	export LESSHISTFILE PROMPT_DIRTRIM MAILCHECK PS1


	##
	#
	# JAVA Stuff
	#
	## 
	CLASSPATH=${CLASSPATH}:.

	export CLASSPATH
fi

#
##
## Sprach- und Kodierungssettings
##
#
unset LANG
LC_ALL="en_US.UTF-8"

export LC_ALL
