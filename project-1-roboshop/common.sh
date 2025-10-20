log=/tmp/roboshop

func_systemd() {
  systemctl demon-reload &>>$log
  systemctl enable ${component} &>>$log
  systemctl start ${component} &>>$log
func_exit_status
}


func_appreq() {
echo "\e[36m Installing nginx \e[0m"
yum install nginx -y &>>$log
func_systemd
func_exit_status


echo "\e[36m Removing Default Nginx content \e[0m"
rm -rf /usr/share/nginx/html/*
func_exit_status

echo "\e[36m  \e[0m"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
func_exit_status

}

func_exit_status () {
  echo $? &>>$log
  if [ $? -eq 0 ]; then
    echo -e "\e[32Succes\e[0m"
    else
      echo -e "\e[31Failure\e[0m"
      fi

}