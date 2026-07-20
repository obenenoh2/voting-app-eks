#!/bin/sh

# PostgreSQL health check script
# Checks if PostgreSQL is accepting connections and database is ready

PGUSER="${POSTGRES_USER:-postgres}"
PGPASSWORD="${POSTGRES_PASSWORD:-postgres}"
PGDATABASE="${POSTGRES_DB:-postgres}"

export PGPASSWORD=$PGPASSWORD

# Try to execute a simple query
if psql -h localhost -U "$PGUSER" -d "$PGDATABASE" -c "SELECT 1" > /dev/null 2>&1; then
    exit 0
else
    exit 1
fi
