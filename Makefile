init:
	cd infra && terraform init && terraform fmt && terraform validate

plan:
	make build-function && cd infra && terraform plan

apply:
	make build-function && cd infra && terraform apply

destroy:
	cd infra && terraform destroy

build-function:
	cd example && npm run build