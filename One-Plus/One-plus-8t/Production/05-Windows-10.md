# Kebab & Windows 10 Integrations

Why? 

I am not able to clone my second-brain-private repository on my windows using github desktop, it has the following error.

![image](https://github.com/rohanbatrain/Developement-Setup/assets/116573125/2044f19f-7591-4a46-be21-07a1c61af378)

I know it seems like an authentication issue but all other repositories are just fine and the one with submodule fails, it is perfectly fine on my linux setup also working perfectly in termux.


## What next? 

So in order to use my second-brain-private repository in obsidian on windows, I have to make a simple sync framework. I am currently on a guest Windows laptop so no long term config is to be used like setting up syncthing etc. Rather i am going to start my ftp server on my android and then mount that ftp on windows explorer using which i am going to open my second brain from my android in the windows pc.

## Setting up FTP 

> I am using Amaze File manager on my kebab, Be sure to disable secure connection and setup a username and password (recommended)

On windows:

1. Open file explorer and type in the url you got in amaze file explorer

![image](https://github.com/rohanbatrain/Developement-Setup/assets/116573125/1c6c1a58-7a79-4ec3-a9af-8e0dedc2d4b7)


2. You'll get a prompt 

![image](https://github.com/rohanbatrain/Developement-Setup/assets/116573125/8d6d64fa-2fb8-4cd6-a0d2-dfff880c4720)

3. Connect and you'll see your files


## Issues

1. Amaze wasn't able to sync dot folders
2. Termux SFTP server should be used (windows file explorer doesn't support sftp) GREAT!!!
3. Trying ![WinFsp](https://github.com/winfsp/winfsp) + ![SSHFS-WIN](https://github.com/winfsp/sshfs-win)

> Steps for 3rd 
1. Map a network drive
![image](https://github.com/rohanbatrain/Developement-Setup/assets/116573125/e610248b-5548-4115-9605-edb05b8ec912)
2. Fill in the required details
![image](https://github.com/rohanbatrain/Developement-Setup/assets/116573125/2fbff1e5-aed2-4c91-8135-011edea19518)


## Fixed

1. Mapping a network drive with this command fixed it `\\sshfs\u0_a393@192.168.1.5!8022`






