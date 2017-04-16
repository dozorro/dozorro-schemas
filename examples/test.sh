#!/bin/sh

validate=jsonvalidate

for f in tender???.json ;
do
  schema=${f/.json/}
  echo $schema
  for example in ../examples/example-*$schema*.json
  do
	  echo "  $example"
	  case "$example" in
		*bad*)
			$validate $f $example >/dev/null 2>/dev/null && echo "\033[1;31m  FAIL  \033[0m"
			;;
		*)
			$validate $f $example || echo "\033[1;31m  FAIL  \033[0m"
	  esac
  done
done

