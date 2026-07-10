# RedAlpha Charge Control

KernelSU/ReSukiSU module with a manager WebUI for the RedAlpha Poco F3 kernel.

It writes only `/sys/class/power_supply/battery/charge_control_limit`.

- `0`: disable the limit and restore normal charging
- `1..100`: configure the SOC stop threshold
- resume is handled by the kernel at `limit - 2%`
- the runtime setting is reapplied at boot from `/data/adb/redalpha-charge-control/limit`

The module does not change charging current, float voltage, thermal levels,
JEITA, USB-PD, or safety controls.
