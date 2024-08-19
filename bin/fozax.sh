if [ "$(basename "$0")" != "fozx64" ]; then
    exit 1
fi

task="wm density | awk '/Override density/ {print $3}'"

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
                    renice -n -20 -p "$task_id"
                    ionice -c 1 -n 0 -p "$task_id"
                    chrt -f -p 70 "$task_id"
                fi
            done
        fi
    done
}

sensivityOne() {
    cmd power set-fixed-performance-mode-enabled true || true
    rm -rf /tmp/cache
    wm size 1350x3075
    sleep 1
    wm density "$task"
}


exec 1>/dev/null
exec 2>/dev/null

prev_window_state=""
game_running=""

cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Version: Fozax | Author: Henpeex\""
eval "$cmd"

while true; do
    clear

    buffer=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -Eo 'com.dts.freefireth|com.dts.freefiremax')

    if [ -n "$buffer" ]; then
        if [ "$prev_window_state" != "active" ]; then
            game_running="open"
            cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Process injecting something\""
            eval "$cmd"
            sleep 6
            
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
            sleep 3
            cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Game Closed\""
            eval "$cmd"
            cmd power set-fixed-performance-mode-enabled false
            wm size reset
            wm density "$task"
        fi
        prev_window_state=""
    fi
    sleep 5
done