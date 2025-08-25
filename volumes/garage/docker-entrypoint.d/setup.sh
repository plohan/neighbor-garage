echo "Waiting for service to be healthy"
sleep 2

NODE_ID=$(garage status | tail -1 | cut -f1 -d' ')
GARAGE_BUCKET_NAME=${GARAGE_BUCKET_NAME:-local}

garage layout assign -z dc1 -c "${GARAGE_CAPACITY:-1G}" "$NODE_ID"

garage layout apply --version 1

garage bucket create "$GARAGE_BUCKET_NAME"

if [ -z "$GARAGE_KEY_ID" -o -z "$GARAGE_KEY_SECRET" ]; then
    garage key create local
else
    garage key import "$GARAGE_KEY_ID" "$GARAGE_KEY_SECRET" -n local --yes
fi

garage bucket allow \
    --read \
    --write \
    --owner \
    "$GARAGE_BUCKET_NAME" \
    --key local

touch /INIT
