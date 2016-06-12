dotfiles
========

The contents of the `symlink` directory will be linked into `$HOME`. The tool will try to be smart about not overwriting existing structure. It understands XDG, so a `.config` directory can be placed within `symlink` and the tool will attempt to create missing directories within the existing `.config`, back up conflicting directories and replace them with links.

The contents of the `copy` directory will be copied in the same fashion.

The contents of the `source` directory will be... well, yeah.
