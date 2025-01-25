#!/bin/bash
echo "enter a colour"
read text1
echo "enter a colour"
read text2

if test $text1 != $text2;then
        echo "diffrent colour"
else
        echo "same colour"
fi
exit 0


