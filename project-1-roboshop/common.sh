func_systemd() {
echo -e "\e[36m >>>>>>>>>>>>>>> starting ${component} <<<<<<<<<<<<<<<\e[0m"
systemctl start ${component} &>>$log
systemctl enable ${component} &>>$log
}

funct_exit_status() {
  if [ $? -eq 0 ]; then
    echo "\e[32m ✅ nginx installed successfully \e[0m"
    else
    echo "\e[31m ❌ nginx installation failed \e[0m"
}