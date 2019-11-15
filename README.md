# CORSTest
## Usage
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
`docker push theblackturtle/corstest:tagname`
