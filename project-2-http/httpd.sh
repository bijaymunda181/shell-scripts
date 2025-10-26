log=/tmp/http.log
source common.sh
source webpage.sh


echo -e "\e[36m Installing http service\e[0m"
yum install httpd -y &>>${log}
func_exit_status

echo -e "\e[36mStarting httpd Service\e[0m"
systemctl enable httpd &>>${log}
systemctl start httpd &>>${log}
func_exit_status





