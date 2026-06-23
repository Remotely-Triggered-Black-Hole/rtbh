#!/bin/bash

# Replace start of each line with vertical pipe
sed 's/^/| /' rtbh.csv > rtbh.md

# Replace commas with vertical pipe
sed -i 's/,/ | /g' rtbh.md

# Replace end of each line with vertical pipe
sed -i 's/$/ |/' rtbh.md

# Fill in empty cells with a dash "-"
sed -E -i ':a; s/\|[[:space:]]*\|/| - |/g; ta' rtbh.md

# Get the count of columns in the first line of the CSV file
column_count=$(head -n 1 rtbh.csv | awk -F',' '{print NF}')

# MD file should end in new line character
echo "" >> rtbh.md

# Add a row of dashes after the first line to separate the header row from the data
dash_row=$(for _ in $(seq 1 $column_count); do echo -n "| --- "; done)
dash_row="$dash_row|"
sed -i "2i $dash_row" rtbh.md

# Insert a header at the top of the file
header="# RTBH Configuration by Network\n"
sed -i "1i $header" rtbh.md

