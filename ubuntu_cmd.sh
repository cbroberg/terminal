#-------------- Change hostname id
sudo -i
sudo hostname hux.webhouse.net
sudo mate -f /etc/hosts 
	127.0.0.1 localhost + dns1

sudo hostnamectl set-hostname rey
sudo reboot

# The real deal should remember after reboot
sudo mate /etc/hostname
127.0.0.1 localhost HOSTNAME

#-------------- Remove directory with contents recursively
sudo rm -rf folderName

#-------------- Copy ssh key to remote server
ssh-copy-id cb@kanata-dev.webhouse.net


#-------------- Copy file from remote server to localhost
scp cb@kanata.webhouse.net:~/.bashrc ~/bashrc.backup.txt
scp cb@kanata.webhouse.net:/etc/hostname ~/hosting/hostname
scp odeum.tar.gz cb@kanata.webhouse.net:/srv/odeum/main
scp cb@192.168.1.120:~/.bash_aliases ~/.bash_aliases 
scp cb@192.168.1.120:~/.ssh/config ~/.ssh/config 
scp ~/.bash_aliases cb@192.168.1.131:
scp ~/.bashrc cb@192.168.1.131:

#-------------- .bash_aliases
alias pi='ssh pi@192.168.1.131'
export PS1="\[\033[38;5;3m\]\u@\[$(tput sgr0)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]> \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=cxfxcxdxbxegedabagacad
LS_COLORS=$LS_COLORS:'di=32:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:' ; export LS_COLORS

#-------------- .bashrc
# https://apple.stackexchange.com/questions/42537/why-must-i-source-bashrc-every-time-i-open-terminal-for-aliases-to-work 
# some more ls aliases
alias ll='ls -al'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#-------------- Set The Default Shell to Bash
chsh -s /bin/bash

#-------------- Shutdown or Reboot 
sudo reboot
sudo shutdown -r now
sudo shutdown -h now
sudo halt


#-------------- List all users capable of authenticating, including non-local 
cut -d: -f1 /etc/passwd

#-------------- Finding and listing stuff
find ./ | grep dbuser
locate senti.info
ls | grep fia


#-------------- Change access permissions to files/directories
chmod 700 executable-file
chmod 600 ssh-key


#-------------- Change file/directory ownership
chown -R cb: .cache/


#-------------- Change group ownership
chgrp -hR staff /office/files
chgrp -hR mb mb
groups user

#-------------- Create new text file
touch filename.txt
touch script.sh
touch javascript.js

#-------------- Modify a user account
# Append cb to group www-data/sudo users 
usermod -aG www-data cb
sudo usermod -aG sudo cb
sudo gpasswd -a cb www-data
groups cb

#-------------- Execute remote commands
ssh cb@kanata.webhouse.net 'uptime; df -h'
ssh cb@kanata.webhouse.net 'free -m | cat /proc/loadavg'
ssh cb@kanata.webhouse.net 'grep -i memtotal /proc/meminfo'
ssh deploy@organa.webhouse.net 'sudo /srv/nodejs/api-restart.sh'

ssh USER@HOST 'COMMAND1; COMMAND2; COMMAND3'
ssh USER@HOST 'COMMAND1 | COMMAND2 | COMMAND3'

$ ssh USER@HOST << EOF
COMMAND1
COMMAND2
COMMAND3
EOF

#-------------- Create executable symbolic link
sudo ln -s bash ~/hosting/scripts/push_aliases /usr/local/bin/
sudo ln -s /Applications/TextMate.app/Contents/Resources/mate ~/bin/matex
sudo ln -s /usr/local/bin/rmate /usr/local/bin/mate
sudo ln -s bash ~/apps/senti/senti-mqtt-client/update.sh /usr/local/bin/

#-------------- Compress/Extract tar gzip package
# Compress
tar -zcvf archive_name.tar.gz folder_to_compress
tar -zcvf scripts.tar.gz ~/hosting/scripts/

# Extract
tar -zxvf scripts.tar.gz


#-------------- Delete a file or directory recursively
rm -R test

#-------------- Update & Upgrade unattended
sudo apt -y -q update && sudo apt -y -q upgrade
sudo apt update
sudo apt upgrade

#-------------- Setting up rmate for remote editing with TextMate
# https://github.com/textmate/rmate/
# http://blog.macromates.com/2011/mate-and-rmate/

# On the remote server
sudo apt install ruby
sudo gem install rmate
sudo gem update rmate
p
# One time connection
ssh -R 52698:localhost:52698 cb@kanata.webhouse.net
ssh -R 52698:localhost:52698 pi@192.168.1.131
ssh -R 52698:localhost:52698 deploy@organa.webhouse.net
ssh -R 52698:localhost:52698 cb@skywalker.webhouse.net
ssh -R 52698:localhost:52698 cb@192.168.39.149

# SSH tunneling with localhost edit/create ~/.ssh/config 
Host *
RemoteForward 52698 localhost:52698

# Add this configuration to your /etc/ssh/sshd_config on the server:
GatewayPorts no
AllowTcpForwarding remote

# Install in 1 line
sudo apt -q -y install ruby && sudo gem install rmate && sudo gem update rmate && sudo ln -s /usr/local/bin/rmate /usr/local/bin/mate

# DNS zone files
/var/named/zone


#-------------- APPLE COMMANDS --------------

#APPLE CMD:
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
locate .bashrc

#-------------- Compress/Extract DMG gzip package
# Compress
hdiutil create -format UDZO -srcfolder scripts scripts.dmg

# Mount
hdiutil attach scripts.dmg

# View
ls -lah /Volumes/scripts/

# Eject
hdiutil eject /Volumes/scripts/

#-------------- Change /etc/sudoers file to allow sudo without pw
sudo chown root.root <my script>
sudo chmod 4755 <my script>

# insert the following lines in the file
Cmnd_Alias CMDS = /srv/nodejs/

deploy ALL=NOPASSWD: CMDS
cb ALL=NOPASSWD: CMDS
