#!/bin/bash

# Масив з URL вебсайтів для перевірки

websites=("https://google.com" "https://facebook.com" "https://twitter.com")
# Назва файлу логів

log_file="website_status.log"

# Очищення файлу логів перед записом> "$log_file"

echo "Перевірка вебсайтів, будь ласка, зачекайте..."

# Цикл для перевірки доступності кожного сайту
for website in "${websites[@]}"; do 
   # Виконання запиту з обробкою переадресації (-L) і виведенням лише HTTP-коду (-s -o /dev/null -w "%{http_code}")

    status_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$website")    
    if [[ "$status_code" -eq 200 ]]; then     
       # Якщо статус-код 200, сайт доступний
        echo "$website is UP" | tee -a "$log_file"    else
        # Інакше сайт недоступний        echo "$website is DOWN" | tee -a "$log_file"
    fi
done
echo "Результати записані у файл $log_file."