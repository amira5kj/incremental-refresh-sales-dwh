# Sales DWH with incremental load
Incremental ETL &amp; Data Warehouse.An automated end-to-end data pipeline in Python that ingests multi-year retail sales CSV files into SQL Server databse using an incremental loading strategy. The pipeline applies bulk insertion for historical data and date-based incremental refresh for the current year to prevent duplication and ensure efficiency. 
<img width="1730" height="460" alt="image" src="https://github.com/user-attachments/assets/f242c896-d94a-4932-80c8-3bb40e4ba465" />

```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (Sales 2014 to 2017)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
│
├── DB scripts/                        # SQL scripts for ETL and transformations
│   ├── all_data/                         # Scripts for extracting and loading raw data
│
│
├── DWH scripts/                        # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
|── .gitignore                          # Files and directories to be ignored by Git
