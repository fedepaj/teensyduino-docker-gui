from python_on_whales import docker
import subprocess
import os
import logging as log
import sys

# Get the used display number
try:
    display = os.environ['DISPLAY']
except:
    log.exception("No display found")
    sys.exit(1)

# Get the X authentication token
ret_code, output = subprocess.getstatusoutput("xauth list")
if ret_code!=0:
    log.exception("xauth returned a non zero status, are you running an X server?")
    sys.exit(1)

# Parse the authentication token to see if is valid and if wa can fix some errors
token = output.split("\n")[0]
if len(token)%2!=0:
    if token.split("  ")[0].split(":")[1]=="":
        splitted=token.split(":")
        token="".join([splitted[0]+display,splitted[1]])
    else:
        log.exception("Cannot fix the authentication token")
        sys.exit(1)
with open(".env","w") as f:
    f.write(f"TOKEN={token}")

docker.compose.build()

docker.compose.config()

docker.compose.up(["teensyduino"])

