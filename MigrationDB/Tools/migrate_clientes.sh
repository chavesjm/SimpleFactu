#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Error: Usage $0 clients_file"
	exit 1;
fi;

file=$1

while read -r line; do 
	id=$(echo $line | awk -F',' '{print $1}' | sed 's/"//g')
	name=$(echo $line | awk  -F'","' '{print $2}')
	dni=$(echo $line | awk  -F'","' '{print $3}')
	address=$(echo $line | awk  -F'","' '{print $5}')
	city=$(echo $line | awk  -F'","' '{print $6}')
	province=$(echo $line | awk  -F'","' '{print $7}')
	zipCode=$(echo $line | awk  -F'","' '{print $8}')
	country=$(echo $line | awk  -F'","' '{print $9}')
	phone=$(echo $line | awk  -F'","' '{print $10}')
	email=$(echo $line | awk  -F'","' '{print $13}')
	notes=$(echo $line | awk  -F'","' '{print $11}')
	
	echo "INSERT INTO clients(id,name,dni,address,city,province,zipCode,country,phone,email,notes)
		VALUES (${id},'${name}','${dni}','${address}','${city}','${province}','${zipCode}','${country}','${phone}','${email}','${notes}');" >> ${file}.sql
	
done < $file
