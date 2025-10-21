log=/tmp/roboshop.log

func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32mSucess\e[0m"
    else
      echo -e "\e[31mFAILED[0m"
      fi
}

func_systemd() {
  systemctl demon-reload &>>${log}
  systemctl enable ${component} &>>${log}
  systemctl start ${component} &>>${log}
  func_exit_status
}