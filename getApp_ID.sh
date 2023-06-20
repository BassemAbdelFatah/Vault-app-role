#!/bin/sh

ROLE_ID="b960e2ce-2028-faa7-1272-36f225b16dbb"
SECRET=$1
VAULT_TOKEN1=$(curl -s --location --request POST 'https://10.90.3.192:443/v1/auth/approle/login' \
--header 'Content-Type: application/json' \
--data-raw "{ \"role_id\": \"$ROLE_ID\", \"secret_id\":\"$SECRET\"}" \
|jq -r .auth.client_token)

#echo "$VAULT_TOKEN1"

APP_ROLE_ID=$(curl -s --header X-Vault-Token:$VAULT_TOKEN1 https://10.90.3.192:443/v1/auth/approle/role/onlineorangedsl/role-id |jq -r .data.role_id)

echo "$APP_ROLE_ID"

