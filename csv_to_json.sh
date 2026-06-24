#!/bin/bash

INPUT_FILE="rtbh.csv"
OUTPUT_FILE="rtbh.json"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Input file $INPUT_FILE not found!"
    exit 1
fi

# Read headers from CSV file
IFS=',' read -r -a headers < "$INPUT_FILE"

# Initialize JSON array
json_array="["

# Read each line of the CSV file (skip the header)
while IFS=',' read -r -a line; do
    json_object="{"
    for i in "${!headers[@]}"; do
        key="${headers[i]}"
        value="${line[i]}"
        # Escape double quotes in value
        value="${value//\"/\\\"}"
        json_object+="\"$key\":\"$value\""
        if [ $i -lt $((${#headers[@]} - 1)) ]; then
            json_object+=","
        fi
    done
    json_object+="}"
    json_array+="$json_object,"
done < <(tail -n +2 "$INPUT_FILE")

# Remove trailing comma and close JSON array
json_array="${json_array%,}]"

# Write JSON array to output file
echo "$json_array" > "$OUTPUT_FILE"

# Pretty print the JSON
jq . "$OUTPUT_FILE" > tmp.json && mv tmp.json "$OUTPUT_FILE"
