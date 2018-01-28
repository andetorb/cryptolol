#!/bin/bash


# BTC = Bitcoin
# XMR = Monero
# ZEC = zCash
# IOT = IOTA
# ETH = Ethereum

val=( BTC ETH XMR ZEC IOT)
value=( bitcoin ethereum zcash)

# Usage message
usage() { echo "Usage: $0 [-c|-p|-b <cli.fyi|coinmarketcap|bitmynt>]" 1>&2; exit 1; }

# Catch 0 arguments
if [[ $1 == "" ]]; 
then
	usage;
	exit;
fi
# check for options -c and -p
while getopts "cpb" OPTION; do
    case $OPTION in
    c)
        for i in "${val[@]}"
        do
                verdi=$(curl -s cli.fyi/"$i" | jq '.data."USD ($)"')
                echo $i "er på" $verdi "usd"
        done
        ;;
    p)
        for i in "${value[@]}"
        do
                verdi1=$(curl -s https://api.coinmarketcap.com/v1/ticker/"$i"/ | jq -r '.[0].price_usd')
                verdi2=$(curl -s https://api.coinmarketcap.com/v1/ticker/"$i"/ | jq -r '.[0].percent_change_1h')
                verdi3=$(curl -s https://api.coinmarketcap.com/v1/ticker/"$i"/ | jq -r '.[0].percent_change_24h')
                verdi4=$(curl -s https://api.coinmarketcap.com/v1/ticker/"$i"/ | jq -r '.[0].percent_change_7d')
                echo "["$i"]" "USD:" $verdi1 "1h:" $verdi2 "24h:" $verdi3 "7d:" $verdi4 
        done
        ;;
    b)  
	sell=$(curl -s http://bitmynt.no/ticker.pl | jq -r '.nok.sell')
	buy=$(curl -s http://bitmynt.no/ticker.pl | jq -r '.nok.buy')
	echo "[bitmynt.no] buys BTC at" $buy "NOK, sells at" $sell "NOK"
	;;
    *)
	usage
        ;;
    esac
done

