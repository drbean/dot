#!/bin/sh

for mailbox in $@;
do {
	printf =$mailbox;
	printf " ";
};
done;

cd Mail;
for mailbox in *;
do {
	printf =$mailbox;
	printf " ";
};
done;
cd -;
