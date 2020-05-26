#
#
#custom functions
#
# update-grub
update-grub() {
	sudo grub-mkconfig -o /boot/grub/grub.cfg
}

# Enviromnent variable avaliable for D-bus apps
dbus-update-activation-environment --systemd --all

# disable shortcuts of terminal when running vim
# disable terminal only 

# No ttyctl, so we need to save and then restore terminal settings
vim()
{
   local STTYOPTS="$(stty --save)"
   stty stop '' -ixoff
   command vim "$@"
   stty "$STTYOPTS"
}

nvim()
{
   local STTYOPTS="$(stty --save)"
   stty stop '' -ixoff
   command nvim "$@"
   stty "$STTYOPTS"
}
ranger()
{
   local STTYOPTS="$(stty --save)"
   stty stop '' -ixoff
   command ranger "$@"
   stty "$STTYOPTS"
}

# use sudovim to write in sudoedit
 sudovim()
 {
     local STTYOPTS="$(stty --save)"
     stty stop '' -ixoff
     command sudoedit "$@"
     stty "$STTYOPTS"
 }


############################################################
############################################################
#################### Function Sudocode  ####################  

# use code for sudo editing
# Should be put in a cript
sudocode(){
   
   # check of enteries
   if [ $# -eq 0 ]
     then
       echo "No arguments supplied"
       return 
   fi

   # variable to store all files string
   files=""

   # loop through filenaems and concatenate them together
   for file in $@
   do
      files="$files $file "
   done
   
   # open files in code
   SUDO_EDITOR="code -w" sudo -e $files
}


# cs50 make
make50()
{
    clang -o "$1" "$2" -lcs50
}
