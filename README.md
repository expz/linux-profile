# Linux Profile

A linux profile with a considerate install script.

```
install

installs profile and saves existing files to backups copies in the same
directory with the suffix '-replaced-[DATE]'.

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
  + e.g., for making passwords `mkpassc LENGTH`
  + and encrypting `encrypt FILENAME`
  + and searching cmdfu repository `cmdfu SEARCH TERMS`
  + and ssh over rsync `ssync SOURCE_DIR USER@DESTINATION_IP:DESTINATION_DIR`
* user __bin directory__ with a few scripts:
  + especially a __nifty ftp transfer script__ `ftpcmd`

## Installation

### Fedora First-Time Setup (Optional)

1. Edit `~/init/config.sh` to set configuration variables.

2. Run `sudo ~/init/setup-fedora-root-1`. Then reboot if you are installing ZFS (or ZFS for docker).

3. Run `sudo ~/init/setup-fedora-root-2`.

4. Run `~/init/setup-fedora-user` as non-root user.

### Linux Profile

```
cd ~
git clone --depth=1 --branch=master --recursive \
  https://gitlab.com/expz/linux-profile.git
chmod 744 linux-profile/install.sh
./linux-profile/install.sh
```

Then give .bashrc a quick check to see whether any lines (esp. directories to 
add to the path) should be uncommented.
