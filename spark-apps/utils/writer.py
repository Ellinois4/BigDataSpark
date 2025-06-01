from config import (
    CLICKHOUSE_URL,
    CLICKHOUSE_PROPS
)


# ========== ClickHouse ==========
def write_to_clickhouse(df, table_name: str):
    """
    Записывает DataFrame в ClickHouse.
    """
    df.write.jdbc(
        CLICKHOUSE_URL,
        table_name,
        mode="append",
        properties=CLICKHOUSE_PROPS
    )

