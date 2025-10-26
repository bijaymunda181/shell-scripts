log=/tmp/http.log
source non-fun-reqire.sh


echo -e "\e[36m Installing http service\e[0m"
yum install httpd -y &>>${log}
func_exit_status

echo -e "\e[36mcopy webpage content\e[0m"
  cp index.html /var/www/html/index.html &>>${log}
  func_exit_status

echo -e "\e[36mStarting Nginx Service\e[0m"
systemctl enable httpd &>>${log}
systemctl start httpd &>>${log}
func_exit_status

echo -e "\e[36mservice status\e[0m"
if systemctl is-active --quiet httpd; then
    echo -e "\e[32mHTTPD Service is Running - OK\e[0m"
else
    echo "\e[31mHTTPD Service is NOT running - FAILED\e[0m"
    exit 1   # Stop script if service is not running
fi







