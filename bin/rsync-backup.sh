########################################
#                                      #
# ~/rsync-backup.sh		               #
#  Jonathan Skowera                    #
#                                      #
#  This script executes a simple rsync #
#  backup of my entire home directory. #
#  The list of excluded files is in    #
#  $HOME/bin/exclude-list 		           #
#                                      #
#  NOTE: The change directory is to    #
#    make the exclude-list work        #
#                                      #
########################################

backupdir=/media/FreeAgent\ GoFlex\ Drive/rsync

cd ~/..

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/bin "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Desktop "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Documents "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Downloads "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Favorites "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Music "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/public_html "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Pictures "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/src "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Toolbar "${backupdir}"

rsync -av --delete-after --exclude-from=$HOME/bin/exclude-list ~/Videos "${backupdir}"
