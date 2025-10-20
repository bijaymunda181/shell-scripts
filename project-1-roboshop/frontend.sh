echo -e "\e[36m Installing Nginx\e[0m"
yum install nginx -y &>>/tmp/roboshop.log
echo $?

echo -e "\e[36m Starting Nginx\e[0m"
systmpctl enable nginx &>>/tmp/roboshop.log
systmpctl start nginx &>>/tmp/roboshop.log
echo $?

echo -e "\e[36m Removing Default Nginx Content\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
echo $?

echo -e "\e[36m Downloading Nginx Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log
echo $?
echo -e "\e[36m Unzip Frontend content\e[0m"
cd /usr/share/nginx/html &>>/tmp/roboshop.log
unzip /tmp/frontend.zip &>>/tmp/roboshop.log
echo $? &>>/tmp/roboshop.log