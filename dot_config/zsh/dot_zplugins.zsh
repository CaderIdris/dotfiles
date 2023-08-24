if [ ! -e ~/.local/share/znap/znap.zsh ]; then
	mkdir -p ~/.local/share/znap 
	git clone --depth 1 -- \
		https://github.com/marlonrichert/zsh-snap.git ~/.local/share/znap
fi

source ~/.local/share/znap/znap.zsh

znap source 'zsh-users/zsh-syntax-highlighting'
znap source 'zsh-users/zsh-history-substring-search'
znap source 'zsh-users/zsh-autosuggestions'
znap source 'jeffreytse/zsh-vi-mode'
znap source 'MichaelAquilina/zsh-auto-notify'
