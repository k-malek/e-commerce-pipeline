.PHONY: run run-pipeline show help

# Run a Python script with uv and environment file
run:
	@if [ -z "$(FILE)" ]; then \
		echo "Error: FILE parameter is required. Usage: make run FILE=<path/filename.py>"; \
		exit 1; \
	fi
	uv run --env-file .env python $(FILE)

# Run a dlt pipeline by model name (e.g. fake_store_api, dummyjson_api)
run-pipeline:
	@if [ -z "$(MODEL)" ]; then \
		echo "Error: MODEL parameter is required. Usage: make run-pipeline MODEL=<model_name>"; \
		exit 1; \
	fi
	uv run --env-file .env python dlt_pipelines/sources/$(MODEL).py

# Show dlt pipeline info
show:
	@if [ -z "$(PIPELINE)" ]; then \
		echo "Error: PIPELINE parameter is required. Usage: make show PIPELINE=<pipeline_name>"; \
		exit 1; \
	fi
	uv run dlt pipeline $(PIPELINE) show

help:
	@echo "Available commands:"
	@echo "  make run FILE=<path/filename.py>         - Run a Python script with uv and .env file"
	@echo "  make run-pipeline MODEL=<model_name>     - Run a dlt pipeline (fake_store_api, dummyjson_api)"
	@echo "  make show PIPELINE=<pipeline_name>       - Show dlt pipeline info"
	@echo ""
	@echo "Examples:"
	@echo "  make run FILE=dlt_pipelines/sources/fake_store_api.py"
	@echo "  make run-pipeline MODEL=dummyjson_api"
	@echo "  make run-pipeline MODEL=fake_store_api"
	@echo "  make show PIPELINE=fake_store"
