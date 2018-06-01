#!/bin/bash

LC_NUMERIC="pt_BR.UTF-8"

case $1 in
	coinbase) 
		saida=$(curl -sH 'CB-VERSION: 2015-04-08' -H 'Accept-Language: pt-br' 'https://api.coinbase.com/v2/prices/buy?currency=BRL' | jq -r '.data.amount' | LC_NUMERIC="pt_BR.UTF-8" awk '{printf("%.2f\n", $1)}')
	;;  
    *) 
    	saida=$(curl -sH 'Accept-encoding: gzip' 'https://www.mercadobitcoin.net/api/BTC/ticker/' | gunzip - | jq -r '.ticker.last' | awk '{printf("%.2f", $1)}')
    ;;
esac

echo "$saida"
