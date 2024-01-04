#!/usr/bin/env bash
#
# Updates Cloudflare DNS record with current detected public IP.
# https://api.cloudflare.com/#dns-records-for-a-zone-patch-dns-record
#
# Required env vars:
# CLOUDFLARE_ZONE="xxx"
# CLOUDFLARE_DNS_RECORD_ID_A="xxx"
# CLOUDFLARE_DNS_RECORD_ID_AAAA="xxx"
# CLOUDFLARE_EMAIL="xxx"
# CLOUDFLARE_KEY="xxx"

function updateIpv4 {
    # IPv4 A record.
    # https://unix.stackexchange.com/a/81699/125382
    IPADDRv4=$(dig @resolver4.opendns.com myip.opendns.com +short)
    echo "-----------------------------------------"
    echo "Public IPv4: $IPADDRv4"
    echo "-----------------------------------------"

    curl -X PATCH "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE/dns_records/$CLOUDFLARE_DNS_RECORD_ID_A" \
    -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
    -H "X-Auth-Key: $CLOUDFLARE_KEY" \
    -H "Content-Type: application/json" \
    --data "{\"content\":\"$IPADDRv4\"}"
}

function updateIpv6 {
    # IPv6 AAAA record.
    IPADDRv6=$(dig @resolver1.ipv6-sandbox.opendns.com AAAA myip.opendns.com +short -6)
    echo "-----------------------------------------"
    echo "Public IPv6: $IPADDRv6"
    echo "-----------------------------------------"

    curl -X PATCH "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE/dns_records/$CLOUDFLARE_DNS_RECORD_ID_AAAA" \
    -H "X-Auth-Email: $CLOUDFLARE_EMAIL" \
    -H "X-Auth-Key: $CLOUDFLARE_KEY" \
    -H "Content-Type: application/json" \
    --data "{\"content\":\"$IPADDRv6\"}"
}

# Let's roll, babies.
updateIpv4
updateIpv6
