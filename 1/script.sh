#!/bin/bash

EXP=()
YEAR=2020

if [ -f ./input ]; then
    EXP=($(sort <<<$(cat ./input))); unset IFS
fi

#PART 1

for EXPENSE in "${EXP[@]}"; do
    HOLD=$(($YEAR - $EXPENSE))
    if [[ " ${EXP[@]} " =~ " ${HOLD} " ]]; then
	echo $(($HOLD * $EXPENSE))
	break
    fi
done
echo "part 1 done"


#PART 2

for i in "${EXP[@]}"; do
    for j in "${EXP[@]}"; do
	h=$(($YEAR - $i - $j))
	if [[ " ${EXP[@]} " =~ " ${h} " ]]; then
	    echo $i $j $(($YEAR - $i - $j))
	    echo $(( $i * $j * $(($YEAR - $i - $j))))
	    echo "part 2 done"
	    break
	fi
    done
done
