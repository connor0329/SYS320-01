#!/bin/bash

url="10.0.17.47/Assignment.html"

fullPage=$(curl -sL "$url")

temp=$(echo "$fullPage" | \
xmlstarlet format --html --recover --dropdtd 2>/dev/null | \
xmlstarlet select --template --value-of "//table[@id='temp']//tr[position() > 1]//td[1]")

pressure=$(echo "$fullPage" | \
xmlstarlet format --html --recover --dropdtd 2>/dev/null | \
xmlstarlet select --template --value-of "//table[@id='press']//tr[position() > 1]//td[1]")

DateandTime=$(echo "$fullPage" | \
xmlstarlet format --html --recover --dropdtd 2>/dev/null | \
xmlstarlet select --template --value-of "//table[@id='temp']//tr[position() > 1]//td[2]")

numLines=$(echo "$temp" | wc -l)

for ((i=1; i<="$numLines"; i++))
do
	pressValue=$(echo "$pressure" | head -n $i | tail -n 1)
	tempValue=$(echo "$temp" | head -n $i | tail -n 1)
	dateValue=$(echo "$DateandTime" | head -n $i | tail -n 1)

	echo "Press: [$pressValue] Temp: [$tempValue] Date: [$DateandTime]"
done 



