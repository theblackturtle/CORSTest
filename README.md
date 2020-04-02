# CORSTest
Main repo: https://github.com/RUB-NDS/CORStest

### A simple CORS misconfiguration scanner

**Based on the research of [James Kettle](https://twitter.com/albinowax)**

CORStest is a *quick & dirty* Python 2 tool to find Cross-Origin Resource Sharing ([CORS](https://www.w3.org/TR/cors/)) misconfigurations. It takes a text file as input which may contain a list of domain names or URLs. Currently, the following potential vulnerabilities are detected by sending a certain `Origin` request header and checking for the `Access-Control-Allow-Origin` response header:

- **Developer backdoor:** Insecure dev origins like JSFiddle or CodePen are allowed to access this resource
- **Origin reflection:** The origin is simply echoed in ACAO header, any site is allowed to access this resource
- **Null misconfiguration:** Any site is allowed to access by forcing the `null` origin via a sandboxed iframe
- **Pre-domain wildcard:** *not*domain.com is allowed access, which can simply be registered by an attacker
- **Post-domain wildcard:** domain.com.*evil.com* is allowed access, which can be registered by an attacker
- **Subdomains allowed:** *sub*.domain.com allowed access, exploitable if attacker finds XSS in any subdomain
- **Non-ssl sites allowed:** A http origin is allowed access to a https resource, allows MitM to break encryption
- **Invalid CORS header:** Wrong use of wildcard or multiple origins, not a security problem but should be fixed

Note that these vulnerabilities/misconfigurations are dependend on the context. In most scenarios, they can only be exploited by an attacker if the `Access-Control-Allow-Credentials header` is present (see `-q` flag).

### Usage
```
usage: corstest.py [-h] [-c name=value] [-p processes] [-s] [-q] [-v] infile

Simple CORS misconfigurations checker

positional arguments:
  infile         File with domain or URL list

optional arguments:
  -h, --help     show this help message and exit
  -c name=value  Send cookie with all requests
  -p processes   multiprocessing (default: 32)
  -s             always force ssl/tls requests
  -q             quiet, allow-credentials only
  -v             produce a more verbose output
```

## Docker
`docker push theblackturtle/corstest`
