#!/usr/bin/bash

# Fix problems of directories
here="`dirname "$0"`"
cd "$here"
# colors
orange='\e[93m'
yellow='\e[93m'
green='\e[92m'
red='\e[91m'
end='\e[0m'
bgred='\e[41m'
bold='\e[1m'
bwhite='\e[1;97m'
# Status
correct="[\e[1m\e[92;1m ✔ $end]"
incorrect="[\e[1m\e[91;1m ✘ $end]"

_install_pip(){
  run="$1 install $2 --user"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $2" || echo -e "$incorrect Error in install of: $2" 
}

_install_git(){
  cd "/workspace"
  run="git clone $1"
  echo -e "Run: $orange$run$end"
  eval "$run" && echo -e "$correct Installed(s): $1" || echo -e "$incorrect Error in install of: $1" 
  cd "$here"
}
_run(){
  echo -e "Run: $orange$1$end"
  eval "$1" && echo -e "$correct $1" || echo -e "$incorrect $1" 
}


_install_pip 'pip3' 'cython'
# Operative-framework
#_run 'go get github.com/graniet/operative-framework'
# Install D4N155
_install_git 'https://github.com/OWASP/D4N155.git'
_install_pip 'pip3' '-r /workspace/D4N155/requirements.txt'
# Install Sherlock
_install_git 'https://github.com/sherlock-project/sherlock.git'
_install_pip 'pip3' '-r /workspace/sherlock/requirements.txt'
# Install PhoneInfoga
_install_git 'https://github.com/sundowndev/PhoneInfoga'
_run 'go build -o /workspace/PhoneInfoga/phoneinfoga /workspace/PhoneInfoga/main.go'
# Install Karma'
_install_pip 'pip3' 'git+https://github.com/decoxviii/karma.git --upgrade'
# Install SE Toolkit 
_install_git 'https://github.com/trustedsec/social-engineer-toolkit.git'
_install_pip 'pip3' '-r /workspace/social-engineer-toolkit/requirements.txt'
# Install Recon-ng
_install_git 'https://github.com/lanmaster53/recon-ng.git'
_install_pip 'pip3' '-r /workspace/recon-ng/REQUIREMENTS'
# Install The Harvester
_install_git 'https://github.com/laramies/theHarvester.git'
_run "apk add build-base"
_run "cd /workspace/theHarvester/;pip3 install -r requirements/base.txt;cd $here"
_run "apk del build-base"
# Install Cr3dOv3r
_install_git 'https://github.com/D4Vinci/Cr3dOv3r.git'
_install_pip 'pip3' '-r /workspace/Cr3dOv3r/requirements.txt'
# Install DNSRecon
_install_git 'https://github.com/darkoperator/dnsrecon.git'
_install_pip 'pip2' '-r /workspace/dnsrecon/requirements.txt'
# Install Buster
_install_git 'https://github.com/sham00n/buster.git'
_install_pip 'pip3' 'numpy'
_run "cd /workspace/buster;python3 setup.py install;cd $here"
# Install Whois
_run 'apk add whois nmap'
# Install osrframework
_install_pip 'pip3' 'osrframework'
_run 'wget https://raw.githubusercontent.com/i3visio/osrframework/master/config/general.cfg -O ~/.config/OSRFramework/default/general.cfg'
_run 'wget https://raw.githubusercontent.com/i3visio/osrframework/master/config/browser.cfg -O /root/.config/OSRFramework/default/browser.cfg'
_run 'wget https://raw.githubusercontent.com/i3visio/osrframework/master/config/accounts.cfg -O ~/.config/OSRFramework/default/accounts.cfg'
# Install InstagramOsint
_install_git 'https://github.com/sc1341/InstagramOSINT.git'
_install_pip 'pip3' '-r /workspace/InstagramOSINT/requirements.txt'
# Install Datasploit
_install_git 'https://github.com/dvopsway/datasploit.git'
_install_pip 'pip2' '--force-reinstall -r /workspace/datasploit/requirements.txt'
# Install Cloudfail
_install_git 'https://github.com/m0rtem/CloudFail.git'
_install_pip 'pip3' '-r /workspace/CloudFail/requirements.txt'
# Install WAFW00f
_install_git 'https://github.com/EnableSecurity/wafw00f.git'
_run "cd /workspace/wafw00f;python3 setup.py install;cd $here"
# Install OWASP Maryam
_install_git 'https://github.com/saeeddhqan/Maryam.git'
_install_pip 'pip2'  '-r /workspace/Maryam/requirements'
# Install Metabigor
_run 'go get -u github.com/j3ssie/metabigor'
# Installing getrails
_install_git 'https://github.com/Vault-Cyber-Security/getrails-tool.git'
_install_pip 'pip3' '-r /workspace/getrails-tool/requirements.txt'
# Install SocialScan
_install_pip 'pip3' 'socialscan'

# Install editor
_run 'apk add vim'

./set-banner.sh
