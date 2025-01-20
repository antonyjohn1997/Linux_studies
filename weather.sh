#!/bin/bash
echo "enter weather"
read weather
case $weather in
sunny | warm) echo "nice" $weather
;;
cloudy | cool) echo "not bad"$weather
;;
rainy | cold) echo " good" $weather
;;
*) echo "sorry , I am notfamiliar with that weather system"
;;
esac
exit 0
