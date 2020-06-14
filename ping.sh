!#/bin/bash

for x in {192.168.1.9};

do
	ping -c1 $x.$x.$x.$x.$x.$x;

	echo hello pinky 
done
