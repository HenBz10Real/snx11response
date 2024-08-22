if [ "$(basename "$0")" != "king64" ]; then
	exit 1
fi

source /data/local/tmp/hxfun

t_priorities() {
	local pid="$1"

	cmd="pgrep -f '$pid'"
	pids=$(eval "$cmd")

	for p in $pids; do
		cmd="/proc/$p/task/"
		if [ -d "$cmd" ]; then
			for task_id in $(ls "$cmd"); do
				if [ "$task_id" != "." ] && [ "$task_id" != ".." ]; then
					renice -n -20 -p "$task_id"
					ionice -c 1 -n 0 -p "$task_id"
					chrt -f -p 99 "$task_id"
				fi
			done
		fi
	done
}

sensivityOne() {
    local paths=(
        "/storage/emulated/0/Android/data/com.dts.freefiremax/cache/UnityShaderCache/"
        "/storage/emulated/0/Android/data/com.dts.freefiremax/files/ffrtc_log.txt"
        "/storage/emulated/0/Android/data/com.dts.freefiremax/files/ffrtc_log_bak.txt"
        "/storage/emulated/0/Android/data/com.dts.freefireth/cache/UnityShaderCache/"
        "/storage/emulated/0/Android/data/com.dts.freefireth/files/ffrtc_log.txt"
        "/storage/emulated/0/Android/data/com.dts.freefireth/files/ffrtc_log_bak.txt"
        "/tmp/cache"
    )

    for path in "${paths[@]}"; do
        rm -rf "$path"
    done
    
    wm size 1799x3998
    wm density reset
    device_config put game_overlay com.dts.freefireth fps=120
    device_config put game_overlay com.dts.freefiremax fps=120
}

exec 1>/dev/null
exec 2>/dev/null

prev_window_state=""
game_running=""

cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Version: KingX | Author: Henpeex\""
eval "$cmd"

while true; do
	window_buffer=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -Eo 'com.dts.freefireth|com.dts.freefiremax')

	if [ -n "$window_buffer" ]; then
		if [ "$prev_window_state" != "active" ]; then
			game_running="open"
			sensivityOne
                        sleep 0.5
			wm density $size
			cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Process injecting something\""
			eval "$cmd"
			sleep 2

			cmd="pgrep -f 'com.dts.freefireth|com.dts.freefiremax'"
			pids=$(eval "$cmd")

			for pid in $pids; do
				t_priorities "$pid"
				sleep 0.7
			done

			cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Successfully Inject mode\""
			eval "$cmd"
		fi
		prev_window_state="active"
	else
		if [ "$game_running" = "open" ]; then
		
			proc_buffer=$(pgrep -f 'com.dts.freefireth|com.dts.freefiremax')

			if [ -z "$proc_buffer" ]; then
				game_running=""
				cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Game Closed\""
				eval "$cmd"
                                sleep 0.1
				device_config delete game_overlay
				wm size reset
				wm density reset
			fi
		fi
		prev_window_state=""
	fi

	sleep 5
done
