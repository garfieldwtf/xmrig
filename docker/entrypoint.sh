#!/bin/sh

CONFIG="config.json"

# Use WORKER env var, fallback to hostname
WORKER="${WORKER:-$(hostname)}"
sed -i "s|\"rig-id\":.*|\"rig-id\": \"$WORKER\",|" $CONFIG

if [ -n "$WALLET" ]; then
    sed -i "s|\"user\":.*|\"user\": \"$WALLET\",|" $CONFIG
fi

if [ -n "$POOL" ]; then
    sed -i "s|\"url\":.*|\"url\": \"$POOL\",|" $CONFIG
fi

if [ -n "$TLS" ]; then
    sed -i "s|\"tls\":.*|\"tls\": $TLS,|" $CONFIG
fi

exec ./xmrig -c $CONFIG
