# Banner
banner="

\t\t ~$bwhite TOOLS $end~
\t$red We can help for install this framework [Update broken] → $bwhite Operative-framework$end: operative framework is a OSINT investigation framework
\t$bwhite D4N155$end: Intelligent and dynamic wordlist using OSINT
\t$bwhite Sherlock$end: Find usernames across social networks
\t$bwhite PhoneInfoga$end: Advanced information gathering & OSINT tool for phone numbers
\t$bwhite Karma$end: Find leaked emails with your passwords
\t$bwhite Recon-ng$end: Recon-ng is a full-featured Web Reconnaissance framework written in Python
\t$bwhite SE Toolkit$end: The Social-Engineer Toolkit
\t$bwhite The Harvester$end: E-mails, subdomains and names Harvester - OSINT
\t$bwhite Whois$end: Get whois data
\t$bwhite osrframework$end: Open Sources Research Framework
\t$bwhite R3dOv3r$end: Know the dangers of credential reuse attacks
\t$bwhite Buster$end: Find emails of a person and return info associated with them
\t$bwhite InstagramOsint$end: An Instagram Open Source Intelligence Tool 
\t$bwhite Datasploit$end: A tool to perform various OSINT techniques
\t$bwhite Cloudfail$end: Utilize misconfigured DNS and old database records to find hidden IPs behind the CloudFlare network
\t$bwhite Maryam$end: Is an Open-source intelligence(OSINT) and Web-based Footprinting modular/tool framework based on the Recon-ng and written in Python.
\t$bwhite Metabigor$end: Is Intelligence tool, its goal is to do OSINT tasks and more but without any API key.
\t$bwhite Getrails$end: Tool of OSINT and Dork hacking that work with Google, Duckduckgo and onion
\t$bwhite SocialScan$end: offers accurate and fast checks for email address and username usage on online platforms.
\t$bwhite Infoga$end: is a tool gathering email accounts informations (ip,hostname,country,...) from different public source (search engines, pgp key servers and shodan) and check if emails was leaked using haveibeenpwned.com API.

\ttype:$bwhite tools$end to show this message
"

# bashrc
wget https://raw.githubusercontent.com/vault-cyber-security/vault-bash/master/.bashrc -O .bashrc
cat .bashrc >> ~/.bashrc
echo -e "printf \"\"\"$banner\"\"\";alias tools='echo -e \"\"\"$banner\"\"\"'" >> ~/.bashrc