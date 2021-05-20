#!/bin/sh
pu="0"
while true
do
  cu=$(curl -s https://api.coingecko.com/api/v3/simple/price\?ids\=bitcoin\&vs_currencies\=usd | jq -r ".bitcoin.usd")
  echo ${cu} ${pu}
  if [ "$(echo "${cu} < ${pu}" | bc)" -eq 1 ]; then
    mpg321 you-suffer.mp3
  fi
  if [ ${cu} != ${pu} ]; then
    pu=${cu}
  fi
  sleep 5
done
