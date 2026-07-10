#!/system/bin/sh

CONFIG=/data/adb/redalpha-charge-control/limit
TARGET=$(find /sys/devices -type f -name redalpha_charge_limit 2>/dev/null | head -n 1)

[ -r "$CONFIG" ] || exit 0
[ -n "$TARGET" ] && [ -w "$TARGET" ] || exit 0
limit=$(cat "$CONFIG" 2>/dev/null)
case "$limit" in
  ''|*[!0-9]*) exit 0 ;;
esac
[ "$limit" -le 100 ] || exit 0
echo "$limit" > "$TARGET"
