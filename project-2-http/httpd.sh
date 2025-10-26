log=/tmp/http.log
source common.sh
source index.html


echo -e "\e[36m Installing http service\e[0m"
yum install httpd -y &>>${log}
func_exit_status

echo -e "\e[36copy webpage content\e[0m"
  cp index.html /var/www/html/index.html &>>${log}
  func_exit_status

echo -e "\e[36mStarting httpd Service\e[0m"
systemctl enable httpd &>>${log}
systemctl start httpd &>>${log}
func_exit_status

fucc_http_stats




