init:
	cd infra && terraform init && terraform fmt && terraform validate

plan:
	cd infra && terraform plan

apply:
	cd infra && terraform apply

destroy:
	cd infra && terraform destroy