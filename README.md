# Porkbun DDNS Docker

## This is the [Porkbun DDNS Python API](https://github.com/Dasnap/porkbun-dynamic-dns-python) wrapped into a lightweight, multiplattform [docker image](https://hub.docker.com/r/dazznap/porkbun-ddns) based on the [Official Python 3 Alpine Docker Image](https://github.com/docker-library/python).

This is based off a [forked official Porkbun project that is no longer supported,](https://github.com/porkbundomains/porkbun-dynamic-dns-python) so be warned. 

This forked image has been changed to check the current DNS value of a domain to see if the update can be skipped.

### Docker Compose
```docker
version: "3"
services:
    porkbunddns:
        image: dazznap/porkbun-ddns
        container_name: porkbun-ddns
        restart: always
        pull_policy: always
        environment:
            APIKey: <YourAPIKey>
            SecretAPIKey: <YourSecretAPIKey>
            Domain: <YourDomain>
            Schedule: <YourSchedule (in cron syntax)> #optional
            TZ: <YourTimezone> #optional
```

### CLI
```docker
docker run -d \
-e APIKey='<YourAPIKey>' \
-e SecretAPIKey='<YourSecretAPIKey>' \
-e Domain='<YourDomain>' \
-e Schedule='<YourSchedule (cron syntax)>' \
-e TZ='<YourTimezone>' \
--pull=always \
--restart always \
--name porkbun-ddns \
dazznap/porkbun-ddns
```

### Build from source:
```bash
git clone https://github.com/Dasnap/Porkbun-DDNS-Docker
cd Porkbun-DDNS-Docker
docker build . -t porkbun-ddns
```

### Environment Variables
| Argument | description | example | default | optional
|-|-|-|-|-|
| `APIKey` | The API key provided to you by porkbun | pk1_abcdef123456 | None | no |
| `SecretAPIKey` | The secret API key provided to you by porkbun | sk1_abcdef123456 | None | no |
| `Domain` | The Domain you want to map to your IP adress, as seen [here](https://github.com/Dasnap/porkbun-dynamic-dns-python#running-the-client)| google.com domains </br> (would be domains.google.com) | None | no |
| `Schedule` | Schedule to execute the script to sync DNS A records with your IP address in cron format | */10 * * * * </br> (every 10 minutes) | */5 * * * * </br> (every 5 minutes) | yes |
| `TZ` | Your Timezone  as [tz database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List) name </br> (only really needed, if used in schedule) | Europe/Berlin | UTC | yes |
