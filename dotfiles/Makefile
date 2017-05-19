all: uninstall install

install:
	ln -s $$PWD/vim/vimrc $$HOME/.vimrc
	ln -s $$PWD/vim $$HOME/.vim
	ln -s $$PWD/zsh/zshrc $$HOME/.zshrc
	ln -s $$PWD/zsh $$HOME/.zsh
	@curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh || echo "neobundle is allready installed"

uninstall:
	rm -f $$HOME/.vimrc
	rm -Rf $$HOME/.vim
	rm -f $$HOME/.zshrc
	rm -Rf $$HOME/.zsh
