func_systemd() {
echo "Starting ${component} "
systemctl start ${component} &>>$log
systemctl enable ${component} &>>$log
}