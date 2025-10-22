nodejs() {
  log=/tmp/roboshop.log # Its a variable

  echo -e "\e[36mCreating ${component} service file\e[0m"
  cp ${component}.service /etc/systemd/system/${component}.service &>>${log}

  echo -e "\e[36mCreating Mongodb repo\e[0m"
  cp mongo.repo /etc/yum.repos.d/mongo.repo &>>${log}

  echo -e "\e[36mInstall nodejs Repo\e[0m"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log}

  echo -e "\e[36mInstalling Nodejs\e[0m"
  yum install nodejs -y &>>${log}

  echo -e "\e[36mCreating Roboshop ${component}\e[0m"
  ${component}add roboshop &>>${log}

  echo -e "\e[36mRemoving the old content\e[0m"
  rm -rf /app &>>${log}

  echo -e "\e[36mCreating Application Directory\e[0m"
  mkdir /app &>>${log}

  echo -e "\e[36mDownloading Application Content\e[0m"
  curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log}


  echo -e "\e[36mExtrating Application Content\e[0m"
  cd /app
  unzip /tmp/${component}.zip &>>${log}
  cd /app

  echo -e "\e[36mDownload Nodejs Depandences\e[0m"
  npm install &>>${log}

  echo -e "\e[36mInstalling Mongodb Client\e[0m"
  yum install mongodb-org-shell -y &>>${log}

  echo -e "\e[36mLoad ${component} schema\e[0m"
  mongo --host mongodb.rdevopsb72.online </app/schema/${component}.js &>>${log}

  echo -e "\e[36mstarting ${component} servive\e[0m"
  systemctl daemon-reload &>>${log}
  systemctl enable ${component} &>>${log}
  systemctl restart ${component} &>>${log}

}