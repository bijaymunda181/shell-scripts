source common.sh
component=nginx
log=/tmp/roboshop.log

echo -e "\e[36m >>>>>>>>>>>>>>> installing nginx <<<<<<<<<<<<<<<\e[0m"
yum install nginx -y &>>$log
func_exit_status

func_systemd

echo -e "\e[36m >>>>>>>>>>>>>>>>>>>>>>>>>>>>>> removing default nginx content <<<<<<<<<<<<<<<\e[0m"
rm -rf /usr/share/nginx/html/* &>>$log
func_exit_status

echo -e "\e[36m >>>>>>>>>>>>>>>>>>>> downloding roboshop frontent content <<<<<<<<<<<<<<<<</e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>$log
func_exit_status

echo -e "\e[36m >>>>>>>>>>>>>>>>>>>>>>>>> unzip the content >>>>>>>>>>>>>>>>/e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>$log
func_exit_status