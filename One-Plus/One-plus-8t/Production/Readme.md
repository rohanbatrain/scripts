# Preparing

> In production we are using NAMELESS OS 12.1 non rooted. 

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

> adb sideload wasn't working, tried orangefox and yes, device is bricked again


Follow unbrick for later instructions.


---

Downloading and trying to update to Android 13 from local update let's see.





