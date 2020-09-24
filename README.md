# foxpass-eap-test
Create a Docker container to run RADIUS tests from

## Configuration settings

Edit the ttls-pap.conf file in the root directory of this repo to use your username and password

## Building a container

From the root directory of this repo, run these commands to build a Docker image, create a container from that image, and run it:

```bash
docker build -t eapol_test .
docker run --rm -v pwd:'/conf' eapol_test -a<IP> -s<SECRET> -cconf/ttls-pap.conf
```

Where <IP> is the IP of the RADIUS server you are connecting to and <SECRET> is your RADIUS secret
