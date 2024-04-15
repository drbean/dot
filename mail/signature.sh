#!env bash

declare -a fortune signature
readarray -t fortune

readarray -t signature <<SIGNOFF
Greg "Dr Bean" Matheson
http://drbean.sdf.org
drbean@freeshell.org
SIGNOFF

for (( i=0 ; i<=2 ; i++  )) ; do echo -e "${signature[$i]}\t\t${fortune[$i]}" ; done
for (( i=3 ; i<=${#fortune[@]} ; i++  )) ; do echo -e "\t\t\t\t${fortune[$i]}" ; done
