FROM hashicorp/terraform:latest AS build
ADD src /src
WORKDIR /src
RUN terraform init && terraform plan -out runbook.tf
CMD ["apply", "runbook.tf"]
