.PHONY: run help

# Run a Python script with uv and environment file
run:
	@if [ -z "$(FILE)" ]; then \
		echo "Error: FILE parameter is required. Usage: make run FILE=<path/filename.py>"; \
		exit 1; \
	fi
	uv run --env-file .env python $(FILE)

help:
	@echo "Available commands:"
	@echo "  make run FILE=<path/filename.py>  - Run a Python script with uv and .env file"
	@echo ""
	@echo "Examples:"
	@echo "  make run FILE=dlt_pipelines/sources/fake_store_api.py"
	@echo "  make run FILE=dlt_pipelines/run_pipelines.py"
