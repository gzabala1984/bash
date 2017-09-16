#!/bin/bash

file_count() {
# This function counts the number of files in the present working directory

CNT=$(ls -lrt |wc -l)
echo "File count: ${CNT}"
}

file_count
