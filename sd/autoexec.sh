#!/bin/sh
# NX2000 live HDMI view (firmware 1.18). Executed at boot by the camera when nx_cs.adj is on the SD card
# (see hunkreborn/Samsung-NX2000-Moding-Hack). Vista en vivo por HDMI de la NX2000.

# The camera program log is needed: esperar-hdmi.sh watches it to know when the HDMI output is up.
# El registro del programa hace falta: esperar-hdmi.sh lo vigila para saber cuándo se enciende el HDMI.
mkdir -p /mnt/mmc/registros
n=$(ls /mnt/mmc/registros | grep -c dlog)
dlogutil -v time -f /mnt/mmc/registros/arranque-$n-dlog.txt &

# In-memory patches (1, 2 and 6) / parches en memoria
/mnt/mmc/parche/parche-memoria.sh

# Waits for the HDMI connection and starts the mirror / espera el HDMI y arranca el espejo
[ -e /mnt/mmc/parche/demo-2d ] && sh /mnt/mmc/parche/esperar-hdmi.sh &

# Optional: Telnet/FTP and Wi-Fi from hunkreborn's mod (only useful for debugging; costs battery).
# Opcional: Telnet/FTP y Wi-Fi del mod de hunkreborn (solo para depurar; gasta batería).
# mkdir -p /dev/pts
# mount -t devpts none /dev/pts
# inetd /mnt/mmc/inetd.conf
# /mnt/mmc/remote/start.sh
# /mnt/mmc/remote/connect.sh
