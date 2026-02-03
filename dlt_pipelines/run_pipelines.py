""" Run the DLT pipelines """

from sources.dummyjson_api import load_dummyjson_api
from sources.fake_store_api import fake_store_api
from logging import getLogger

logger = getLogger(__name__)

def run_pipelines():
    """ Run the DLT pipelines """
    logger.info("Running DummyJSON API pipeline")
    load_dummyjson_api()
    logger.info("Running Fake Store API pipeline")
    fake_store_api()
    logger.info("Pipelines completed")

if __name__ == "__main__":
    run_pipelines()
