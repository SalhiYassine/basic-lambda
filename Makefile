check:
	cd infrastructure && terraform init &&  terraform fmt && terraform validate

plan:
	cd infrastructure && terraform plan

apply:
	cd infrastructure && terraform apply

destroy:
	cd infrastructure && terraform destroy