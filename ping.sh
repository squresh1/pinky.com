!#/bin/bash

for x in {192.168.1.19};

do
	ping -c1 $x.$x.$x.$x.$x.$x;

done
