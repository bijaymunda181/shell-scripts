log=/tmp/log

echo -e "\e[36m Installing Nginx\e[0m"
yum install nginx -y &>>$log
echo $?

echo -e "\e[36m Starting Nginx\e[0m"
systemctl enable nginx &>>$log
systemctl start nginx &>>$log
echo $?

echo -e "\e[36m Removing Default Nginx Content\e[0m"
rm -rf /usr/share/nginx/html/* &>>$log
echo $?

echo -e "\e[36m Downloading Nginx Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>$log
echo $?
echo -e "\e[36m Unzip Frontend content\e[0m"
cd /usr/share/nginx/html &>>$log
unzip /tmp/frontend.zip &>>$log
echo $?