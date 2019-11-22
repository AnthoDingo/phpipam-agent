## Description
phpipam-agent is a scanning agent for phpipam server to be deployed to remote servers

## License
phpipam is released under the GPL v3 license, see misc/gpl-3.0.txt.

## Requirements
 - 64bit PHP version 5.4+ with following modules
    - pdo, pdo_mysql : Adds support for mysql connections (if type=mysql)
    - gmp            : Adds support for dev-libs/gmp (GNU MP library) -> to calculate IPv6 networks
    - json           : Adds supports for JSON data-interexchange format
    - pcntl          : Adds supports for threading via cli ( not supported by windows )
 - PHP PEAR support (dev-php/pear)

## Install

```
git clone --recursive https://github.com/phpipam/phpipam-agent/ phpipam-agent
```

Just run index.php script with discover or update as argument.

 - Make sure this client has read/write access to main phpipam database.
    ```SQL
    GRANT SELECT on `phpipam`.* TO 'username'@'hostname' identified by "password";
    GRANT INSERT,UPDATE on `phpipam`.`ipaddresses` TO 'username'@'hostname' identified by "password";
    GRANT UPDATE on phpipam.scanAgents TO 'username'@'hostname' identified by "password";
    ```
 - If you will remove inactive dhcp/autodiscovered also this is needed
    ```SQL
    GRANT DELETE on `phpipam`.`ipaddresses` TO 'username'@'hostname' identified by "password";
    ```

## Update

```
cd phpipam-agent
git pull
git submodule update --init --recursive
```

## Scheduled scans
For scheduled scans you have to run script from cron. Add something like following to your cron to scan
each 15 minutes:

 ```
*/15 * * * * php /where/your/agent/index.php update
*/15 * * * * php /where/your/agent/index.php discover
```

## Docker

Image available : https://hub.docker.com/r/anthodingo/phpipam-agent

Settings : 
| Name                     | Default Value         | Available value                |
| ------------------------ | --------------------- | ------------------------------ |
| IPAM_DATABASE_HOST       | localhost             |                                |
| IPAM_DATABASE_USER       | phpipam               |                                |
| IPAM_DATABASE_PASS       | phpipamadmin          |                                |
| IPAM_DATABASE_NAME       | phpipam               |                                |
| IPAM_DATABASE_PORT       | 3306                  |                                |
| AGENT_KEY                |                       |                                |
| API_KEY                  |                       |                                |
| IPAM_METHOD              | fping                 | ping/fping/pear                |
| IPAM_PINGPATH            | /usr/local/sbin/fping |                                |
| IPAM_RESET_AUTODISCOVER  | false                 | true/false                     |
| IPAM_REMOVE_INACTIVE     | false                 | true/false                     |
| SCAN_INTERVAL            | 10m                   | 5m/10m/15m/30m/1h/2h/4h/6h/12h |

Docker compose file exemple :
```
version: "3.7"
services:
  phpipam-agent:
    image: anthodingo/phpipam-agent:latest
    container_name: phpipam-agent
    environment:
      - AGENT_KEY=mYa6eN7K3y
      - API_KEY=Ap1K3y
    network_mode: bridge
```

## Contact
`miha.petkovsek@gmail.com`
