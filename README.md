# E-commerce Analytics Data Pipeline

A production-ready ELT (Extract, Load, Transform) pipeline built with **dlt** and **dbt** to extract, load, and transform e-commerce data from free public APIs into an analytics-ready data warehouse.

## 🎯 Project Overview

This project demonstrates mid-level data engineering skills by building an end-to-end data pipeline that:

- **Extracts** data from multiple free public APIs (Fake Store API, DummyJSON, JSONPlaceholder)
- **Loads** raw data into a data warehouse using dlt
- **Transforms** data using dbt to create analytics-ready models
- **Delivers** dimensional models and analytics marts for business intelligence

## 🛠️ Tech Stack

- **dlt** (data load tool): Python-based data extraction and loading
- **dbt** (data build tool): SQL-based transformation framework
- **DuckDB**: File-based analytical database (or PostgreSQL)
- **Python 3.11+**: Core programming language
- **uv**: Fast Python package manager

## 📊 Data Sources

All data sources are **free and require no authentication**:

1. **Fake Store API** - https://fakestoreapi.com/
   - Products, users, and carts
   - 20 products, 10 users, 7 carts

2. **DummyJSON API** - https://dummyjson.com/
   - Products, users, and carts with pagination
   - 100 products, 100 users, 20 carts

3. **JSONPlaceholder** - https://jsonplaceholder.typicode.com/
   - Users and posts for data enrichment

## 🚀 Quick Start

### Prerequisites

- Python 3.11+
- [uv](https://github.com/astral-sh/uv) package manager
- Git

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd dbt_dlt

# Initialize project and install dependencies
uv init
uv pip install -r requirements.txt
```

### Run the Pipeline

```bash
# Extract and load data with dlt
uv run python dlt_pipelines/run_pipelines.py

# Transform data with dbt
cd dbt_project
uv run dbt run
uv run dbt test
uv run dbt docs generate
```

## 📁 Project Structure

```
dbt_dlt/
├── dlt_pipelines/          # dlt extraction scripts
│   ├── sources/            # Source-specific pipelines
│   ├── utils/              # Shared utilities
│   └── requirements.txt    # Python dependencies
├── dbt_project/            # dbt transformation project
│   ├── models/             # SQL transformation models
│   │   ├── staging/        # Staging models (bronze)
│   │   ├── intermediate/   # Intermediate models
│   │   └── marts/          # Final analytics models (gold)
│   ├── tests/              # Custom dbt tests
│   ├── macros/             # Reusable SQL macros
│   └── dbt_project.yml     # dbt configuration
├── docs/                   # Additional documentation
├── project.md              # Detailed implementation plan
└── README.md               # This file
```

## 📖 Documentation

For detailed step-by-step implementation instructions, see [project.md](./project.md).

## 🔧 Configuration

Create a `.env` file (see `.env.example` if provided):

```env
WAREHOUSE_TYPE=duckdb
WAREHOUSE_PATH=./warehouse.duckdb
FAKE_STORE_API_URL=https://fakestoreapi.com
DUMMYJSON_API_URL=https://dummyjson.com
```

## 📈 Analytics Models

The pipeline creates:

- **Dimension Tables**: `dim_customers`, `dim_products`
- **Fact Tables**: `fct_orders`, `fct_order_items`
- **Analytics Marts**: `mart_sales_daily`, `mart_product_performance`

## 🧪 Testing

```bash
# Run all dbt tests
cd dbt_project
uv run dbt test

# Run specific model tests
uv run dbt test --select staging
```

## 📚 Documentation

Generate and view dbt documentation:

```bash
cd dbt_project
uv run dbt docs generate
uv run dbt docs serve
```

## 🤝 Contributing

This is a portfolio project. Feel free to fork and adapt for your own use.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

Krzysztof Małek - Data Engineer

---

**Note**: This project showcases mid-level data engineering skills including data pipeline design, transformation logic, and best practices in modern data stack tools.
