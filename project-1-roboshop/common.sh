log=/tmp/log

func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32m SUCESS \e[0m"
    else
      echo -e "\e[31m FAILURE \e[0m"
      fi
}


func_systemd() {
  systemctl demon_reload
  systemctl start ${component}
  systemctl enable ${component}
}

funct_nodejs() {
  echo -e "\e[36myum install nodejs\e[0m"
  yum install nodejs -y &>>${log}
func_exit_status

echo -e "\e[36install nodejs repo\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log}
func_exit_status

echo -e "\e[36m installing nodejs dependencies\e[0m"
npm install &>>${log}
func_exit_status


}

func_appreq() {
  id roboshop &>>${log}
  if [ $? -nq 0 ]; then
    useradd roboshop &>>${log}
    fi
    func_systemd

echo -e "\e[36m creating application directory\e[0m"
mkdir /app

echo -e "\e[36m Downloading Application Content\e[0m"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log}

echo -e "\e[36m Extrating a+Application Content\e[0m"
cd /app
unzip /tmp/${component}.zip
func_exit_status

cd /app



}

func_schema_setup() {
  if [ "${schem_type}" == "mongodb" ]; then
  echo -e "\e[36mmongodb client \e[0m" | tee -a /tmp/roboshop.log
  yum install mongodb-org-shell -y
  func_exit_status

   echo -e "\e[36Load User Schema \e[0m"
  mongo --host MONGODB-SERVER-IPADDRESS </app/schema/${component}.js
func_systemd
