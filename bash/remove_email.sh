#!/usr/bin/env bash

# was function ploop () {

AREA=${AREA%/}
while true ; do read -p '> ' -a p
bad=${p[0]}
if [[ $bad != *@* ]] ; then
    echo "No '@' in bad arg: \"${#p[@]}: ${p[@]}\""  >&2
    exit 1 ; fi
school=$(grep -l "^$bad" $AREA/*/*/address.txt)
if [[ $school == *ntupes* ]]; then 
    p[1]="${bad%ntupes.edu.tw}ntus.edu.tw"; fi
if [[ ${#p[@]} -gt 2 ]]; then
    echo "${p[@]}: Too many args" >&2
elif [[ ${#p[@]} -eq 2 ]]; then
    good=${p[1]}
    sed -i.BAK -e "s/^\($bad\)\(\s\|$\)/$good # \1/" $school
    svn diff $AREA/*/*/address.txt
    screen -p 1 -X stuff \
    "echo $good | /sdf/udd/d/drbean/job/send.sh^M"
    echo "Sending to '$good' via send.sh on sdf."
    svn ci $AREA/*/*/address.txt \
       -m "$bad: Edited
$good"
elif [[ ${#p[@]} -eq 1 ]]; then
    sed -i.BAK -e "s/^\($bad\)\(\s\|$\)/# \1/" $school
    svn diff $AREA/*/*/address.txt;
    svn ci $AREA/*/*/address.txt -m "$bad: User unknown"
else
    echo "No args: \"${#p[@]}: ${p[@]}\""  >&2
fi
echo
done
