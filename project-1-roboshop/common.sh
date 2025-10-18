func_systemd() {
echo -e "\e[36m >>>>>>>>>>>>>>> starting ${component} <<<<<<<<<<<<<<<\e[0m"
systemctl demon-reload ${component} &>>$log
systemctl start ${component} &>>$log
systemctl enable ${component} &>>$log
func_exit_status
}

func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32m✅SUCESS\e[0m"
    else
    echo -e "\e[31m❌FALURE\e[0m"
    exit 10
    fi
}

func_ppreq() {
  echo -e "\e[36Create ${component} \e[0m"
  cp ${component}.service /etc/systemd/system/${component}.service &>>$log
  func_exit_status

}

