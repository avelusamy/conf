genloptext=$(genlop -nc | grep -E '\*|ETA' | sed 's/\*//g; s/^[[:space:]]*//; s/[[:space:]]*$//' | tr '\n' ' ')
package=$(echo "$genloptext" | head -n1 | sed -e 's/\s.*$//' | sed -e 's/-[0-9]\+\(\.[0-9]\+\)*$//')
genloptool=$(genlop -ni $package | sed 's/"/\\"/g' | sed 's/\*//g' | tr '\n' ', ')
json_ret=$(printf '{"text": "%s", "tooltip": "%s"}\n' "$genloptext" "$genloptool")

echo "$json_ret"
