password=$(cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 8)
echo "$password"