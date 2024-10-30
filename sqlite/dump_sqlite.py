#!/usr/bin/env nix
#!nix shell nixpkgs#python3 --command python3

import sqlite3
import json
import sys
from pathlib import Path
from os import environ

def connect_db(db_path):
    """Connect to Radarr database and return connection."""
    return sqlite3.connect(db_path)

def get_schema(conn):
    """Extract complete database schema."""
    cursor = conn.cursor()
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table';")
    return cursor.fetchall()

def inspect_table(conn, table_name):
    """Get table info including columns and sample data."""
    cursor = conn.cursor()
    cursor.execute(f"PRAGMA table_info({table_name});")
    columns = cursor.fetchall()
    
    cursor.execute(f"SELECT * FROM {table_name} LIMIT 1;")
    sample = cursor.fetchone()
    
    return {
        'columns': columns,
        'sample': sample
    }

def main(db_path):
    conn = connect_db(db_path)
    schema = get_schema(conn)
    print("\nDatabase Schema:")
    for table in schema:
        print(f"\n{table[0]}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: script.py <path_to_radarr.db>")
        sys.exit(1)
    main(sys.argv[1])