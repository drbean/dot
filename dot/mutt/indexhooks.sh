#!/bin/sh

cd $HOME/Mail;

# printf "folder-hook . 'macro index h <change-folder>?<tab><jump><enter>0<enter>'\n";
# printf "folder-hook '!' 'macro index h <change-folder>?<tab><jump><enter>1<enter>'\n";
printf "folder-hook '!' 'macro index h <change-folder>?<tab>1<enter>'\n";

for file in *;
 do { printf "folder-hook =$file 'macro index h <change-folder>?<tab><search>=$file<enter>'\n"; } ;
done;
cd -
