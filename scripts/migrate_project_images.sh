#!/bin/bash

# Create main category directories for both thumbnails and project images
mkdir -p _assets/{thumbnails,images}/{defying-gravity,wearables-and-textiles,sensors,inertial-sensing,other}

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
NEW_ASSETS="_assets"

# Function to convert directory name to URL-friendly format
clean_name() {
    echo "$1" | sed 's/^[0-9]*\.//' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g'
}

# Migrate images for each category
for old_cat in "${!categories[@]}"; do
    new_cat="${categories[$old_cat]}"
    
    # Process each project directory
    find "$OLD_CONTENT/$old_cat" -mindepth 1 -maxdepth 1 -type d | while read project_dir; do
        # Skip _material directories at category level
        [[ $(basename "$project_dir") == "_material" ]] && continue
        
        # Clean project name
        project_name=$(clean_name "$(basename "$project_dir")")
        
        # Create project directories
        mkdir -p "$NEW_ASSETS/thumbnails/$new_cat/$project_name"
        mkdir -p "$NEW_ASSETS/images/$new_cat/$project_name"
        
        # Copy thumbnail if it exists
        if [[ -f "$project_dir/thumb.jpg" ]]; then
            cp "$project_dir/thumb.jpg" "$NEW_ASSETS/thumbnails/$new_cat/$project_name/thumb.jpg"
            echo "Migrated thumbnail: $project_name"
        fi
        
        # Copy project images from _material directory if it exists
        if [[ -d "$project_dir/_material" ]]; then
            # Find and copy image files, excluding certain formats
            find "$project_dir/_material" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) \
                ! -path "*/\.*" ! -path "*/_*" | while read img; do
                # Get relative path within _material
                rel_path=$(realpath --relative-to="$project_dir/_material" "$img")
                # Create target directory
                mkdir -p "$NEW_ASSETS/images/$new_cat/$project_name/$(dirname "$rel_path")"
                # Copy image
                cp "$img" "$NEW_ASSETS/images/$new_cat/$project_name/$rel_path"
                echo "Migrated project image: $project_name/$rel_path"
            done
        fi
    done
done