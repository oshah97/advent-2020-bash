#!/bin/bash

# types of inputs are either new line separated or space seperated
# inputs are separated by empty line


#IFS=$'\r\n' GLOBIGNORE='*' command eval  'PASS=($(cat ./input_test))'
IFS=$'\r\n' GLOBIGNORE='*' command eval  'PASS=($(cat ./input_test))'

byr=0 # (Birth Year)
iyr=0 # (Issue Year)
eyr=0 # (Expiration Year)
hgt=0 # (Height)
hcl=0 # (Hair Color)
ecl=0 # (Eye Color)
pid=0 # (Passport ID)
cid=0 # (Country ID)

count=0
good_pass=0
# arrays -> 1: ${arr[0]}...
cat_arr=()
cat_count=0

echo START TEST
echo    ----
echo Each Item:
for item in "${PASS[@]}"; do

    count=$(($count+1))
    
    echo "$item"
    
    if [[ $item =~ 'byr' ]]; then
	byr=$(($byr+1))
    fi
    if [[ $item =~ 'iyr' ]]; then
    iyr=$(($iyr+1))
    fi
    if [[ $item =~ 'eyr' ]]; then
	eyr=$(($eyr+1))
    fi
    if [[ $item =~ 'hgt' ]]; then
	hgt=$(($hgt+1))
    fi
    if [[ $item =~ 'hcl' ]]; then
	hcl=$(($hcl+1))
    fi
    if [[ $item =~ 'ecl' ]]; then
	ecl=$(($ecl+1))
    fi
    if [[ $item =~ 'pid' ]]; then
	pid=$(($pid+1))
    fi
    if [[ $item =~ 'cid' ]]; then
	cid=$(($cid+1))
    fi

    # check if any categories have been counted twice
    if [[ $byr -gt 1 ]] || [[ $iyr -gt 1 ]] || [[ $eyr -gt 1 ]] || [[ $hgt -gt 1 ]] || [[ $hcl -gt 1 ]] || [[ $ecl -gt 1 ]] || [[ $pid -gt 1 ]] || [[ $cid -gt 1 ]]; then

	# place cats in an array
	cat_arr=("$byr" "$iyr" "$eyr" "$hgt" "$hcl" "$ecl" "$pid" "$cid")

	# loop through array to check if count of cid category is greater than 0
	for cat in "${cat_arr[@]}"; do
	    
            if [[ $cat = 0 ]]; then
		if [[ ! $cat =~ 'cid' ]]; then
		    cat_count=$(($cat_count+1))
		fi
	    #else 
	    fi
	    
	    # if there are no blank categories, then it is a good passport
	    if [[ $cat_count = 0 ]]; then
		good_pass=$(($good_pass+1))
	    fi
	    
	    # re
	    if [[ $cat -gt 1 ]]; then
		echo
	    fi
	done

    fi
    
done

echo ---
echo Total item found:
echo $count
echo Categories:
echo 'byr: '$byr
echo 'iyr: '$iyr
echo 'eyr: '$eyr
echo 'hgt: '$hgt
echo 'hcl: '$hcl
echo 'ecl: '$ecl
echo 'pid: '$pid
echo 'cid: '$cid
echo ---

one=1
two=2
three=3
array=("$one" "$two" "$three")
for num in "${array[@]}"; do
    echo $num
    echo "$num"
done
