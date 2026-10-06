out=$(genlop -c)
if echo "$out" | grep -q "Error"; then
	exit 1
else
	exit 0
fi
