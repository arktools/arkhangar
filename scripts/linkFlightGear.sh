#!/bin/bash
FlightGearRoot=/usr/share/games/flightgear
FlightGearLocalRoot=$HOME/FlightGear
UasNasRoot=$HOME/Projects/uas-nas/aircraft
ArkHangarRoot=$HOME/Projects/arkhangar/aircraft

AircraftRoot=$FlightGearRoot/Aircraft
AircraftLocalRoot=$FlightGearLocalRoot/Aircraft

# link to shared FlightGear
rm -rf $FlightGearLocalRoot
mkdir -p $FlightGearLocalRoot
for dir in $(ls $FlightGearRoot)
do
    ln -s $FlightGearRoot/$dir $FlightGearLocalRoot/$dir
done

rm $AircraftLocalRoot
mkdir $AircraftLocalRoot

# link to flightgear aircraft
for dir in $(ls $AircraftRoot)
do
    ln -s $AircraftRoot/$dir $AircraftLocalRoot/$dir
done

# link to arkhangar aircraft
for dir in $(ls $ArkHangarRoot)
do
    ln -s $ArkHangarRoot/$dir $AircraftLocalRoot/$dir
done

# link to uas-nas aircrafts
for dir in $(ls $UasNasRoot)
do
    ln -s $UasNasRoot/$dir $AircraftLocalRoot/$dir
done
