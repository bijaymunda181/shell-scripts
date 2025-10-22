log=/tmp/roboshop.log

echo -e "\e[36mCreating catalog service file\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service ${log}

echo -e "\e[36mCreating Mongodb repo\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo ${log}

echo -e "\e[36mInstall nodejs Repo\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash ${log}

echo -e "\e[36mInstalling Nodejs\e[0m"
yum install nodejs -y ${log}

echo -e "\e[36mCreating Roboshop user\e[0m"
useradd roboshop ${log}

echo -e "\e[36mRemoving the old content\e[0m"
rm -rf /app ${log}

echo -e "\e[36mCreating Application Directory\e[0m"
mkdir /app ${log}

echo -e "\e[36mDownloading Application Content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip ${log}


echo -e "\e[36mExtrating Application Content\e[0m"
cd /app
unzip /tmp/catalogue.zip ${log}
cd /app

echo -e "\e[36mDownload Nodejs Depandences\e[0m"
npm install ${log}

echo -e "\e[36mInstalling Mongodb Client\e[0m"
yum install mongodb-org-shell -y ${log}

echo -e "\e[36mLoad catalogue schema\e[0m"
mongo --host mongodb.rdevopsb72.online </app/schema/catalogue.js ${log}

echo -e "\e[36mstarting catalogue servive\e[0m"
systemctl daemon-reload ${log}
systemctl enable catalogue ${log}
systemctl restart catalogue ${log}