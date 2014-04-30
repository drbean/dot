#!/bin/sh

for mailbox in $@;
do {
	printf =$mailbox;
	printf " ";
};
done;

cd $HOME/Mail;
for mailbox in *;
do {
	printf =$mailbox;
	printf " ";
};
done;
cd -;
