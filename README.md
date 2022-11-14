# Vps setup 

## Collection of knowledge
- [mikrus](https://www.notion.so/Biblioteka-Mikrusa-3c757621cf9b4fbfb3909fc04a77dbcf?p=9003f1758646468ebe6dbb5afb1a8f4d&pm=s)
## Requirements
- linux (debian prefers)
- docker and docker-compose
- domain 
- fail2ban (nice to have)
## Setup 
### Applications that are required for full operation
- traefik (<mail> in the traefik.toml and add key to docker registry key for docker-compose in watchtower)
- portainer
### Nice to setup
- grafana (when creating remember sudo example sudo docker-compose up -d) (example dashboard is a folder grafana_dashboard this dashboard must be manual import for site) remember for setup <domain>
