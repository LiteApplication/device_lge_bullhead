[system/bin/qmuxd]
mode: 0700
user: AID_RADIO
group: AID_SHELL
caps: BLOCK_SUSPEND
[vendor/bin/mm-qcamera-daemon]
mode: 0700
user: AID_CAMERA
group: AID_SHELL
caps: SYS_NICE
[firmware/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0
[persist/]
mode: 0771
user: AID_SYSTEM
group: AID_SYSTEM
caps: 0
