dumpsys power | grep -Eo "mSettingBatterySaverEnabledSticky=true|mSettingBatterySaverEnabledSticky=false" | awk -F'=' '{print $2}'
