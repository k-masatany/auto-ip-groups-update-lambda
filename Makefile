include .env
COUNTERFEITER_SAM_STACK_NAME ?= counterfeiter

# package resources
.PHONY: package
package:
	sam package \
		--template-file src/template.yaml \
		--output-template-file src/packaged.yaml \
		--s3-bucket $(COUNTERFEITER_SAM_BUCKET)

# deploy resources
.PHONY: deploy
deploy:
	sam deploy \
		--template-file src/packaged.yaml \
		--stack-name $(COUNTERFEITER_SAM_STACK_NAME) \
		--capabilities CAPABILITY_IAM

# destroy resources
.PHONY: destroy
destroy:
	aws cloudformation delete-stack --stack-name $(COUNTERFEITER_SAM_STACK_NAME)
