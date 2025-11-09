#!/usr/bin/env bash

# 本程序由 ChatGPT 生成

# Replace all occurrences of "@cn" -> "@maybe_can_be_accessed_directly_inside_cn" in files of current directory (non-recursive)
# Creates .bak backups for modified files.

#
# usage : fix_the_bug_of_attribute_cn_ON_macOS.sh
#

cd $( cd "$( dirname "$0" )" >/dev/null 2>&1 && pwd )
cd ../data

echo "Processing files in $(pwd) ..."
#echo "(Backups will be created with .bak extension for modified files.)"
echo

# Loop over all regular files in current directory (non-recursive)
for file in *; do
  if [ -f "$file" ]; then
    # Skip the script itself
    [ "$file" == "${0##*/}" ] && continue
    
    # Check if file contains @cn
    if grep -q '@cn' "$file"; then
      echo "Modifying: $file"
#      cp "$file" "$file.bak"
      # Use sed to replace in-place (GNU sed syntax)
      # macOS uses BSD sed, so -i requires backup suffix
      sed -i '' 's/@cn/@maybe_can_be_accessed_directly_inside_cn/g' "$file"
    fi
  fi
done

echo
echo "Done."



