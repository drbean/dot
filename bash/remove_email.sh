#!/usr/bin/env bash

# was function ploop () {

echo "Who am I? I am '$(whoami)' at '$HOME'"

address_list=$(eval echo email/$LAND/$AREA/*/*/address.txt)
while true ; do read -p '> ' -a p
bad=${p[0]}
if [[ $bad != *@* ]] ; then
    echo "No '@' in bad arg: \"${#p[@]}: ${p[@]}\""  >&2
    continue 1 ; fi
school=$(grep -l "^$bad" $address_list)
#if [[ $bad =~ ^([^@]*@postech\.ac\.kr)[A-Z]+$ ]]; then 
#    p[1]="${BASH_REMATCH[1]}"; fi
if [[ $school == *ntupes* ]]; then 
    p[1]="${bad%ntupes.edu.tw}ntus.edu.tw"; fi
if [[ ${#p[@]} -gt 2 ]]; then
    echo "${p[@]}: Too many args" >&2
elif [[ ${#p[@]} -eq 2 ]]; then
    good=${p[1]}
    sed -i.BAK -e "s/^\($bad\)\(\s\|$\)/$good # \1/" $school
    svn diff $address_list
    screen -p 1 -X stuff \
    "echo $good | /sdf/udd/d/drbean/job/send.sh^M"
    echo "Sending to '$good' via send.sh on sdf."
    svn ci $address_list \
       -m "$bad: Edited
$good"
elif [[ ${#p[@]} -eq 1 ]]; then
    sed -i.BAK -e "s/^\($bad\)\(\s\|$\)/# \1/" $school 2>mess
    mess=$(<mess)
    if [[ $mess == "sed: no input files" ]]
    then echo $mess
    else
        svn diff $address_list;
        svn ci $address_list -m "$bad: User unknown"
    fi
else
    echo "No args: \"${#p[@]}: ${p[@]}\""  >&2
fi
echo
done
