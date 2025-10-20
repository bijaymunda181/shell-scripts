echo -e "\e[36m Installing Nginx\e[0m"
yum install nginx -y &>>/tem/roboshop.log
echo $?

echo -e "\e[36m Starting Nginx\e[0m"
systemctl enable nginx &>>/tem/roboshop.log
systemctl start nginx &>>/tem/roboshop.log
echo $?

echo -e "\e[36m Removing Default Nginx Content\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tem/roboshop.log
echo $?

echo -e "\e[36m Downloading Nginx Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tem/roboshop.log
echo $?
echo -e "\e[36m Unzip Frontend content\e[0m"
cd /usr/share/nginx/html &>>/tem/roboshop.log
unzip /tmp/frontend.zip &>>/tem/roboshop.log
echo $? &>>/tem/roboshop.log