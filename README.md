# Subister
> alert: subister is under development and not complete, Help us complete it 🤍

> info: subister uses different tools to find subdomains 🔎

## Requirements
* assetfinder -> [github](https://github.com/tomnomnom/assetfinder)
  * `go install github.com/tomnomnom/assetfinder@latest` 
* subfinder -> [github](https://github.com/projectdiscovery/subfinder)
  * `go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest`
* amass -> [github](https://github.com/OWASP/Amass)
  * `go install -v github.com/OWASP/Amass/v3/...@master`
* httpx -> [github](https://github.com/projectdiscovery/httpx)
  * `go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest`
* httprobe -> [github](https://github.com/tomnomnom/httprobe)
  * `go install github.com/tomnomnom/httprobe@latest`
* findomain -> [github](https://github.com/Findomain/Findomain)
  * [Learn install](https://github.com/Findomain/Findomain/blob/master/docs/INSTALLATION.md#installation-in-linux-using-compiled-artifacts) 
  
## Basic Usage
Just give the domain to subister
```bash
sudo cp subister.sh /bin/subister
mkdir targetname
cd targetname
subister target.com
```
