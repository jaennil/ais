#!/bin/bash

divider() {
    printf "=%.0s" {1..40}
    echo
}

output() {
    local label
    local content
    label="$1"
    content="$2"
    if [[ -n "$output_file" ]]; then
        {
            printf "%s\n" "$label"
            printf "%s\n" "$content"
            divider
        } >> "$output_file"
    else
        {
            printf "%s\n" "$label"
            printf "%s\n" "$content"
            divider
        }
    fi
}

if [[ "$1" == "--tofile" && -n "$2" ]]; then
    output_file="$2"
fi

output "Текущий рабочий каталог:" "$(pwd)"

output "Текущий запущенный процесс:" "$(ps -p $$)"

output "Домашний каталог:" "$HOME"

output "Название и версия операционной системы:" "$(uname -sr)"

output "Доступные оболочки:" "$(cat /etc/shells)"

output "Текущие пользователи, вошедшие в систему:" "$(who)"

output "Количество пользователей, вошедших в систему:" "$(who | wc -l)"

output "Информация о жестких дисках:" "$(df -h)"

output "Информация о процессоре:" "$(lscpu | grep 'Model name')"

output "Информация о памяти:" "$(free -h)"

output "Информация о файловой системе:" "$(df -Th)"

output "Информация об установленных пакетах ПО:" "$(pacman -Q)"
