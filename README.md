# NiFi OpenId Connect Quickstart

This repository shows how to setup NiFi and NiFi Registry with authorization by external [OpenId Connect](https://openid.net/connect/) provider.

It uses open-source [MITREid Connect](https://github.com/mitreid-connect/OpenID-Connect-Java-Spring-Server) as OpenId Connect 
server implementation.

## Running

### Prerequisites
* `docker-compose`
* `jq`
* open ports: 8080, 8443, 18443 (`network_mode: host` is used for OpenId endpoints visibility)

```bash
./start.sh
```

This should start NiFi at https://localhost:8443/nifi and NiFi Registry at https://localhost:18443/nifi-registry.
You should be able to log in into MITREid Server with user: `user` and password: `password`:

![image](https://user-images.githubusercontent.com/513361/150983252-970cde3d-4b3b-4bb7-ba8c-a03fc4b942b5.png)

After completing the authorization flow in MITREidId Server, you should be logged as `user@example.com` in NiFi Registry:

![image](https://user-images.githubusercontent.com/513361/150999719-ae0fd0c1-2ed2-4d6f-b3ea-7f72dc01d66d.png)

## Setting up version control

* **[NiFi Registry]** Go to https://localhost:18443/nifi-registry/#/administration/users and create user `CN=localhost, OU=NIFI` (with `Can proxy user requests` enabled) - refreshing the page after login may be required

![image](https://user-images.githubusercontent.com/513361/150983799-152d38c4-e3bc-4c57-aeb0-68956f8e6e33.png)

* **[Helper script]** Create `Quickstart` bucket
```bash
./create-bucket.sh Quickstart
```
* **[NiFi]** Create policies to view and modify the main flow for `user@example.com`
* **[NiFi]** Add Registry client pointing at `https://localhost:18443`
* **[NiFi]** Create a `Test Flow`
* **[NiFi]** Setup a version control to `Test Flow` in `Quickstart` bucket:

![Zrzut ekranu z 2022-01-25 15-58-48](https://user-images.githubusercontent.com/513361/151001078-446e8af8-cd1a-49fe-9c74-8c31c70e587f.png)

![image](https://user-images.githubusercontent.com/513361/151000901-d0ffe604-a366-4f4c-8a90-79fb2e942cba.png)

* **[Helper script]** List flow versions
```bash
./list-versions.sh

Ver   Date                         Author             Message   
---   --------------------------   ----------------   -------   
1     Tue, Jan 25 2022 14:47 GMT   user@example.com   
```

To clean up Docker stuff run `./cleanup.sh`.

Based on in this [article on Cloudera](https://community.cloudera.com/t5/Community-Articles/Setting-Up-a-Secure-Apache-NiFi-Registry/ta-p/247753)
