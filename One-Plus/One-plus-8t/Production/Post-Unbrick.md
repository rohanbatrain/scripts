# Booting into stock

Getting into stock rom is like getting nostlagia. While I wait my device to boot, I am thinking of what made me go into brick state in the first place. 

# Flashing Orangefox 

Flashing orangefox for android 11

1. Booting into fastboot 
2. Command -> `fastboot oem unlock`
3. Phone will wipe itself out
4. I accidently switched to Slot B, after reading this article i got to know that MSM only flashes on Slot A, so SLOT B was empty. 
5. I wasn't able to boot into anything except fastboot, BRICKED but this time i played a smart move, I was already on stock so i relocked the bootloader and Voila it formatted the data and get me into slot A, I am not aware of any other way using fastboot to switch slots as of now, so this was at the time of writing my one of the best approach imo.


## Restart
1. This time downloading android 13 firmware from official Oneplus site and upgrading it from local install. 
2. I read somewhere that there are issues in some devices unlocking the bootloader, so it is recommended to unlock the bootloader first then perform the local upgrade, i'll attach the source later here.
3. Downloads for [Android-11](https://oxygenos.oneplus.net/OnePlus8TOxygen_15.I.29_OTA_0290_all_2202182359_abd12ff9474549d3.zip) (2.9 GB) , [Android-12](https://oxygenos.oneplus.net/86_sign_KB2001_11_C_OTA_1350_all_a5deec_00011011.zip) (3.9 GB) OR  [Android-13](https://gauss-componentotacostmanual-sg.allawnofs.com/remove-e8db6ccbcf328d52b602fa5897ddb266/component-ota/22/11/15/471125f26d1447f19aa900c5ba2ee42d.zip) (4.4 GB)
4. Android 13 Updated 
  ![](https://github.com/rohanbatrain/Developement-Setup/blob/main/Attachments/One-Plus-8T/Stock-Android/19-05-2023/Android-13-Oct-2022-Version.jpg?raw=true)
5. Booting Orangefox recovery 
6. Alternate way to flash orangefox is used this time, we booted orangefox from fastboot, then copied the same image and flashed from orangefox itself, Checked the box to flash on both slots and now we are running [OrangeFox-R12.1-OPKONA-V18.img](https://github.com/Wishmasterflo/device_oneplus_opkona/releases/download/R12.1_V18/OrangeFox-R12.1-OPKONA-V18.img) On android 13.


## Flashing Nameless 
1. Getting zip from here [Nameless-AOSP_kebab-12.1-20220823-2345-Official](https://sourceforge.net/projects/nameless-aosp/files/kebab/Nameless-AOSP_kebab-12.1-20220823-2345-Official.zip/download)
2. This time we are not doing dirty flashing and following steps with patience.
3. Copying all the required files like: magisk, nameless-aosp in internal storage of device.
4. Flash Nameless-AOSP zip (unmount vendor before flashing was checked)
5. Reboot, Device in a brick state -> turns out downgrading Nameless From Oxygen-OS-13 is not compatible. ( FUTURE ME -> I think i was dumb, i forgot to flash vbmeta and stuff)
6. Restarting

## Unbricking Device again
> MSM Legend

1. All unbricking steps are already laid out. 
2. Following those steps again

## Upgrading to Android 12 
> This time android 12 from the link above.

1. Wow i mentioned about android 12 not being perfect for unlocking the bootloader, yes the volume buttons are just dancing like hell.
2. Downgrading to android 11 and then going to Nameless


