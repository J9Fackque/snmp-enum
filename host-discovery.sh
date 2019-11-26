#!/bin/bash
# 255 for a /24
# Using class C network as an example
for x in {2..254}; do 
	( ping -c 1 192.168.1.$x > /dev/null && echo 192.168.1.$x ) 
done
