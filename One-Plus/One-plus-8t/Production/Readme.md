# Preparing

> In production we are using NAMELESS OS 12.1 with kali nethunter 

## NAMELESS OS

From [wiki](https://nameless.wiki/getting-started/install/for_8_9R)

1. Reboot your phone to fastboot mode
2. Open cmd and go to the folder where platform tools are (DO NOT USE POWERSHELL!)
3. Enter following commands by copypasting one by one:
 
 ```
 fastboot flash boot boot.img
 ```
 
 ```
 fastboot flash vbmeta vbmeta.img
 ```
 
 ```
 fastboot flash vbmeta_system vbmeta_system.img
 ```
 
4. Reboot your phone to recovery mode, click "Install update" -> "ADB Sideload"
5. In cmd enter command: 

```
adb sideload Nameless-AOSP_xxx.zip
```

6. Wait until your device shows Step 2/2 and back arrow appears. Click back arrow, then click "Factory reset" -> "Format data/factory reset" -> "Format data"



## KALI NETHUNTER

Steps from the [documentation](https://forum.xda-developers.com/t/rom-unofficial-nethunter-oneplus-8t-android-11-12-26-08-21.4324555/)

```

    Copy twrp, magisk, NetHunter kernel & NetHunter zip to external USB-C drive​
    Flash TWRP​
    Reboot into recovery, format data & reboot back to recovery​
    Install Magisk​
    Reboot to system, finish Android setup, launch Magisk app & apply post install requirements​
    Install NetHunter zip through Magisk​
    Flash NetHunter kernel using kernel manager or twrp recovery​
    Reboot to system & run NetHunter app​
    Update NetHunter app from NetHunter Store​


```




