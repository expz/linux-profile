# Linux Profile

To install:

```
$ cd ~
$ git clone https://gitlab.com/expz/linux-profile.git
$ chmod 744 linux-profile/install.sh
$ ./linux-profile/install.sh
```

Then give .bashrc a quick check to see whether any lines (esp. directories to add to the path) should be uncommented.

### Misc

On flavors of Ubuntu, to make audio equalizer load on startup, add

> load-module module-equalizer-sink
> load-module module-dbus-protocol

to `/etc/pulse/default.pa`.
