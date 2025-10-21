log=/tmp/roboshop.log

func_systemd() {
  echo -e "\e[36mStart ${componet}\e[0m"
  systemctl daemon-reload &>>${log}
  systemctl enable user &>>${log}
  systemctl restart user &>>${log}
  &>>${log}
}

Func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32SUCESS\e[0m"
    else
      echo -e "\e[31mFALURE\e0m"
      fi
}

func_nodejs() {
  echo-e "\e[36mDownload Nodejs Source File\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log}

echo -e "\e[36mInstalling Nodejs\e[0m"
yum install nodejs -y &>>${log}

echo -e "\e[36m>>>>>>>>>>>>>>>>>>   Download NodeJS Dependencies   <<<<<<<<<<<<<<<<\e[0m"
npm install &>>${log}
func_exit_status

func_schema_setup

func_systemd


}

func_appreq() {
id username Func_exit_status
if [ $? -nq 0 ]; then
  useradd roboshop
  fi
  Func_exit_status

echo -e "\e[36mCreaating Application Directory\e[0m"
mkdir /app
Func_exit_status

echo -e "\e[36mDownloading Application Content\e[0m"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log}
Func_exit_status

echo -e "\e[36extrating the zip file\e[0m"
cd /app
unzip /tmp/user.zip &>>${log}
Func_exit_status

cd /app

}


func_schema_setup() {
if [ "${schema_type}" == "$mongodb" ]; then
echo -e "\e[36m>>>>>>>>>>  Install Mongo Client  <<<<<<<<<<\e[0m" | tee -a /tmp/roboshop.log
yum install mongodb-org-shell -y &>>${log}
Func_exit_status

  echo -e "\e[36m>>>>>>>>>>  Load User Schema  <<<<<<<<<<\e[0m" | tee -a /tmp/roboshop.log
  mongo --host mongodb.rdevopsb72.online </app/schema/${component}.js &>>${log}

}
