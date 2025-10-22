echo -e "\e[36mCreating catalog service file\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[36mCreating Mongodb repo\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[36mInstall nodejs Repo\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[36mInstalling Nodejs\e[0m"
yum install nodejs -y

echo -e "\e[36mCreating Roboshop user\e[0m"
useradd roboshop

echo -e "\e[36mCreating Application Directory\e[0m"
mkdir /app

echo -e "\e[36m\eDownloading Application Content[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip


echo -e "\e[36mExtrating Application Content the Application Content\e[0m"
cd /app
unzip /tmp/catalogue.zip
cd /app

echo -e "\e[36mDownload Nodejs Depandences\e[0m"
npm install

echo -e "\e[36Installing Mongodb Client\e[0m"
yum install mongodb-org-shell -y
echo -e "\e[36mLoad catalogue schema\e[0m"
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js

echo -e "\e[36mstarting catalogue servive\e[0m"
#systemctl daemon-reload
#systemctl enable catalogue
#systemctl restart catalogue