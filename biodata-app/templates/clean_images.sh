#!/bin/bash

# === Allowed file IDs (without extensions) ===
allowed_ids=("148" "144" "142" "140" "139" "138" "137" "136" "134" "131" "132" "133" "129" "126" "123" "121" "120" "119" "117" "112" "113" "114" "110" "108" "106" "124" "149" "151" "152" "155")

# === Directories to clean ===
dirs=("./demo/girls" "./demo/boys")

# === Main logic ===
for dir in "${dirs[@]}"; do
  echo "🧹 Checking directory: $dir"

  # Ensure directory exists
  [ -d "$dir" ] || { echo "⚠️ Skipping missing directory: $dir"; continue; }

  # Loop through all png and webp files in directory
  for file in "$dir"/*.{png,webp}; do
    # Skip if no file matches pattern
    [ -e "$file" ] || continue

    # Get base filename without extension
    basename="$(basename "${file%.*}")"

    # If file name not in allowed list, remove it
    if [[ ! " ${allowed_ids[*]} " =~ " ${basename} " ]]; then
      echo "🗑️ Removing: $file"
      rm -f "$file"
    else
      echo "✅ Keeping: $file"
    fi
  done
done

echo "✨ Cleanup complete!"
