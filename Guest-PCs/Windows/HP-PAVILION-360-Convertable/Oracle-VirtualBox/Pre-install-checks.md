# Virtualisation enabled

## Virtual Box error #1

    Not in a hypervisor partition (HVP=0) (VERR_NEM_NOT_AVAILABLE).
    VT-x is disabled in the BIOS for all CPU modes (VERR_VMX_MSR_ALL_VMX_DISABLED).
    Result Code:
    E_FAIL (0X80004005)
    Component:
    ConsoleWrap
    Interface:
    IConsole {6ac83d89-6ee7-4e33-8ae6-b257b2e81be8}

## Solution

Fix : Reboot and enable virtualisation in bios.

### Reference image 
![](https://raw.githubusercontent.com/rohanbatrain/Developement-Setup/main/Attachments/BIOS.jpg)
