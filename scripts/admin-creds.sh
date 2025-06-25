#!/bin/bash
CSV="$HOME/cloud/scripts/Admin_accessKeys.csv"
export AWS_ACCESS_KEY_ID=$(tail -n 1 "$CSV" | cut -d',' -f1 | tr -d '\r\n ')
export AWS_SECRET_ACCESS_KEY=$(tail -n 1 "$CSV" | cut -d',' -f2 | tr -d '\r\n ')
export AWS_REGION=eu-west-2
export AWS_DEFAULT_OUTPUT=json
echo "✅ AWS credentials loaded from $CSV"