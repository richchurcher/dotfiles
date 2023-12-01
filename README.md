```shell
chezmoi init git@github.com:richchurcher/dotfiles
chezmoi diff
chezmoi apply -v
```

Ongoing:

```shell
chezmoi update -v
```

Pushes to remote use:

```
chezmoi add <thing>
chezmoi cd
# normal git commands go here
```
