input=$1
output=$2
length=$3

# Process file
ffmpeg -i $input -ac 1 -ab 26k -ar 16k -f wav pipe: | \
ffmpeg -f wav -i pipe: -ss 0 -to $length -f wav pipe: | \
ffmpeg -f wav -i pipe: -map_metadata -1 -c:v copy -c:a copy $output
