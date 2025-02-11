#!/bin/bash

# Create main category directories
mkdir -p _assets/thumbnails/{defying-gravity,wearables-and-textiles,sensors,inertial-sensing,other}

# Category mappings
declare -A categories=(
    ["19.Defying_Gravity"]="defying-gravity"
    ["17.E-textiles"]="wearables-and-textiles"
    ["8.Sensors"]="sensors"
    ["6.Inertial_Sensing"]="inertial-sensing"
    ["5.Other"]="other"
)

# Base paths
OLD_CONTENT="OLD/portfolio/content"
NEW_ASSETS="_assets/thumbnails"

# Migrate images for each category
for old_cat in "${!categories[@]}"; do
    new_cat="${categories[$old_cat]}"
    
    # Find all thumb.jpg files in the old category
    find "$OLD_CONTENT/$old_cat" -name "thumb.jpg" | while read thumbpath; do
        # Get project name from path
        project_dir=$(basename $(dirname "$thumbpath"))
        project_name=$(echo "$project_dir" | sed 's/^[0-9]*\.//' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
        
        # Create project directory in new structure
        mkdir -p "$NEW_ASSETS/$new_cat/$project_name"
        
        # Copy thumbnail
        cp "$thumbpath" "$NEW_ASSETS/$new_cat/$project_name/thumb.jpg"
        echo "Migrated: $thumbpath -> $NEW_ASSETS/$new_cat/$project_name/thumb.jpg"
    done
done