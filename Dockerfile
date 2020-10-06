FROM kalilinux/kali-rolling

# Setup enviroment
RUN mkdir /opt/osint
RUN apt update && apt-get install -y tor python python3-pip curl wget git golang \
  && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
  && python get-pip.py && rm get-pip.py \
  && wget -O /opt/osint/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz \
  && tar -C /opt/osint/ -xvf /opt/osint/geckodriver.tar.gz \
  && rm -rf /opt/osint/*tar.gz

RUN pip3 install pip --upgrade
RUN pip2 install pip --upgrade
ENV PATH /usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin:/packages/src:/usr/local/go/bin:/opt/osint:/go/bin

# Copy scripts
COPY . /opt/osint
WORKDIR /workspace

## Install and Setup Tools

#RUN bash /opt/osint/install-osint.sh
RUN pip3 install cython --user --upgrade

# Operative-framework
#RUN go get github.com/graniet/operative-framework

# Install D4N155
RUN git clone https://github.com/OWASP/D4N155.git && \
    pip3 install -r /workspace/D4N155/requirements.txt --user

# Install Sherlock
RUN git clone https://github.com/sherlock-project/sherlock.git && \
    pip3 install -r /workspace/sherlock/requirements.txt --user

# Install PhoneInfoga
RUN mkdir PhoneInfoga && cd PhoneInfoga && \
    wget "https://github.com/sundowndev/phoneinfoga/releases/download/v2.3.2/phoneinfoga_$(uname -s)_$(uname -m).tar.gz" && \
    tar xfv "phoneinfoga_$(uname -s)_$(uname -m).tar.gz" && \
    mv ./phoneinfoga /usr/bin/phoneinfoga

# Install SE Toolkit 
RUN git clone https://github.com/trustedsec/social-engineer-toolkit.git setoolkit/ && \
    cd setoolkit && \
    pip3 install -r requirements.txt && python3 setup.py

# Install Recon-ng
RUN git clone https://github.com/lanmaster53/recon-ng.git && \
    pip3 install -r /workspace/recon-ng/REQUIREMENTS --user

# Install The Harvester
RUN git clone https://github.com/laramies/theHarvester.git && \
    cd theHarvester && \
    pip3 install -r requirements/base.txt --user

# Install Cr3dOv3r
RUN git clone https://github.com/D4Vinci/Cr3dOv3r.git && \
    pip3 install -r /workspace/sherlock/requirements.txt --user

# Install DNSRecon
RUN git clone https://github.com/darkoperator/dnsrecon.git && \
    pip2 install -r /workspace/dnsrecon/requirements.txt --user

# Install Buster
RUN git clone https://github.com/sham00n/buster.git && \
    cd buster && \
    pip3 install numpy --upgrade && \
    python3 setup.py install

# Install Whois and Nmap
RUN apt-get install -y whois nmap

# Install osrframework
RUN pip3 install osrframework --upgrade
RUN wget https://raw.githubusercontent.com/i3visio/osrframework/master/config/general.cfg -O ~/.config/OSRFramework/default/general.cfg && \
    wget https://raw.githubusercontent.com/i3visio/osrframework/master/config/browser.cfg -O /root/.config/OSRFramework/default/browser.cfg && \
    wget https://raw.githubusercontent.com/i3visio/osrframework/master/config/accounts.cfg -O ~/.config/OSRFramework/default/accounts.cfg

# Install InstagramOsint
RUN git clone https://github.com/sc1341/InstagramOSINT.git && \
    pip3 install -r /workspace/InstagramOSINT/requirements.txt --user

# Install Cloudfail
RUN git clone https://github.com/m0rtem/CloudFail.git && \
    pip3 install -r /workspace/CloudFail/requirements.txt --user

# Install WAFW00f
RUN git clone https://github.com/EnableSecurity/wafw00f.git && \
    cd /workspace/wafw00f && python3 setup.py install

# Install OWASP Maryam
RUN git clone https://github.com/saeeddhqan/Maryam.git && \
    pip2 install -r /workspace/Maryam/requirements --user

# Install Metabigor
RUN go get -u github.com/j3ssie/metabigor

# Install getrails
RUN git clone https://github.com/Vault-Cyber-Security/getrails-tool.git && \
    pip3 install -r /workspace/getrails-tool/requirements.txt --user

# Install SocialScan
RUN pip3 install socialscan

# Install Datasploit
#RUN git clone https://github.com/dvopsway/datasploit.git && \
#    pip install --upgrade --force-reinstall -r /workspace/datasploit/requirements.txt --user

# Install Karma
#RUN pip3 install git+https://github.com/decoxviii/karma.git --upgrade --user

RUN bash /opt/osint/set-banner.sh

ENTRYPOINT /bin/bash
