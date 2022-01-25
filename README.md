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

This should start NiFi at https://localhost:8443/nifi and NiFi Registry at https://localhost:18443/nifi-registry.
You should be able to login to MitreId with user: `user` and password: `password`:

![image](https://user-images.githubusercontent.com/513361/150983252-970cde3d-4b3b-4bb7-ba8c-a03fc4b942b5.png)

## Setting up version control

* Create user `CN=localhost, OU=NIFI` in NiFi
![image](https://user-images.githubusercontent.com/513361/150983553-80bc5bd0-3d2a-440c-a0a0-d1f2a5679b7e.png)


* Create user `CN=localhost, OU=NIFI` in NiFi Registry (with `Can proxy user requests` enabled) 
![image](https://user-images.githubusercontent.com/513361/150983799-152d38c4-e3bc-4c57-aeb0-68956f8e6e33.png)


Source: https://community.cloudera.com/t5/Community-Articles/Setting-Up-a-Secure-Apache-NiFi-Registry/ta-p/247753
