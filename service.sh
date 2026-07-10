#!/system/bin/sh

CONFIG=/data/adb/redalpha-charge-control/limit
TARGET=/sys/class/power_supply/battery/charge_control_limit

[ -r "$CONFIG" ] || exit 0
[ -w "$TARGET" ] || exit 0
limit=$(cat "$CONFIG" 2>/dev/null)
case "$limit" in
  ''|*[!0-9]*) exit 0 ;;
esac
[ "$limit" -le 100 ] || exit 0
echo "$limit" > "$TARGET"
