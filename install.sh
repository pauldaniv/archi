loadkeys dvorak
timedatectl set-ntp true
if [[ -z /dev/mapper/cryptroot ]]; then
    cryptsetup open /dev/nvme0n1p2 cryptroot
fi

mount /dev/mapper/cryptroot /mnt

if [[ -z /mnt/boot ]]; then
    mkdir -p /mnt/boot
    mount /dev/nvme0n1p1 /mnt/efi
fi

if [[ -z /dev/mapper/crypthome ]]; then
    cryptsetup open /dev/nvme0n1p3 crypthome
fi
if [[ -z /mnt/home ]]; then
    mkdir -p /mnt/home
    mount /dev/mapper/crypthome /mnt/home
fi

