#!/bin/bash
# Batch convert animated .webp files to .webm
# Usage: ./batch_webp_to_webm.sh [directory]
# Requirements: anim_dump, webpmux, ffmpeg

# based on https://askubuntu.com/questions/1140873/how-can-i-convert-an-animated-webp-to-a-webm
# get anim_dump and webpmux from https://chromium.googlesource.com/webm/libwebp
# kinda buggy but ok

set -euo pipefail
IFS=$'\n\t'  # safer word splitting

# 1. Input directory (default = current dir)
INPUT_DIR="${1:-.}"

# 2. Validate directory
if [[ ! -d "$INPUT_DIR" ]]; then
    echo "Error: '$INPUT_DIR' is not a valid directory."
    exit 1
fi

cd "$INPUT_DIR"

# 3. Create output directory
OUTPUT_DIR="output"
mkdir -p -- "$OUTPUT_DIR"

echo "Converting .webp files in: $INPUT_DIR"
echo "Output will be saved in: $OUTPUT_DIR"
echo

# 4. Process each .webp file
for file in *.webp; do
    [ -e "$file" ] || continue  # skip if no .webp files found

    base="${file%.webp}"
    echo "Processing: $file"

    # Create temporary folder and dump frames
    mkdir -p -- "${base}_frames"
    cd -- "${base}_frames"
    anim_dump "../$file" >/dev/null
    cd ..

    # Extract duration (from first frame line)
    duration=$(webpmux -info "$file" | awk '/^  *1:/ {print $7; exit}')

    if [[ -z "$duration" ]]; then
        echo "  Could not extract duration — creating static WebM (3 seconds) from first frame."
        ffmpeg -loglevel error -loop 1 -i "${base}_frames/dump_0000.png" \
            -t 3 -c:v libvpx-vp9 -pix_fmt yuv420p "${OUTPUT_DIR}/${base}.webm"
    else
        echo "  Using framerate: ${duration} fps"
        ffmpeg -loglevel error -framerate "$duration" -i "${base}_frames/dump_%04d.png" \
            -c:v libvpx-vp9 -pix_fmt yuv420p "${OUTPUT_DIR}/${base}.webm"
    fi

    # Clean up temporary frames
    rm -r -- "${base}_frames"

    echo "  Done: ${OUTPUT_DIR}/${base}.webm"
    echo
done

echo "All files processed successfully."
