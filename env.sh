bw get item .env | jq -r '.fields[] | select(.type == 1) | "\(.name)=\(.value)"' > ~/.env
