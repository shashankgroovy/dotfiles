COMMON := nvim vim git starship mise alacritty tmux atuin ssh
MAC    := zsh aerospace karabiner
LINUX  := i3 polybar dunst rofi zathura kitty
STOW   := stow -t $(HOME)
FONT   := https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.tar.xz

.PHONY: mac linux submodules brew fonts-linux terminfo stow-mac stow-linux unstow-mac unstow-linux mise

mac: submodules brew stow-mac terminfo mise
linux: submodules fonts-linux stow-linux mise

submodules:
	git submodule update --init

brew:
	brew bundle --file=mac/Brewfile

fonts-linux:
	mkdir -p $(HOME)/.local/share/fonts/Iosevka
	curl -fsSL $(FONT) | tar -xJ -C $(HOME)/.local/share/fonts/Iosevka
	fc-cache -f

terminfo:
	mkdir -p $(HOME)/.terminfo/61
	cp /Applications/Alacritty.app/Contents/Resources/61/alacritty* $(HOME)/.terminfo/61/

stow-mac:
	$(STOW) -d common $(COMMON)
	$(STOW) -d mac $(MAC)

stow-linux:
	$(STOW) -d common $(COMMON)
	$(STOW) -d linux $(LINUX)

unstow-mac:
	$(STOW) -D -d common $(COMMON)
	$(STOW) -D -d mac $(MAC)

unstow-linux:
	$(STOW) -D -d common $(COMMON)
	$(STOW) -D -d linux $(LINUX)

mise:
	mise install
