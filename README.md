Installazione
---

    :::bash
    $ git clone git@github.com:cenzino/vim.git ~/.vim
    $ ln -s ~/.vim/vimrc ~/.vimrc
    $ git submodule init
    $ git submodule update

Command-t

    :::bash
    $ cd ~/.vim/bundle/command-t/ruby/command-t
    $ ruby extconf.rb
    $ make

TagBar

    :::bash
    $ sudo apt-get install exuberant-ctags
