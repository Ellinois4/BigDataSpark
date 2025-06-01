"""
Настройки подключения к источникам данных.
"""
# Postgres
POSTGRES_URL = "jdbc:postgresql://postgres:5432/salesdb"
POSTGRES_PROPS = {
    "user": "user",
    "password": "password",
    "driver": "org.postgresql.Driver"
}

# ClickHouse
CLICKHOUSE_URL = "jdbc:clickhouse://clickhouse:8123/default"
CLICKHOUSE_PROPS = {
    "user": "default",
    "driver": "com.clickhouse.jdbc.ClickHouseDriver"
}

