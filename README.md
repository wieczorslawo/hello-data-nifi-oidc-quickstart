# NiFi OpenId Connect Quickstart

This repository shows how to setup NiFi and NiFi Registry with authorization by external [OpenId Connect](https://openid.net/connect/) provider.

It uses open-source [MITREid Connect](https://github.com/mitreid-connect/OpenID-Connect-Java-Spring-Server) as OpenId Connect 
server implementation.

## Running

### Prerequisites
* `docker-compose`
* open ports: 8080, 8443, 18443 (`network_mode: host` is used for OpenId endpoints visibility)

```bash
docker-compose up --build -d
```

This should start NiFi at https://localhost:8443 and NiFi Registry at https://localhost:18443.
You should be able to login to MitreId with user: `user` and password: `password`.

## Setting up version control

* Create user `CN=localhost, OU=NIFI` in NiFi
* Create user `CN=localhost, OU=NIFI` in NiFi Registry (with `Can proxy user requests` enabled) 

Source: https://community.cloudera.com/t5/Community-Articles/Setting-Up-a-Secure-Apache-NiFi-Registry/ta-p/247753
