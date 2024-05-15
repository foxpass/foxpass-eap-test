
# foxpass-eap-test
Create a Docker container to run RADIUS tests from

## Building a container

From the root directory of this repo run the following commands to build the Docker image:

```bash
docker build -t eapol_test .
```

## To run EAP-TTLS (NOTE: This is functional on a Ubuntu ec2 instance, may not work for Mac)

modify the following ttls-pap.conf file in the root directory of this repo:

```bash
#
#   eapol_test -c ttls-pap.conf -s testing123
#
network={
        ssid="example"
        key_mgmt=WPA-EAP
        eap=TTLS
        identity="<username>"
        anonymous_identity="anonymous@foxpass.com"
        password="<password>"
        phase2="auth=PAP"
        #
        #  Uncomment the following to perform server certificate validation.
        #  ca_cert="/etc/raddb/certs/ca.der"
}
```

Now run the following:

```bash
docker run -v /path/to/foxpass-eap-test:/opt -it eapol_test /wpa_supplicant-2.8/wpa_supplicant/eapol_test -a <IP> -s <secret> -c /opt/ttls-pap.conf
```

Where `<IP>` is the IP of the RADIUS server you are connecting to and `<SECRET>` is your RADIUS secret

## TO run EAP-TLS (NOTE: This is functional on a Ubuntu ec2 instance, may not work for Mac)

* download client.crt, client.key and ca.crt (server CA) from foxpass console to the root folder of this repo (name them as client.crt, client.key and ca.crt)
* modify the `eap-tls.conf` file in the root directory of this repo to the following:
  
```bash
  network={
    ssid="DoesNotMatterForThisTest"
    key_mgmt=WPA-EAP
    eap=TLS
    identity="<username>@foxpass.com"
    ca_cert="/opt/ca.crt"
    client_cert="/opt/client.crt"
    private_key="/opt/client.key"
    eapol_flags=3
  }
```

Now run the following:

```bash
docker run -v /path/to/eapol-test:/opt -it eapol_test /wpa_supplicant-2.8/wpa_supplicant/eapol_test -a 44.194.175.80 -s <secret> -c /opt/tls.conf
```
