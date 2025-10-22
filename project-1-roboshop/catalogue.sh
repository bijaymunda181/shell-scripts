echo -e "\e[36mCreating catalog service file\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service $>/tmp/roboshop.log

echo -e "\e[36mCreating Mongodb repo\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo $>/tmp/roboshop.log

echo -e "\e[36mInstall nodejs Repo\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash $>/tmp/roboshop.log

echo -e "\e[36mInstalling Nodejs\e[0m"
yum install nodejs -y $>/tmp/roboshop.log

echo -e "\e[36mCreating Roboshop user\e[0m"
useradd roboshop $>/tmp/roboshop.log

echo -e "\e[36Removing the old content\e[0m"
rm -rf /app $>/tmp/roboshop.log

echo -e "\e[36mCreating Application Directory\e[0m"
mkdir /app $>/tmp/roboshop.log

echo -e "\e[36m\e Downloading Application Content[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip $>/tmp/roboshop.log


echo -e "\e[36mExtrating Application Content the Application Content\e[0m"
cd /app
unzip /tmp/catalogue.zip $>/tmp/roboshop.log
cd /app

echo -e "\e[36mDownload Nodejs Depandences\e[0m"
npm install $>/tmp/roboshop.log

echo -e "\e[36Installing Mongodb Client\e[0m"
yum install mongodb-org-shell -y $>/tmp/roboshop.log

echo -e "\e[36mLoad catalogue schema\e[0m"
mongo --host mongodb.rdevopsb72.online </app/schema/catalogue.js $>/tmp/roboshop.log

echo -e "\e[36mstarting catalogue servive\e[0m"
systemctl daemon-reload $>/tmp/roboshop.log
systemctl enable catalogue $>/tmp/roboshop.log
systemctl restart catalogue $>/tmp/roboshop.log