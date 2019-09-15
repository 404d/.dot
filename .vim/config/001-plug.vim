let s:IWantPlug=1
let g:VimPlugDir=expand('~/.vim/autoload/plug.vim')
if !filereadable(VimPlugDir)
    echo "Installing vim-plug.."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !mkdir -p ~/.vim/bundle
    silent !wget --quiet -O ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let s:IWantPlug=0
endif

set rtp+=$HOME/.vim/autoload/plug.vim

call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-plug'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'nathanaelkane/vim-indent-guides'
Plug '404d/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
"Plug 'szw/vim-ctrlspace'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Gundo'
Plug 'myusuf3/numbers.vim'
Plug 'Lokaltog/vim-easymotion'
"Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer', 'for': ['c', 'cpp', 'python']}
Plug 'goldfeld/vim-seek'
Plug 'haya14busa/incsearch.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'terryma/vim-multiple-cursors'
Plug 'zhaocai/GoldenView.Vim'
"Plug 'jceb/vim-orgmode'
"Plug 'chrisbra/SudoEdit.vim'
if has("nvim") || !has("python3")
    Plug 'vim-airline/vim-airline'
endif
if has("gui_running")
    Plug 'jeaye/color_coded'
endif
"Plug 'jaxbot/github-issues.vim' | Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-fugitive'
"Plug 'tybenz/vimdeck', {'do': 'gem install vimdeck'} | Plug 'vim-scripts/SyntaxRange'
"Plug 'puppetlabs/puppet-syntax-vim', {'for': 'puppet'}
Plug 'rodjek/vim-puppet', {'for': 'puppet'}

Plug 'rust-lang/rust.vim', {'for': 'rust'}

Plug 'tpope/vim-markdown', {'for' : 'markdown'}

Plug 'PotatoesMaster/i3-vim-syntax', {'for' : 'i3'}

Plug 'kovisoft/paredit', {'for' : ['hy', 'lisp']}
Plug 'hylang/vim-hy', {'for' : 'hy'}
Plug 'tpope/vim-fireplace', {'for' : ['clojure', 'hy']}

Plug 'fatih/vim-go', {'for' : 'go'}

Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'lukaszkorecki/CoffeeTags', {'for': 'coffee'}

Plug 'marijnh/tern_for_vim', {'for' : ['javascript', 'coffee']}

Plug 'syngan/vim-vimlint', {'for':  'vim'} | Plug 'ynkdir/vim-vimlparser'

Plug 'lervag/vimtex', {'for': 'tex'}

Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}

Plug 'jdonaldson/vaxe', {'for': 'haxe'}

"Plug 'klen/python-mode', {'for': 'python'}

Plug 'jeroenbourgois/vim-actionscript', {'for': 'actionscript'}

Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}

Plug 'alisdair/vim-armasm', {'for': 'asm'}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

if s:IWantPlug == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PlugUpdate
endif
