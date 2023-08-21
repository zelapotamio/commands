#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Este comando deve ser executado como administrador (ou root)."
fi

# Array of commands to execute
commands=(
  "systemctl enable sshd.service"
  "systemctl start sshd.service"
  "ip addr | grep inet | grep wlan0"
)

# Prompt for sudo password
read -s -p "Digite sua senha do deck (Eh normal a tela ficar preta): " sudo_password
echo

# Extract IP address from the third command's output
ip_address=$(ip addr | grep inet | grep wlan0 | awk '{print $2}' | sed 's/\/.*//')
echo "--------------------------------------------------------"
echo "SSH habilitado."
echo "--------------------------------------------------------"
echo "Agora abra o  WinSCP no seu PC Windows"
echo "E insira os seguintes dados:"
echo "--------------------------------------------------------"
echo "| IP: $ip_address"
echo "| User: deck"
echo "| Password: Sua senha do deck (vc tem que saber, fiote)"
echo "--------------------------------------------------------"
