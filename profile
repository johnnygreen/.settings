
base_dir=~/.settings

#prompt
source "$base_dir/prompt"

# aliases
source "$base_dir/aliases"

folders=(functions apps autocomplete)

for folder in ${folders[@]}
do
  for file in $(find $base_dir/$folder -type f)
  do
    source $file
  done
done

export NVM_DIR="/Users/jgreen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
