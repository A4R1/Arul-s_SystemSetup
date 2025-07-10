# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#starship
if [ -x /usr/bin/starship ]; then
	__main() {
		local major="${BASH_VERSINFO[0]}"
		local minor="${BASH_VERSINFO[1]}"

		if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
			source <("/usr/bin/starship" init bash --print-full-init)
		else
			source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
		fi
	}
	__main
	unset -f __main
fi


## ls aliases for exa
alias ls='exa -al --color=always --group-directories-first --icons'     # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'      # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'      # long format
alias lt='exa -aT --color=always --group-directories-first --icons'     # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles


# alternatives
alias cat='bat --style header --style snip --style changes --style header'


# aliases
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/garuda-update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias ip='ip -color'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias halpmenoob='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # Cleanup orphaned packages
alias jctl="journalctl -p 3 -xb" # Get the error messages from journalctl
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" # Recent installed packages


# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"


# things to source, also remeber this is bash
source /usr/share/doc/find-the-command/ftc.bash # Advanced command-not-found hook
# source /opt/ros/humble/setup.bash


# Startup Commands
fastfetch --kitty-direct /home/a4r1/Pictures/WasHere/ArulWhite.png
# fastfetch -l garuda
# cowsay -f stegosaurus "I tip my hat to you, One legend to another"
cowsay -f stegosaurus "Hello, Good Sir!"