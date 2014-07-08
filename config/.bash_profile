
base_dir=~/.settings

#prompt
source "$base_dir/prompt"

# aliases
source "$base_dir/aliases"

folders=(functions applications autocomplete)

for folder in ${folders[@]}
do
  for file in $(find $base_dir/$folder -type f)
  do
    source $file
  done
done
