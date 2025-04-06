.PHONY: bootstrap
bootstrap:
	@kubectl apply -f namespace.yaml


.PHONY: patch
patch:
	@./patch.sh


.PHONY: deploy
deploy:
	@kubectl apply -f base/
	@kubectl apply -f postgres/
	@kubectl apply -f airflow/
	@kubectl apply -f core/
	@kubectl apply -f valkey/


.PHONY: restart-core
restart-core:
	@kubectl rollout restart deployment core


.PHONY: restart-airflow
restart-airflow:
	@kubectl rollout restart deployment airflow-webserver
	@kubectl rollout restart deployment airflow-scheduler


.PHONY: peek-db
peek-db:
	@kubectl exec -it postgres-0 -- psql -U causality


.PHONY: clear-cache
clear-cache:
	@kubectl exec -it valkey-0 -- redis-cli FLUSHALL
