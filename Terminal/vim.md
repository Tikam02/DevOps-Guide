# Vim zero to one

No matter if you're a DevOps engineer, developer, or Linux enthusiast, knowing Vim helps you navigate and edit files efficiently from the terminal—especially when working on remote servers where GUI editors aren’t available.

This cheat sheet will help you get started and become productive with Vim 👇

---

## 🧠 What is Vim?

Vim (Vi IMproved) is a highly configurable terminal-based text editor used for efficient text editing. It comes pre-installed on most UNIX systems.

---

## 🚀 Opening and Exiting Vim

| Command | Description |
|--------|-------------|
| `vim filename` | Open file in Vim |
| `:q` | Quit (only if no changes) |
| `:q!` | Quit without saving |
| `:w` | Save file |
| `:wq` or `ZZ` | Save and quit |
| `:x` | Save and quit (same as `:wq`) |

---

## ✍️ Basic Modes

| Mode | Description |
|------|-------------|
| `Normal` | Default mode (for navigation and commands) |
| `Insert` | Press `i`, `I`, `a`, `A`, `o`, or `O` to enter |
| `Visual` | Use `v`, `V`, or `Ctrl+v` to select text |
| `Command-line` | Use `:` to enter commands |

Press `Esc` anytime to return to **Normal mode**.

---

## 🔡 Insert Mode Shortcuts

| Key | Description |
|-----|-------------|
| `i` | Insert before cursor |
| `I` | Insert at the beginning of the line |
| `a` | Insert after cursor |
| `A` | Insert at the end of the line |
| `o` | Open new line below |
| `O` | Open new line above |

---

## 🎯 Navigation

| Key | Description |
|-----|-------------|
| `h`, `j`, `k`, `l` | Move left, down, up, right |
| `w`, `W` | Jump by word |
| `b`, `B` | Jump back by word |
| `0` | Start of line |
| `^` | First non-blank character of line |
| `$` | End of line |
| `gg` | Go to beginning of file |
| `G` | Go to end of file |
| `:n` | Go to line number `n` |

---

## 📋 Copy, Paste, Delete

| Command | Action |
|---------|--------|
| `yy` | Yank (copy) line |
| `dd` | Delete line |
| `p` | Paste below |
| `P` | Paste above |
| `x` | Delete character |
| `u` | Undo |
| `Ctrl+r` | Redo |

---

## 🔍 Searching

| Command | Description |
|---------|-------------|
| `/word` | Search forward |
| `?word` | Search backward |
| `n` | Repeat search forward |
| `N` | Repeat search backward |

---

## 🛠️ Replace

| Command | Description |
|---------|-------------|
| `r<char>` | Replace one character |
| `R` | Enter replace mode |
| `:%s/old/new/g` | Replace all in file |
| `:s/old/new/g` | Replace all in current line |

---

## 📁 Working with Files

| Command | Description |
|---------|-------------|
| `:e filename` | Open another file |
| `:ls` | List open buffers |
| `:b2` | Switch to buffer 2 |
| `:w newfile` | Save as new file |

---

## 🧩 Plugins (Optional)

Use a plugin manager like `vim-plug` to extend Vim:

```vim
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'         " File explorer
Plug 'junegunn/fzf.vim'           " Fuzzy finder
call plug#end()
```

---

## 📚 Resources

- [Vim Official Website](https://www.vim.org)
- [Interactive Tutorial](https://www.openvim.com)
- [Cheat Sheet](https://vim.rtorr.com)
- `:help` in Vim to access built-in documentation
