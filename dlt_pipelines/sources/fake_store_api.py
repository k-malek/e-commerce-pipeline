import dlt
import os
import requests

@dlt.resource(name="products", write_disposition="replace")
def get_products():
    """ Get products from the Fake Store API """
    url = f"{os.getenv('FAKE_STORE_API_URL')}/products"
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    yield from response.json()

@dlt.resource(name="users", write_disposition="replace")
def get_users():
    """ Get users from the Fake Store API """
    url = f"{os.getenv('FAKE_STORE_API_URL')}/users"
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    yield from response.json()

@dlt.resource(name="carts", write_disposition="replace")
def get_carts():
    """ Get carts from the Fake Store API """
    url = f"{os.getenv('FAKE_STORE_API_URL')}/carts"
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    yield from response.json()

def fake_store_api():
    """ Main pipeline for the Fake Store API """
    pipeline = dlt.pipeline(
        pipeline_name="fake_store",
        destination="duckdb",
        dataset_name="raw_fake_store"
    )

    load_info = pipeline.run([
        get_products(),
        get_users(),
        get_carts(),
    ])
    
    print(load_info)
    return pipeline

if __name__ == "__main__":
    fake_store_api()
