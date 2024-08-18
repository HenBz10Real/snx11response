$AXFUN
printer() {
	text="$1"
	color="$2"
	i=0
	while [ $i -lt ${#text} ]; do
		echo -en "\e[${color}m${text:$i:1}\e[0m"
		sleep 0.02
		i=$((i + 1))
	done
	echo
}
local bin="/data/local/tmp/main"
local path="/data/local/tmp/axeron_cash/headtrick/bin/"
storm -rP "$path" -s "r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mQeAcQJ5qrR==" -fn "arm64" "$@"
run_program() {
    local v_toast="Version : 11.2.5"
    local t_toast="FREE - HEADSENSX"
    local reponse="/data/local/tmp/axeron_cash/sensi/free"
    mv /data/local/tmp/axeron_cash/headtrick/bin/arm64 $bin
    
    echo ""
    sleep 1
    rm -rf $response
    sleep 1
    echo ""
    echo "
 █▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀▀ █▀█ █▀▀ █▀▀
 ▄█ ██▄ █░▀█ ▄█ █ █░█   █▀░ █▀▄ ██▄ ██▄"
    echo ""
    sleep 0.8 && echo
    printer "- Version : v11.3.0 Free Version"
    sleep 0.5
    printer "- Developer : @Henpeex"
    sleep 0.1
    echo
    echo
    
    if [ "$1" = "kill" ]; then
        if ! pgrep -f main >/dev/null 2>&1; then
            echo "Program is stopped in the background."
        else
            echo "Program failed to stop."
        fi
    else
        if ! pgrep -f main >/dev/null 2>&1; then
            chmod +x $bin
            nohup $bin >/dev/null 2>&1 &
        fi
        sleep 2
        if pgrep -f main >/dev/null 2>&1; then
            echo "Program is running in the background."
            am broadcast -a axeron.show.TOAST --es title "$t_toast" --es msg "Developer : henpeex 
$v_toast " --ei duration "4500" >/dev/null 2>&1
        else
            echo "Program failed to run"
        fi
    fi
    
    local sc="https://linktr.ee/henvxofficial"
    rm -rf $reponse > /dev/null 2>&1
    sleep 7 && am start -a android.intent.action.VIEW -d ${sc} > /dev/null 2>&1
}
sleep 0.9
run_program "$1"
