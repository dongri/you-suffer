#!/bin/sh
pu="0"
while true
do
  cu=$(curl -s https://api.coinmarketcap.com/v1/ticker/bitcoin/ | jq -r ".[].price_usd")
  echo ${cu} ${pu}
  if [ "$(echo "${cu} < ${pu}" | bc)" -eq 1 ]; then
    mpg321 you-suffer.mp3
  fi
  if [ ${cu} != ${pu} ]; then
    pu=${cu}
  fi
  sleep 5
done
