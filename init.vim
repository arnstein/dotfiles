" Arnsteins nvim init file

let installPlug=1
let plug_file=expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(plug_file)
    echo "Installing plugin manager"
    !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let installPlug=0
    echo "Done installing plugin manager!"
endif

call plug#begin()
Plug 'arnstein/yoctolog.vim' "Yocto log syntax

if installPlug == 0
    echo "Installing plugins, please ignore key map error messages"
    :PlugInstall
endif
call plug#end()
