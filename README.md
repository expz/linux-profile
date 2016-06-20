A linux profile with a considerate install script.

```
install.sh

installs profile and saves existing files to backups copies in the same
directory with the suffix '-replaced-[DATE]'.

If there are errors, make sure you executed a recursive clone of the git repo:

  git clone --recursive https://github.com/expz/linux-profile.git
  (or retroactively: git submodule update --init --recursive)

usage: install.sh [--clean|--only-clean|--help]

--clean       install and delete backup copies
--only-clean  only delete backup copies (confirm each deletion)
--help        display this message
```

Includes:

* vim with a conservative config and a few vundle plugins (many more can be uncommented in .vimrc)
* bashrc with a few functions, e.g., for making passwords and encrypting
* user bin directory with a few scripts, *especially an ftp transfer script `ftpcmd`*

To install:

```
cd ~
git clone --depth=1 --branch=master --recursive \
  https://gitlab.com/expz/linux-profile.git
chmod 744 linux-profile/install.sh
./linux-profile/install.sh
```

Then give .bashrc a quick check to see whether any lines (esp. directories to 
add to the path) should be uncommented.
