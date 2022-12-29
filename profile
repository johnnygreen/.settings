#!/bin/bash

base_dir=~/.settings

folders=(functions apps)

for folder in ${folders[@]}
do
  for file in $(find $base_dir/$folder -type f)
  do
    source $file
  done
done

# prompt
source "$base_dir/prompt"

# aliases
source "$base_dir/aliases"
