#!/bin/bash
new_date=`date "+%Y-%m-%d %I:%M:%S %p"`
old_date=`cat ./values.yaml |grep echo | cut -d \" -f2`
sed -i "s/$old_date/$new_date/g" ./values.yaml