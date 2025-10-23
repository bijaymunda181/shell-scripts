source common.sh

echo -e "\e[36mInstalling Nginx\e[0m"
yum install nginx -y &>>${log}
func_exit_status

echo -e "\e[36mStarting Nginx Service\e[0m"
systemctl enable nginx &>>${log}
systemctl start nginx &>>${log}
func_exit_status

echo -e "\e[36mRemoving Default content\e[0m"
rm -rf /usr/share/nginx/html/* &>>${log}
func_exit_status

echo -e "\e[36mDownloading Application Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log}
cd /usr/share/nginx/html &>>${log}
func_exit_status


echo -e "\e[36mExtrating Application Content\e[0m"
unzip /tmp/frontend.zip &>>${log}
func_exit_status