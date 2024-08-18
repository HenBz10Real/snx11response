if [ "$(basename "$0")" != "gtrx64" ]; then
    exit 1
fi

set_priorities() {
    local pid="$1"
    local cmd
    local task_id

    cmd="pgrep -f '$pid'"
    pids=$(eval "$cmd")

    for p in $pids; do
        cmd="/proc/$p/task/"
        if [ -d "$cmd" ]; then
            for task_id in $(ls "$cmd"); do
                if [ "$task_id" != "." ] && [ "$task_id" != ".." ]; then
                    renice -n -30 -p "$task_id"
                    ionice -c 1 -n 0 -p "$task_id"
                fi
            done
        fi
    done
}

sensivityOne() {
    cmd power set-fixed-performance-mode-enabled true || true
    rm -rf /tmp/cache || true
    for dir in /storage/emulated/0/Android/data/com.dts.freefireth/cache/ \
               /storage/emulated/0/Android/data/com.dts.freefiremax/cache/; do
        rm -r "$dir" || true
    done
}


exec 1>/dev/null
exec 2>/dev/null

prev_window_state=""
game_running=""

cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Version: Gatrox | Author: Henpeex\""
eval "$cmd"

while true; do
    clear

    buffer=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -Eo 'com.dts.freefireth|com.dts.freefiremax')

    if [ -n "$buffer" ]; then
        if [ "$prev_window_state" != "active" ]; then
            game_running="open"
            cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Process injecting something\""
            eval "$cmd"
            sleep 2
            
            sensivityOne

            cmd="pgrep -f 'com.dts.freefireth|com.dts.freefiremax'"
            pids=$(eval "$cmd")

            for pid in $pids; do
                set_priorities "$pid"
                sleep 0.5
            done

            cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Successfully Inject mode\""
            eval "$cmd"
        fi
        prev_window_state="active"
    else
        if [ "$game_running" = "open" ]; then
            game_running=""
            sleep 1
            cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Game Closed\""
            eval "$cmd"
            cmd power set-fixed-performance-mode-enabled false
        fi
        prev_window_state=""
    fi
    sleep 4
done
