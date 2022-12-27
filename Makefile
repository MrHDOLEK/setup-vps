.DEFAULT_GOAL := help
SHELL := /bin/bash

start: ## Run docker for a project
	docker-compose up -d

stop: ## Stop all containers for a project
	docker-compose down --remove-orphans

bash: ## Exec bash for ansible container
	docker-compose exec ansible-menagment-node bash

create_password: ## Create password hash inside docker container
	mkpasswd -m sha512crypt --stdin <<< ${PASS}

treafic_password: ## Create password for the treafic
	htpasswd -nBC 10 admin

init_vps: ## Init setup vps
	ansible-playbook -i inventory vps.yml

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
