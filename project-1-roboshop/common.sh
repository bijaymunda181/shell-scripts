log=/tmp/roboshop.log

func_apppreq() {

    echo -e "\e[36mCreating ${component} service file\e[0m"
    cp ${component}.service /etc/systemd/system/${component}.service &>>${log}
    func_exit_status

    echo -e "\e[36mCreating Roboshop user\e[0m"
    useradd roboshop &>>${log}

    func_exit_status

    echo -e "\e[36mRemoving the old content\e[0m"
    rm -rf /app &>>${log}
    func_exit_status

    echo -e "\e[36mCreating Application Directory\e[0m"
    mkdir /app &>>${log}
    func_exit_status

    echo -e "\e[36mDownloading Application Content\e[0m"
    curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log}
    func_exit_status


    echo -e "\e[36mExtrating Application Content\e[0m"
    cd /app
    unzip /tmp/${component}.zip &>>${log}
    func_exit_status
    cd /app



}

func_systemd() {
    systemctl daemon-reload &>>${log}
    systemctl enable ${component} &>>${log}
    systemctl restart ${component} &>>${log}
    func_exit_status
}

func_schema_setup() {
  if [ "${schema_setup}" == "mongodb" ]; then
  echo -e "\e[36mInstalling Mongodb Client\e[0m"
  yum install mongodb-org-shell -y &>>${log}
  func_exit_status

  echo -e "\e[36mLoad ${component} schema\e[0m"
  mongo --host mongodb.rdevopsb72.online </app/schema/${component}.js &>>${log}
  func_exit_status
 fi

   echo -e "\e[36mInstall MYSQL client\e[0m"
   if [ "${schema_type}" == "mysql" ]; then
     echo -e "\e[36mInstall MYSQL Client\e[0m"
     yum install mysql -y &>>${log}
     func_exit_status

     echo -e "\e[36mLoad user schema\e[0m"
     mysql -h mysql.rdevopsb72.online -uroot -pRoboShop@1 < /app/schema/${component}.sql &>>${log}
     func_exit_status
 fi
 }



func_nodejs() {
  log=/tmp/roboshop.log # Its a variable


  echo -e "\e[36mCreating Mongodb repo\e[0m"
  cp mongo.repo /etc/yum.repos.d/mongo.repo &>>${log}
  func_exit_status

  echo -e "\e[36mInstall nodejs Repo\e[0m"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log}
  func_exit_status

  echo -e "\e[36mInstalling Nodejs\e[0m"
  yum install nodejs -y &>>${log}
  func_exit_status


func_apppreq

  echo -e "\e[36mDownload Nodejs Depandences\e[0m"
  npm install &>>${log}
  func_exit_status

func_schema_setup

  func_systemd


}


func_java() {

 echo -e "\e[36mInstall maven\e[0m"
  yum install maven -y &>>${log}
  func_exit_status

func_apppreq

echo -e "\e[36mBuild ${component} servive\e[0m"
  mvn clean package &>>${log}
  mv target/${component}-1.0.jar ${component}.jar &>>${log}
  func_exit_status

func_schema_setup

func_systemd
}

func_python() {
echo -e "\e[36mBuild ${component} service\e[0m"
yum install python36 gcc python3-devel -y &>>${log}
func_exit_status

func_apppreq

echo -e "\e[36mBuild ${component} service\e[0m"
pip3.6 install -r requirements.txt &>>${log}
func_exit_status

func_systemd

}




func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32m Sucess \e[0m"
    else
      echo -e "\e[31mFAILURE\e[0m"
      fi
}