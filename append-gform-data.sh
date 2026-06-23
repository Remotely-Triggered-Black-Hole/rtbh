#!/bin/bash

# Check if gform.csv exists
if [ -f gform.csv ]; then
    # Append the contents of gform.csv as a new line to rtbh.csv
    echo -e "\n$(cat gform.csv)" >> rtbh.csv

    # Sort rtbh.csv by the second column (AS number) and overwrite it,
    # but don't include the first row (headers) in the sorting
    (head -n 1 rtbh.csv && tail -n +2 rtbh.csv | sort -t, -g -k2,2) > rtbh_sorted.csv
    mv rtbh_sorted.csv rtbh.csv
    # Remove trailing newline
    truncate -s -1 rtbh.csv

    # Remove gform.csv
    rm gform.csv
else
    echo "gform.csv not found. No data to append."
fi
