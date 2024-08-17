$AXFUN
detect_architecture() {
    architecture=$(getprop ro.product.cpu.abi)
    local bin="/data/local/tmp/main"
    
    if [ "$architecture" = "arm64-v8a" ]; then
        mv /data/local/tmp/axeron_cash/sensi/bin/arm64 $bin
    elif [ "$architecture" = "armeabi-v7a" ]; then
        mv /data/local/tmp/axeron_cash/sensi/bin/arm32 $bin
    else
        echo "Unsupported architecture: $architecture"
        exit 1
    fi
}
run_program() {
    local t_toast=""
    local v_toast=""
    local bin="/data/local/tmp/main"
    local reponse="/data/local/tmp/axeron_cash/sensi/free"
    
    echo ""
    rm -rf $response > /dev/null 2>&1
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
    sleep 5 && am start -a android.intent.action.VIEW -d ${sc} > /dev/null 2>&1
}
detect_architecture
sleep 0.9
run_program "$1"
