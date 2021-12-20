#!/bin/bash

badpass=0
badpass2=0
PWDS=()
pass=
letter=
temp=
range=
fist=
second=

#PART 2

IFS=$'\r\n' GLOBIGNORE='*' command eval  'PWDS=($(cat ./input))'


#------------------------------------------------------------
# Day 2, pt. 1

for password in "${PWDS[@]}"; do

    pass="${password#*:}"
    temp="${password%%:*}"
    letter="${temp#* }"
    range="${temp%% *}"


    beg="${range%%-*}"
    end="${range#*-}"
   
    num=($(echo $pass | awk -F"${letter}" '{print NF-1}'))

    if [ ! $num -gt $end ] && [ ! $beg -gt $num ]; then
	badpass=$(($badpass+1))
    fi
    
done

echo Part 1
echo "Good Passwords: "$badpass
echo ---

# PART 2
for password in "${PWDS[@]}"; do

    count=0
    
    pass="${password#*:}"
    temp="${password%%:*}"
    letter="${temp#* }"
    range="${temp%% *}"

    pos1="${range%%-*}"
    pos2="${range#*-}"
    first=${pass:1:$pos1}
    second=${pass:1:$pos2}

    if [[ "${first: -1}" =~ "${letter}" ]];
    then
       	count=$(($count+1))
    fi
    if [[ "${second: -1}" =~ "${letter}" ]];
    then
	count=$(($count+1))
    fi

    if [ ! $count == 1 ];
    then
	badpass2=$(($badpass2+1))
    fi
done

echo Part 2
echo Good passwords: $((1000-$badpass2))

exit 1
