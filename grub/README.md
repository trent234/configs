DESCRIPTION:  
grub sets the grub config. 

COREQUISITE:  
* grub 
* efibootmgr

DEFAULT INSTALL LOCATION:  
/etc/default/grub 

INSTALL:  
* sudo pacman -S grub efibootmgr
* sudo mount /dev/sdaX /mnt/efi (confirm efi partition and create target dir)
* grub-install --target=x86_64-efi --efi-directory=/mnt/efi --bootloader-id=GRUB
* ln -sf /opt/configs/grub/grub /etc/default/grub
* grub-mkconfig -o /boot/grub/grub.cfg
More instructions here:  
https://wiki.archlinux.org/title/GRUB

Install the solarized theme from here and use its install script:  
https://github.com/bino-faata/grub2-solarized-dark  
Pretty sure all it does is copy the repo folder to /boot/grub/themes/grub2-solarized-dark  
so thats an option.
