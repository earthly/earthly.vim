# Earthfile syntax highlighing

Syntax highlighting for [Earthly](https://earthly.dev) Earthfiles for Vim.

For an introduction of Earthly see the [Earthly GitHub repository](https://github.com/earthly/earthly) or the [Earthly documentation](https://docs.earthly.dev).

## Installation Notes

Use your favorite plugin manager and ensure vim syntax highlighting is turned on.

### Vim-Plug

Using the [vim-plug](https://github.com/junegunn/vim-plug) plugin manager, add:

    Plug 'earthly/earthly.vim', { 'branch': 'main' }

Then run

    :PlugInstall

### Pathogen

    git clone git@github.com:earthly/earthly.vim.git ~/.vim/bundle/earthly

### Manual

To install manually, copy `syntax/Earthfile.vim` to `~/.vim/syntax/Earthfile.vim`.

Now write the following into the file at `~/.vim/ftdetect/Earthfile.vim`

```vim
au BufRead,BufNewFile Earthfile set filetype=Earthfile
au BufRead,BufNewFile build.earth set filetype=Earthfile
```

#### Neovim

Neovim users will have to change the `~/.vim/` prefix in the above steps to `~/.config/nvim`.

## Screenshot

![Java example Earthfile in Vim](Screenshot.png)
