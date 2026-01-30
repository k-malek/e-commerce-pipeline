.PHONY: run show help

# Run a Python script with uv and environment file
run:
	@if [ -z "$(FILE)" ]; then \
		echo "Error: FILE parameter is required. Usage: make run FILE=<path/filename.py>"; \
		exit 1; \
	fi
	uv run --env-file .env python $(FILE)

# Show dlt pipeline info
show:
	@if [ -z "$(PIPELINE)" ]; then \
		echo "Error: PIPELINE parameter is required. Usage: make show PIPELINE=<pipeline_name>"; \
		exit 1; \
	fi
	uv run dlt pipeline $(PIPELINE) show

help:
	@echo "Available commands:"
	@echo "  make run FILE=<path/filename.py>       - Run a Python script with uv and .env file"
	@echo "  make show PIPELINE=<pipeline_name>     - Show dlt pipeline info"
	@echo ""
	@echo "Examples:"
	@echo "  make run FILE=dlt_pipelines/sources/fake_store_api.py"
	@echo "  make run FILE=dlt_pipelines/run_pipelines.py"
	@echo "  make show PIPELINE=fake_store"
