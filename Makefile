init:
	cd infra && terraform init && terraform fmt && terraform validate

plan:
	make build-function && cd infra && terraform plan

apply:
	make build-function && cd infra && terraform apply

destroy:
	cd infra && terraform destroy

install-function-deps:
	cd functions && npm install

build-function:
	cd functions && npm run build