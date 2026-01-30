import dlt
import requests
import os

@dlt.resource(name="products", write_disposition="merge", primary_key="id")
def get_products():
    """ Get products from the DummyJSON API """
    url = f"{os.getenv('DUMMYJSON_API_URL')}/products"
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    data = response.json()
    yield from data.get("products", [])

@dlt.resource(name="users", write_disposition="merge", primary_key="id")
def get_users():
    """ Get users from the DummyJSON API """
    url = f"{os.getenv('DUMMYJSON_API_URL')}/users"
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    data = response.json()
    yield from data.get("users", [])

@dlt.resource(name="carts", write_disposition="merge", primary_key="id")
def get_carts():
    """ Get carts from the DummyJSON API """
    url = f"{os.getenv('DUMMYJSON_API_URL')}/carts"
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    data = response.json()
    yield from data.get("carts", [])

def load_dummyjson_api():
    """ Load the DummyJSON API """
    pipeline = dlt.pipeline(
        pipeline_name="dummyjson",
        destination="duckdb",
        dataset_name="raw_dummyjson"
    )
    load_info = pipeline.run([
        get_products(),
        get_users(),
        get_carts()
    ])
    print(load_info)
    return pipeline

if __name__ == "__main__":
    load_dummyjson_api()
