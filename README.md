# foxpass-eap-test
Docker container to run RADIUS tests from

Update ttls-pap.conf with the correct USERNAME and PASSWORD fields

docker run --rm -v `pwd`:'/conf' eapol_test -a<TARGET_IP> -s<SECRET> -cconf/ttls-pap.conf
