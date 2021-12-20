#!/bin/bash

IFS=$'\r\n' GLOBIGNORE='*' command eval  'ROWS=($(cat ./input))'


y=0
x=1
echo
echo Part 3
echo ---
# right 1, down 1
for row in "${ROWS[@]}"; do

    thing1="${row:0:$x}"
    thing2="${thing1: -1}"

    if [[ $thing2 =~ '#' ]];
    then
	tree=$(($tree+1))
    fi

    x=$((x+1))
    
    if [[ $x -gt 31 ]];
    then
	x=$(($x-31))
    fi
    
done

echo $tree
x=1

#right 3, down 1
for row in "${ROWS[@]}"; do

    thing1="${row:0:$x}"
    thing2="${thing1: -1}"

    if [[ $thing2 =~ '#' ]];
    then
	tree1=$(($tree1+1))
    fi

    x=$((x+3))
    
    if [[ $x -gt 31 ]];
    then
	x=$(($x-31))
    fi
    
done
echo $tree1
x=1

# right 5, down 1
for row in "${ROWS[@]}"; do

    thing1="${row:0:$x}"
    thing2="${thing1: -1}"

    if [[ $thing2 =~ '#' ]];
    then
	tree2=$(($tree2+1))
    fi

    x=$((x+5))
    
    if [[ $x -gt 31 ]];
    then
	x=$(($x-31))
    fi
    
done
echo $tree2
x=1

#right 7, down 1
for row in "${ROWS[@]}"; do

    thing1="${row:0:$x}"
    thing2="${thing1: -1}"

    if [[ $thing2 =~ '#' ]];
    then
	tree3=$(($tree3+1))
    fi

    x=$((x+7))
    
    if [[ $x -gt 31 ]];
    then
	x=$(($x-31))
    fi
    
done
echo $tree3
x=1

#right 1, down 2
for row in "${ROWS[@]}"; do

    if [[ $(($y%2)) == 0 ]];
    then
	
	thing1="${row:0:$x}"
	thing2="${thing1: -1}"
	
	if [[ $thing2 =~ '#' ]];
	then
	    tree4=$(($tree4+1))
	fi
	
	x=$((x+1))
	
	if [[ $x -gt 31 ]];
	then
	    x=$(($x-31))
	fi
	
    fi

    y=$(($y+1))

done
echo $tree4

echo ---
echo $(($tree*$tree1*$tree2*$tree3*$tree4))
