A linux profile.

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

To use the personalized settings for Eclipse, the `eclipse.ini` file should 
be copied to the directory containing the `eclipse` executable. 
