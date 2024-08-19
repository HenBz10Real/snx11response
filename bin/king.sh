if [ "$(basename "$0")" != "king64" ]; then
	exit 1
fi

density_values=$(wm density | grep -oE '[0-9]+')
first_density=$(echo "$density_values" | sed -n '2p')

set_priorities() {
	local pid="$1"

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
	rm -rf /tmp/cache
	wm size 2440x5495
        sleep 0.3
	wm density "$first_density"
}

exec 1>/dev/null
exec 2>/dev/null

prev_window_state=""
game_running=""

cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Version: Kingx | Author: Henpeex\""
eval "$cmd"

for metadata in com.dts.freefireth com.dts.freefiremax com.dts.freefireadv; do
	cmd device_config delete game_overlay $metadata
done

while true; do
	clear

	buffer=$(dumpsys window | grep -E 'mCurrentFocus|mFocusedApp' | grep -Eo 'com.dts.freefireth|com.dts.freefiremax')

	if [ -n "$buffer" ]; then
		if [ "$prev_window_state" != "active" ]; then
			game_running="open"
			cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Process injecting something\""
			eval "$cmd"
			sleep 11

			sensivityOne

			for dir in /storage/emulated/0/Android/data/com.dts.freefireth/cache/ \
				/storage/emulated/0/Android/data/com.dts.freefiremax/cache/; do
				rm -rf "$dir" || true
			done

			cmd="pgrep -f 'com.dts.freefireth|com.dts.freefiremax'"
			pids=$(eval "$cmd")

			for pid in $pids; do
				set_priorities "$pid"
				sleep 1
			done

			cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Successfully Inject mode\""
			eval "$cmd"
		fi
		prev_window_state="active"
	else
		if [ "$game_running" = "open" ]; then
			game_running=""
			cmd="cmd notification post -S bigtext -t \"FreeFireScript\" \"Tag\" \"Game Closed\""
			eval "$cmd"
			sleep 5
			cmd power set-fixed-performance-mode-enabled false
			wm size reset
			wm density "$override_density"
		fi
		prev_window_state=""
	fi
	sleep 5
done
