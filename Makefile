.PHONY: bootstrap
bootstrap:
	@kubectl apply -f namespace.yaml

.PHONY: deploy
deploy:
	@kubectl apply -f base/
	@kubectl apply -f postgres/
	@kubectl apply -f airflow/
	@kubectl apply -f core/
