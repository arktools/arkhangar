#!/bin/bash
ROOT=~/Projects/uas-nas

if [ $# != 1 ]
then
    echo usage: $0 name
    exit
fi

aircraftName=$1
aircraftPath=$ROOT/aircraft
cp -r $aircraftPath/template $aircraftPath/$aircraftName
find $aircraftPath/$aircraftName -type f -exec sed -i s/\%TEMPLATE\%/${aircraftName}/g {} \;
mv $aircraftPath/$aircraftName/template.xml $aircraftPath/$aircraftName/${aircraftName}.xml
mv $aircraftPath/$aircraftName/template-set.xml $aircraftPath/$aircraftName/${aircraftName}-set.xml

# relink flightgear
$ROOT/scripts/linkFlightGear.sh
