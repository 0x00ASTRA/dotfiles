#!/bin/zsh

# A simple script to get network speed using vnstat
# Requires vnstat to be installed: sudo apt install vnstat or sudo pacman -S vnstat

# Initialize vnstat if not already
if ! vnstat -i $(ip route | grep default | awk '{print $5}' | head -n 1) > /dev/null 2>&1; then
    vnstat -i $(ip route | grep default | awk '{print $5}' | head -n 1) --create > /dev/null 2>&1
fi

while true; do
    INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)

    if [ -z "$INTERFACE" ]; then
        echo "{\"text\": \"N/A\"}"
    else
        # Get current RX and TX bytes
        RX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
        TX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

        # Wait for a short interval
        sleep 1

        # Get new RX and TX bytes
        NEW_RX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
        NEW_TX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

        # Calculate speeds in KB/s
        DOWNLOAD_SPEED=$(( (NEW_RX_BYTES - RX_BYTES) / 1024 ))
        UPLOAD_SPEED=$(( (NEW_TX_BYTES - TX_BYTES) / 1024 ))

        # Format output
        printf '{"text": "%.1f %.1f", "download": "%.1f MB/s", "upload": "%.1f MB/s"}\n' \
            "$(echo "scale=1; $DOWNLOAD_SPEED / 1000" | bc)" \
            "$(echo "scale=1; $UPLOAD_SPEED / 1000" | bc)" \
            "$(echo "scale=1; $DOWNLOAD_SPEED / 1024" | bc)" \
            "$(echo "scale=1; $UPLOAD_SPEED / 1024" | bc)"
    fi
done
