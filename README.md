# Linux Profile

A linux profile with a considerate install script and a conservative vim configuration.

```
install

installs the following files and folders:

  ~/.vim
  ~/.vundle
  ~/.vimrc
  ~/.bashrc
  ~/.pystartup

while saving existing files first to backups copies in the same
directory with the suffix '-replaced-[TIMESTAMP]'.

also copy scripts from the bin directory into ~/bin.

If there are errors, make sure you executed a recursive clone of the git repo:

  git clone --recursive https://github.com/expz/linux-profile.git
  (or retroactively: git submodule update --init --recursive)

usage: install [--clean|--only-clean|--help]

--clean       install and delete backup copies
--only-clean  only delete backup copies (confirm each deletion)
--help        display this message
```

## Contents

* __fedora setup scripts__ for first-time fedora configuration
  + asks for confirmation at each step
* __vim config__ in conservative form with a few vundle plugins (many more can be uncommented in .vimrc)
* __bashrc__ with a few functions
  + e.g., for making passwords `mkpass LENGTH`
  + and encrypting `encrypt FILENAME`
  + and searching cmdfu repository `cmdfu SEARCH TERMS`
  + and running a jupyter notebook in the current directory `tensorflow`
  + changes `*` to match dot-files
  + changes `ls` to add `-A` and `--group-directories-first`
* user __bin directory__ with a few scripts

## Installation

### Fedora First-Time Setup (Optional)

1. Edit `~/init/config.sh` to set configuration variables.

2. Run `sudo ~/init/setup-fedora-root-1`. Then reboot if you are installing ZFS (or ZFS for docker).

3. Run `sudo ~/init/setup-fedora-root-2`.

4. Run `~/init/setup-fedora-user` as non-root user.

### Linux Profile

The install script backs up the current `~/.pystartup`, `~/.bashrc`, `~/.vimrc`, `~/.vim/` and `~/.vundle/` by appending a suffix like `-replaced-YYYY-MM-DD`. Then it copies new versions in their place.

```
cd ~
git clone --depth=1 --branch=master --recursive \
  https://gitlab.com/expz/linux-profile.git
chmod 744 linux-profile/install
./linux-profile/install
```

Then give .bashrc a quick check to see whether any lines (esp. directories to 
add to the path) should be uncommented.

### Vim Plugin Dependencies (Optional)

If you did not run the Fedora First-Time Setup scripts, then a few packages need to be manually installed for some vim plugins to work. This is explained below.

#### Python

To enable python style checking (automatic on file load) and autoformatting (`:Autoformat` command), run
```
python3 -m pip install flake8 yapf
```

#### Javascript

To enable Javascript style checking and autoformatting, run
```
sudo npm install -g jshint js-beautify
```
This requires `npm` (node package manager), which can be installed on Ubuntu with `sudo apt-get install nodejs npm`.
