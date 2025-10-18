func_systemd() {
echo -e "\e[36m >>>>>>>>>>>>>>> starting ${component} <<<<<<<<<<<<<<<\e[0m"
systemctl start ${component} &>>$log
systemctl enable ${component} &>>$log
}