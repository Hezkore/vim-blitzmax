# BlitzMax for Vim

[Vim](https://www.vim.org) plugin that provides [syntax highlighting](https://vimhelp.org/syntax.txt.html#%3Asyn-qstart), indentation, [error matching](https://vimhelp.org/quickfix.txt.html#quickfix-window), [Ctags](https://vimhelp.org/tagsrch.txt.html#tag-commands), [tagbar scopes](https://github.com/preservim/tagbar) and [compiler options](https://vimhelp.org/quickfix.txt.html#%3Amake_makeprg) for [BlitzMax](https://blitzmax.org).

![Tag Image](https://github.com/Hezkore/vim-blitzmax/blob/main/demo.gif?raw=true)

## Installation
| Method        | Instructions
| ------------- | ------
| Vim 8 package | `git clone https://github.com/Hezkore/vim-blitzmax ~/.vim/pack/hezkore/start/bmx`
| Manual        | Copy files to `~/.vim/` on Unix or `%USERPROFILE%\vimfiles\` on Windows

Open or create the `vimrc` file in `~/.vim/` on Unix or `%USERPROFILE%\vimfiles\` on Windows and add\
`let g:blitzmax_path=<your blitzmax path>`

## Learning Vim
Install [Vim](https://www.vim.org/download.php) and run the [vimtutor](https://vimhelp.org/usr_01.txt.html#vimtutor).\
Alternatively you can read the online documentations at [vimhelp.org](https://vimhelp.org/).

## Compiling
Opening a `.bmx` file will set the Vim compiler to `bmk`\
You can manually set it if needed with  the command `:compiler bmk`\
Use the command `:make <blitzmax bmk operation> [blitzmax bmk options]` to build your executable.\
For example `:make makeapp -x %` to compile the current file _(`%`)_ and execute it _(`-x`)_.

Or something more advanced `:make makeapp -d -t console -w -a -x -o %<.debug %`\
This will create a debug console application.

Add `nnoremap <F5> :make makeapp -d -t console -w -a -x -o %<.debug %<CR>` to your `vimrc` for a quick way of compiling a debug console application by pressing <kbd>F5</kbd>.

You can read more about the BlitzMax bmk compile operations and options [here](https://blitzmax.org/docs/en/tools/bmk/), and about Vim's `make` command [here](https://vimhelp.org/quickfix.txt.html#%3Amake_makeprg).

## Debugging
Use the command `:clist` `:cl` or `:copen` `:cw` to view any compiling warnings or errors.\
`:cnext` `:cn` and `:cprev` `:cp` will move to the next and previous problem respectively.\
More about Vim's quickfix view can be found [here](https://vimhelp.org/quickfix.txt.html#quickfix-window).

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

## Ctags and tagbar
The [tagbar plugin](https://github.com/preservim/tagbar) is supported right out of the box.

![Tagbar Image](https://github.com/Hezkore/vim-blitzmax/blob/main/demo.png?raw=true)

You can generate your own ctags with the command `:MakeBmxCtags`\
This will generate ctags for the file in the current buffer, files in the same folder, as well as sub-folders.\
`:MakeBmxCtags` also accepts a path, for example `:MakeBmxCtags ~/Code/MyBmxProject`

Use `:MakeBmxModuleCtags` to generate ctags for all your BlitzMax modules.\
Remember to add `exe 'set tags+='.g:blitzmax_path.'/mod/tags'` to your `vimrc` file in order to match tags from your modules.

You can read more about Vim tags [here](https://vimhelp.org/tagsrch.txt.html).

## FAQ
* **Q: I'm getting `Error creating Ctags!` when creating ctags.**
	* A: The `MakeBmxCtags` commands relies on the external program 'ctags', which you can find [here](https://github.com/universal-ctags/ctags#universal-ctags).
* **Q: The compiler, tagbar and ctags don't match/update with my code.**
	* A: The document is read from disk, you'll have to save _(`:w`)_ first!
* **Q: Jumping to a tag jumps to the wrong location.**
	* A: You can press <kbd>g</kbd> <kbd>]</kbd> to view multiple tag matches.\
	You can read more about Vim tags [here](https://vimhelp.org/tagsrch.txt.html).
* **Q: Jumping to a tag makes me lose my current document.**
	* A: You can use <kbd>Ctr</kbd> + <kbd>t</kbd> to jump a step back in the tag stack.\
	Alternatively, use <kbd>Ctr</kbd> + <kbd>W</kbd> <kbd>]</kbd> or <kbd>Ctrl</kbd> + <kbd>W</kbd> <kbd>g</kbd> <kbd>]</kbd> to open the tag in a split view.\
	You can read more about Vim tags [here](https://vimhelp.org/tagsrch.txt.html).
* **Q: Tags from my modules aren't matched.**
	* A: Make sure you've added `exe 'set tags+='.g:blitzmax_path.'/mod/tags'` to your `vimrc` file, and that you've called `:MakeBmxModuleCtags` at least once.
* **Q: I'm getting `Undefined variable: g:blitzmax_path` at start.**
	* A: If you've added `exe 'set tags+='.g:blitzmax_path.'/mod/tags'` to your `vimrc` file, then make sure it's entered _after/below_ the `let g:blitzmax_path=<your blitzmax path>` line.
* **Q: I'm having other issues with the plugin.**
	* A: Post your issue in the [GitHub issues](https://github.com/Hezkore/vim-blitzmax/issues) section.