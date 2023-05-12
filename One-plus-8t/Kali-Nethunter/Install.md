# Install 

1. First install oos 13 with android 13 update on oneplus8t
2. boot orange fox recovery (boot only no flashing)
3. Take a backup of everything, and prepare for MSM (in case you brick your device - dont worry things are good with oneplus 8t) 
4. flash nameless aosp android 12, the exact version is [this.]()
5. reboot, your oneplus will not boot twice and that's normal now it will show partition A has to be formatted click format.
6. now you are into nameless aosp reboot and go to nameless recovery.
7. Click on android sideload and apply update
8. Go on an android (termux with drivers if you can find) or pc, open terminal on whicever you have and flash magisk apk, just rename apk to zip.
9. reboot and enable systemless host, zygisk, denylist for safety net etc.
10. and finally flash zip of kali nethunter.
11. You are done. 

I've forgot to run systemrw-mod so removing magisk module and then flashing [orangefox](https://github.com/Wishmasterflo/device_oneplus_opkona/releases/download/R12.1_V16/OrangeFox-R12.1-OPKONA-V16.img) to flash/sideloading that and then reinstalling the module. 

# Orangefox
1. taking a full nandroid backup
2. I mounted every partition and then ran systemrw
3. Pray :) 

# Safety net
1. prepared denylist - google play store and services and its framework have been blacklisted
2. safetynet fix module being flashed
3. 
