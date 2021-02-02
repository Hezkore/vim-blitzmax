# BlitzMax for Vim

[Vim](https://www.vim.org) plugin that provides syntax highlighting, indentation, error matching and compiler options for [BlitzMax](https://blitzmax.org).

![Title Image](https://github.com/Hezkore/vim-blitzmax-support/blob/main/demo.png?raw=true)


## Installation
| Method        | Instructions
| ------------- | ------
| Vim 8 package | `git clone https://github.com/Hezkore/vim-blitzmax-support ~/.vim/pack/hezkore/start/bmx`
| Manual        | Copy files to `~/.vim/` on Unix or `%USERPROFILE%\vimfiles\` on Windows

Remember to open or create the `vimrc` file in `~/.vim/` on Unix or `%USERPROFILE%\vimfiles\` on Windows and add `let $PATH .= ':<Your BlitzMax Dir>/bin`.

## Learning Vim
Install [Vim](https://www.vim.org/download.php) and run the [vimtutor](https://vimhelp.org/usr_01.txt.html#vimtutor). \
Alternatively you can read the online documentations at [vimhelp.org](https://vimhelp.org/).

## Compiling
Use the command `:make <operation> [options]` to build your executable. \
For example `:make makeapp %`.


Or something more advanced `:make makeapp -d -t console -w -a -x -o %<.debug %` \
This will create a debug console application.

Add `nnoremap <F5> :make makeapp -d -t console -w -a -x -o %<.debug %<CR>` to your `vimrc` for a quick way of compiling a debug console application.

You can read more about the compile operations and options [here](https://blitzmax.org/docs/en/tools/bmk/).

## Debugging
Use the command `:clist` `:cl` or `:copen` `:cw` to view any compiling warnings or errors. \
`:cnext` `:cn` and `:cprev` `:cp` will move to the next and previous problem respectively. \
More information can be found [here](https://vimhelp.org/quickfix.txt.html#quickfix-window). \
\
The internal BlitzMax debugger is used for live-debugging.
| Key       | Action
| --------- | ------
| T         | Stack trace
| R         | Run from here
| S         | Step through source code
| E         | Step into function call
| L         | Leave function or local block
| Q         | Quit
| H         | Help text
| Dxxxxxxxx | Dump object at hex address xxxxxxxx