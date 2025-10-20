func_systemd() {
echo -e "\e[36m >>>>>>>>>>>>>>> starting ${component} <<<<<<<<<<<<<<<\e[0m"
systemctl demon-reload ${component} &>>$log
systemctl start ${component} &>>$log
systemctl enable ${component} &>>$log
func_exit_status
}

func_exit_status() {
  if [ $? -eq 0 ]; then
    echo -e "\e[32m✅SUCESS\e[0m"
    else
    echo -e "\e[31m❌FALURE\e[0m"
    exit 10
    fi
}

func_appreq() {
  echo -e "\e[36Create ${component} \e[0m"
  cp ${component}.service /etc/systemd/system/${component}.service &>>$log
  func_exit_status

  echo -e "\e[36mCreating Application User\e[m0"
  id roboshop $>>$log
  if [ $? -ne 0 ]; then
    useradd roboshop &>>$log
    fi
    func_exit_status

echo -e "\e[36m create ApplicationDirectory[0m"
mkdir /app &>>$log
func_exit_status

echo -e "\e[36mDownloading Application Content\e[0m"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
func_exit_status

echo -e "\e[36Unzip Application Content\e[0m"
cd /app
unzip /tmp/cart.zip
func_exit_status

cd /app

echo -e "\e[36m Installing Nodejs Dependencies\e[0m
npm install -y &>>$log

}

func_schema_setup() {
if [ "${schema_type}" == "mongodb" ]; then
  echo -e "\e[36mInstall Mongodb Client \e[0m"
yum install mongodb-org-shell -y $>>$log
fi
func_exit_status

echo -e "\e[36mLoad User Schema\e[0m"
id roboshop &>>log
if [ $? -eq 0 ]; then
  useradd roboshop &>>log
  fi
  func_exit_status


if [ "${schema_type}" == "mysql" ]; then
  echo -e "\e[36mInstall mysql client\e[0m"
yum install mysql -y $>>$log
fi
func_exit_status



}

func_nodejs() {
  echo -e "\e[36m Downloading Nodejs repo \e[0m"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>$log
  func_exit_status

echo -e "\e[36m Installing Nodejs \e[0m"
yum install nodejs -y $>>$log
func_exit_status

echo -e "\e[36m Create mongodb repo\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>log
func_exit_status
func_schema_setup




}
