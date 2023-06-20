#!/bin/sh

ROLE_ID="b960e2ce-2028-faa7-1272-36f225b16dbb"
SECRET=$1
VAULT_TOKEN2=$(curl -s --location --request POST 'https://10.90.3.192:443/v1/auth/approle/login' \
--header 'Content-Type: application/json' \
--data-raw "{ \"role_id\": \"$ROLE_ID\", \"secret_id\":\"$SECRET\"}" \
|jq -r .auth.client_token)

#echo "$VAULT_TOKEN2"

curl -s -H "X-Vault-Token:$VAULT_TOKEN2"  --request POST https://10.90.3.192:443/v1/auth/approle/role/onlineorangedsl/secret-id | jq -r .data.secret_id
