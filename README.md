# foxpass-eap-test
Create a Docker container to run RADIUS tests from

## Configuration settings

For TTLS authentication, edit the ttls-pap.conf file in the root directory of this repo to use your username and password

For TLS authentication, edit the tls-pap.conf file in the root directory of this repo and place the certificates from SCEP in the same folder

## Building a container

From the root directory of this repo, update the configuration file and then run these commands to build a Docker image, and run it:

### TTLS
```bash
docker build -t eapol_test .
docker run --rm -v `pwd`:'/conf' eapol_test -a<IP> -s<SECRET> -cconf/ttls-pap.conf
```

### TLS
Currently only works when building the eapol_test manually into an Ubuntu EC2 instance. See Dockerfile.
eapol_test -a<IP> -s<SECRET> -ctls-pap.conf

Where `<IP>` is the IP of the RADIUS server you are connecting to and `<SECRET>` is your RADIUS secret
