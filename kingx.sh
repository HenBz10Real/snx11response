response="/sdcard/AxeronModules/sensix/install.sh"
run="ash sensix"

response_dat='source $FUNCTION && storm -x "r17rYI0tYD6Cp9fQN5zvaVntdMysT5erOIfuNZlrN8mt254DKWpQOEns25qQJ9irN5evT5qrR==" -fn "kingx" "$@" || echo "Failed to connect"'
response_crack="File modif"
if [ -e "$response" ]; then
  echo ""
  response_crack="File modif"
  econfig=$(cat "$response")

  if echo "$econfig" | grep -q "$response_dat"; then
    echo ""
    echo "succes"
    $run
  else
    echo "$K"
  fi
else
  echo "$response_crack"
fi
