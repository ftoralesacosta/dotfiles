I tried to make this setup IDE-like, but with as few external dependancies as possible. The fuzzy finders (telescope and nvim-tree) really benefit from icons, as well as more modern grep implementations. For this reason, the following external dependancies are needed:
1. Need ripgrep to use grep in telescope. This must be installed on the machine that is running the instance of nvim
  - brew install ripgrep
2. Install nerdfonts on LOCAL terminal.
  - brew tap homebrew/cask-fonts
  - brew install --cask font-hack-nerd-font
