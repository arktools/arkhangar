#!/bin/bash
if [[ $# != 1 ]]
then
    echo usage $0 script
    exit
fi
jsbsim-cmd \
    --script=$1 \
    --logdirectivefile=data_output/flightgear.xml \
    --realtime
