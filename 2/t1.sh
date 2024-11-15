#!/bin/bash
N="$1"
for i in $(seq $N)
do
    for j in $(seq $i)
    do
        echo -n "$j "
    done

    echo ""
done
